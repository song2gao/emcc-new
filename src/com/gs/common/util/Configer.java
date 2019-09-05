package com.gs.common.util;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Configer extends Properties {

	private static Configer configer = new Configer();
	
	public static Configer getInstance(){
		
		return configer;
	}
	
	private Configer(){
		 InputStream in =  this.getClass().getClassLoader().getResourceAsStream("/config.properties");
		 try {
			this.load(in);
		} catch (IOException e) {
			
		}
	}
}
