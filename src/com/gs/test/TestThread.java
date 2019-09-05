package com.gs.test;

public class TestThread extends Thread {
	
	private int i=0;
	
	public void run(){
		while(i<10){
			System.out.println(this.getName()+":"+i);
			i++;
			Test.i=this.getName()+":"+i;
		}
	}

}
