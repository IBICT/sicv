package br.com.ibict.acv.sicv.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.regex.Pattern;

import org.springframework.web.multipart.MultipartFile;

/**
 * SpoldInputFixer
 */
public class SpoldInputFixer {

    private static final Pattern PATTERN_COMMA = Pattern.compile("(\\d),(\\d)"); 
    private static final Pattern PATTERN_PERCENTAGE = Pattern.compile("((?:\\d)(?:.\\d)?(?:\\d)*)%"); 

    public void fixErrorsAndSave(MultipartFile input, File output) throws IOException {
        InputStream is = input.getInputStream();
        BufferedReader bufRead = new BufferedReader(new InputStreamReader(is));
        BufferedWriter bufWrite = new BufferedWriter(new FileWriter(output));
        String ln = null;

        while ((ln = bufRead.readLine()) != null) {
            ln = fixComma(ln);
            ln = fixPercentage(ln);

            bufWrite.write(ln);
            bufWrite.newLine();
        }

        bufWrite.close();
        bufRead.close();
    }

    /* Replaces commas in decimal numbers to dots.
     * @param in: String to be fixed
     * @returns the same string, with all decimal numbers now using dots.
    */
    public String fixComma(String in) {
        return PATTERN_COMMA.matcher(in).replaceAll("$1.$2");
    }

    /* Replaces percentages with "/100"
     * @param in: String to be fixed
     * @returns the same string, with all numerical percentages now replaced with "(number)/100"
    */
    public String fixPercentage(String in) {
        return PATTERN_PERCENTAGE.matcher(in).replaceAll("$1/100");
    }

    
}