package br.com.ibict.acv.sicv.exception;

public class RegisterException extends Exception{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2674739434179959400L;

	public RegisterException( String message) {
		super(message); 
	}
	public RegisterException( String message, Throwable cause){
		super(message, cause);
	}

	public RegisterException(Throwable cause) {
		super(cause);
	}

}
