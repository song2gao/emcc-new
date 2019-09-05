package com.gs.test;

public class ReadThread extends Thread {
	public void run(){
		while(true){
			System.out.println("read:"+Test.i);
		}
	}
}
