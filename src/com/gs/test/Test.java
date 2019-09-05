package com.gs.test;


public class Test {
	
	public static String i="";

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ReadThread readThread=new ReadThread();
		readThread.start();
		TestThread test1=new TestThread();
		test1.setName("test1");
		test1.start();
		TestThread test2=new TestThread();
		test2.setName("test2");
		test2.start();
		TestThread test3=new TestThread();
		test3.setName("test3");
		test3.start();
		
		
	}

}
