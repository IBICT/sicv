package br.com.ibict.acv.sicv.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.openlca.olcatdb.conversion.Conversion;
import org.openlca.olcatdb.conversion.ConversionDispatch;
import org.openlca.olcatdb.conversion.XMLProcessFormat;
import org.openlca.olcatdb.database.Database;
import org.openlca.olcatdb.database.ElemFlowMap;
import org.openlca.olcatdb.templates.TemplateLoader;

/**
* Has functionalities about conversion files from ecospold2 to ILCD format.
* Generate .zip ILCD file which return to request caller.
* @see JAXBTest.class
* 
* @author Wellington Stanley - IBICT
*/
public class Spold2toILCD {
	private List <String> fileList = new ArrayList<String>();
    private String OUTPUT_ZIP_FILE = "";
    private String SOURCE_FOLDER = "";
    
    /**
	* Useful to receive file in spold2 format and translate to ILCD format. 
	* @param sourceFile original .spold or .xml file in ecosopold2 format.
	* @return file target in ILCD format.
	*/
	public File converter(File sourceFile) throws Exception {
		loadIni();
		//initialize db hsql 
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
		String targetName = FilenameUtils.removeExtension(sourceFile.getName());
		XMLProcessFormat targetFormat = XMLProcessFormat.ILCD;
		File targetDirectory = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator")+ 
				targetName+ System.getProperty("file.separator"));
		targetDirectory.mkdir();
		
		String lang = "en";
		boolean csvSplitCheckBox = false;
		try {
			Path path = Paths.get(targetDirectory.getAbsolutePath());

    		if (!Files.exists(path))
    			Files.createDirectory(path);
	
			ElemFlowMap.setIsProxy(false);
			//prepare the conversion
			Conversion conversion = ConversionDispatch.createConversion(
					sourceFile, targetDirectory, targetFormat,
					csvSplitCheckBox, lang, null);
			Thread thread = new Thread(conversion);
			//conversion run
			thread.start();
			thread.join();
			
		} catch (Exception ex) {
			new Exception("Problemas ao converter formato", ex);
		}
        try {
        	SOURCE_FOLDER = targetDirectory.getCanonicalPath()+ File.separator + "ILCD";
        	OUTPUT_ZIP_FILE = targetDirectory.getCanonicalPath()+".zip";
        	Thread.sleep(1000);
        	//generate FileList from source folder
            generateFileList(new File(SOURCE_FOLDER));
            //Zip all files to output zip file 
            zipIt(OUTPUT_ZIP_FILE);
        }catch (Exception e) {
			new Exception("erro ao zippar", e);
		}
        
        FileUtils.deleteDirectory(targetDirectory);
		return new File(OUTPUT_ZIP_FILE);
	}

	/**
	* Loads the initialization file.
	* @throws IOException 
	*/
	public void loadIni() throws IOException {
		String path = this.getClass().getClassLoader().getResource("conversor/config").getPath();
		String dbPath = path + System.getProperty("file.separator") + "database";
		String templatesPath = path + System.getProperty("file.separator") + "templates";
		try {
			Database.setFolder(new File(dbPath));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			new Exception("Erro ao carregar banco de conversão", e);
		}
		TemplateLoader.setTemplateFolder(templatesPath);
	}
	
	/**
	* Generate the zip file.
	* @param zipFile name of zip target.
	* @return void
	*/
    public void zipIt(String zipFile) {
        byte[] buffer = new byte[1024];
        String source = new File(SOURCE_FOLDER).getName();
        FileOutputStream fos = null;
        ZipOutputStream zos = null;
        try {
            fos = new FileOutputStream(zipFile);
            zos = new ZipOutputStream(fos);

            FileInputStream in = null;

            for (String file: this.fileList) {
                ZipEntry ze = new ZipEntry(source + File.separator + file);
                zos.putNextEntry(ze);
                try {
                    in = new FileInputStream(SOURCE_FOLDER + File.separator + file);
                    int len;
                    while ((len = in .read(buffer)) > 0) {
                        zos.write(buffer, 0, len);
                    }
                } finally {
                    in.close();
                }
            }

            zos.closeEntry();
            System.out.println("Folder successfully compressed");

        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            try {
                zos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void generateFileList(File node) {
        // add file only
        if (node.isFile()) {
            fileList.add(generateZipEntry(node.toString()));
        }

        if (node.isDirectory()) {
            String[] subNote = node.list();
            for (String filename: subNote) {
                generateFileList(new File(node, filename));
            }
        }
    }

    private String generateZipEntry(String file) {
        return file.substring(SOURCE_FOLDER.length() + 1, file.length());
    }
	
}
