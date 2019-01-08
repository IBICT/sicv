package sicv;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import org.apache.http.HttpException;
import org.junit.Test;

import br.com.ibict.acv.sicv.util.ConversorUtil;

/**
 * converter
 */
public class ConversorTest {

    public void testConversor() throws HttpException, IOException {
        ConversorUtil conv = new ConversorUtil("http://localhost:8000/file/", "http://localhost:8080/api/");

        File f = conv.fullConversion("sugarcane.spold");
        System.out.println(f.getAbsolutePath());
    }

    
}
