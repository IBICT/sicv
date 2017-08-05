package br.com.ibict.acv.sicv.util;

import java.util.Random;

import org.apache.shiro.crypto.hash.Sha512Hash;

/**
 * Responsible by manipulate and provide utilities concerning passwords
 * 
 * @author Wellington Stanley 
 */
public class Password {

    /**
	 * The possible characters for the password to create
	 */
	private static final String ALPHABET = "!0123456789ABCDEFGHIJKLMNOPQRSTUVWXYzabcdefghijklmnopqrstuvwxyz";
	
	/**
	 * Get a random salt password
	 * 
	 * @param length
	 *            count of characters
	 * @return created password with specified length
	 */
	public static String generateSalt( int length ) {
		Random rand = new Random();
		StringBuilder sb = new StringBuilder();
		for ( int i = 0; i < length; i++ ) {
			int pos = rand.nextInt( ALPHABET.length() );
			sb.append( ALPHABET.charAt( pos ) );
		}
		return sb.toString();
	}
	
	/**
	 * Get the encrypted password for password and hash salt
	 * 
	 * @param password
	 *            text password
	 * @param hashSalt
	 *            salt for the hash
	 * @return result hex string
	 */
	public static String getEncryptedPassword(String password, String hashSalt){
    	return  new Sha512Hash( password, hashSalt, 5 ).toHex();
    }
}
