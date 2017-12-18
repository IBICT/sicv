package br.com.ibict.acv.sicv.exception;

public class ProfileException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1079290598036299542L;

	public ProfileException( String message) {
		super(message); 
	}
	public ProfileException( String message, Throwable cause){
		super(message, cause);
	}

	public ProfileException(Throwable cause) {
		super(cause);
	}
}
