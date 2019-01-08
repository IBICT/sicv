package br.com.ibict.acv.sicv.util;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import org.apache.http.HttpException;


/**
 * This class calls the server that does the conversion between the EcoSpold2
 * and ILCD formats.
 * 
 * @author Lucas Amaral
 */
public class ConversorUtil {

    private String FILE_SOURCE_URL;

    private String CONVERSOR_URL;

    public ConversorUtil() {
        String fileSource = System.getenv("SICV_URL");
        if (fileSource == null || fileSource.isEmpty()) {
            fileSource = "http://localhost:8080/spold/";
        } 

        String conversor = System.getenv("SICV_CONVERSOR_URL");
        if (conversor == null || conversor.isEmpty()) {
            conversor = "http://localhost:8081/api/";
        }

        this.FILE_SOURCE_URL = fileSource;
        this.CONVERSOR_URL = conversor;
    }

    public ConversorUtil(String fileSourceURL, String conversorUrl) {
        this.FILE_SOURCE_URL = fileSourceURL;
        this.CONVERSOR_URL = conversorUrl;
    }

    public File fullConversion(String fileName) throws HttpException, IOException, URISyntaxException {

        String zipName = sendEcospold(fileName);

        return getILCD(zipName);

    }

    private String sendEcospold(String fileName) throws HttpException, IOException, URISyntaxException {
        URL urlLink = new URL(CONVERSOR_URL + "convert");
        HttpURLConnection con = (HttpURLConnection) urlLink.openConnection();
        con.setRequestMethod("POST");
        con.setDoOutput(true);
        con.setRequestProperty("Content-Type", "application/json");

        Gson gson = new Gson();
        Map<String, String> map = new HashMap<String, String>();
        URL url = new URL(FILE_SOURCE_URL + fileName.substring(0, fileName.length() - 6));
        URI uri = new URI(url.getProtocol(), url.getUserInfo(),
            url.getHost(), url.getPort(), url.getPath(), url.getQuery(),
            url.getRef());
        map.put("url", uri.toASCIIString());
        map.put("sourceFormat", "EcoSpold 2");
        map.put("targetFormat", "ILCD");
        map.put("refSystem", "es2");

        // System.out.println(map);

        con.connect();

        String json = gson.toJson(map);
        try (OutputStream os = con.getOutputStream()) {
            os.write(json.getBytes());
            os.close();
        }
        

        int status = con.getResponseCode();
        if (status >= 400) {
            throw new HttpException(new String(CONVERSOR_URL + ": " + status));
        }

        BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
        StringBuilder builder = new StringBuilder();
        String inputLine = new String();

        while ((inputLine = reader.readLine()) != null) {
            builder.append(inputLine);
        }

        Gson response = new Gson();
        Map<String, String> responseMap = new HashMap<String, String>();
        responseMap = (Map<String, String>) gson.fromJson(builder.toString(), responseMap.getClass());

        con.disconnect();

        return responseMap.get("zipFile");

    }

    private File getILCD(String zipName) throws IOException {

        URL ilcdURL = new URL(CONVERSOR_URL + "result/" + zipName);
        HttpURLConnection conGET = (HttpURLConnection) ilcdURL.openConnection();
        conGET.setRequestMethod("GET");
        InputStream ilcdReader = conGET.getInputStream();

        ByteArrayOutputStream result = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int length;
        while ((length = ilcdReader.read(buffer)) != -1) {
            result.write(buffer, 0, length);
        }
        ilcdReader.close();

    	String separator = System.getProperty("file.separator");
        File outputFile = File.createTempFile(zipName, ".zip", null);
        outputFile.deleteOnExit();

        FileOutputStream outputStream = new FileOutputStream(outputFile);
        result.writeTo(outputStream);
        outputStream.close();

        return outputFile;
    }

}
