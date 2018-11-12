package sicv;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.FileUtils;
import org.junit.Test;
import org.openlca.olcatdb.conversion.Conversion;
import org.openlca.olcatdb.conversion.ConversionDispatch;
import org.openlca.olcatdb.conversion.XMLProcessFormat;
import org.openlca.olcatdb.database.Database;
import org.openlca.olcatdb.database.ElemFlowMap;
import org.openlca.olcatdb.templates.TemplateLoader;

public class JAXBTest {
	private List <String> fileList = new ArrayList<String>();
    private String OUTPUT_ZIP_FILE = "";
    private String SOURCE_FOLDER = "";
    File targetDirectory = null;
	/*	banco hsqldb é embutido. Ele é usado para fazer o mapeamento das entidades 
	de um formato para outro. Os dados são armazenados como arquivos CSV de texto 
	simples	e são contidos nesse repositorio. Os data sets são convertidos usando 
	os templates do Velocity (http://velocity.apache.org/). Os schemas, stylesheets
	e outros arquivos de difentes formatos de dados estão contidos nele. Outros
	recursos adicionais podem ser encontrados em ./src/main/resources/conversor.
	 */
    @Test
	public void testConversionES2toILCD() throws Exception {
		String path = this.getClass().getClassLoader().getResource("conversor/config").getPath();
		String dbPath = path + System.getProperty("file.separator") + "database";
		String templatesPath = path + System.getProperty("file.separator") + "templates";
		Database.setFolder(new File(dbPath));
		TemplateLoader.setTemplateFolder(templatesPath);
		Thread databaseThread = new Thread(new Runnable() {
		@Override
		public void run() {
			try {
				Database.getInstance();
				TemplateLoader.getInstance();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		});

		databaseThread.start();
	
		XMLProcessFormat targetFormat = XMLProcessFormat.ILCD;
		File sourceFile = new File("/home/ibict/Documentos/sugarcane production, BR-SP, 2012 - 2018.spold");
		targetDirectory = new File("/home/ibict/Transferências/teste");
		targetDirectory.mkdir();
		String lang = "en";
		boolean csvSplitCheckBox = false;
		OUTPUT_ZIP_FILE = "/home/ibict"+ File.separator + "teste.zip";
		SOURCE_FOLDER = targetDirectory.getCanonicalPath();
		try {
			ElemFlowMap.setIsProxy(false);
	
			Conversion conversion = ConversionDispatch.createConversion(
					sourceFile, targetDirectory, targetFormat,
					csvSplitCheckBox, lang, null);
			Thread thread = new Thread(conversion);
			thread.start();
			thread.join();
		

		} catch (Exception ex) {
			new Exception("Problemas ao converter formato", ex);
			//ex.printStackTrace();
		}
		Thread.sleep(1000);
		generateFileList(targetDirectory.getAbsoluteFile());
		zipIt(OUTPUT_ZIP_FILE);
		FileUtils.deleteDirectory(targetDirectory);
		assertTrue(true);

	}
	
	/**
	 * Zip it
	 * @param zipFile output ZIP file location
	 */
	public void zipIt(String zipFile){
	
	 byte[] buffer = new byte[1024];
		
	 try{
			
		FileOutputStream fos = new FileOutputStream(zipFile);
		ZipOutputStream zos = new ZipOutputStream(fos);
			
		System.out.println("Output to Zip : " + zipFile);
			
		for(String file : this.fileList){
				
			System.out.println("File Added : " + file);
			ZipEntry ze= new ZipEntry(file);
	    	zos.putNextEntry(ze);
	           
	    	FileInputStream in = new FileInputStream(SOURCE_FOLDER + File.separator + file);
	   	   
	    	int len;
	    	while ((len = in.read(buffer)) > 0) {
	    		zos.write(buffer, 0, len);
	    	}
	           
	    	in.close();
		}
			
		zos.closeEntry();
		//remember close it
		zos.close();
	      
		System.out.println("Done");
	    }catch(IOException ex){
	       ex.printStackTrace();   
	    }
	   }
	    
	    /**
	 * Traverse a directory and get all files,
	 * and add the file into fileList  
	 * @param node file or directory
	 */
	public void generateFileList(File node){
	
		//add file only
		if(node.isFile()){
			fileList.add(generateZipEntry(node.getAbsoluteFile().toString()));
		}
			
		if(node.isDirectory()){
			String[] subNote = node.list();
			for(String filename : subNote){
				generateFileList(new File(node, filename));
			}
		}
	 
	    }
	
	    /**
	 * Format the file path for zip
	 * @param file file path
	 * @return Formatted file path
	 */
	private String generateZipEntry(String file){
		return file.substring(SOURCE_FOLDER.length()+1, file.length());
	}
	
}