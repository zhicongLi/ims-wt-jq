package com.ims.jq.interceptor;

/**
 * Created by topud on 2016-7-25.
 */
public class TrepsException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public final static String ERROR = "E";
	public final static String INFO = "I";
	public final static String WARN = "W";
	
    private String type;

    public String getType() {
    	
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public TrepsException()  {}                //用来创建无参数对象
    public TrepsException(String type,String message) {        //用来创建指定参数对象
        super(message);
        this.setType(type);
    }
    public TrepsException( String message) {        //用来创建指定参数对象
        super(message);
        this.setType(ERROR);
    }
    public TrepsException(String message,Throwable cause){
    	super(message,cause);
    	this.setType(ERROR);
    }
}
