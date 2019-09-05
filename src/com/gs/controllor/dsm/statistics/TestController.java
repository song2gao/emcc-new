package com.gs.controllor.dsm.statistics;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @Package:com.gs.controllor.dsm.statistics
 * @author: ybzhu
 * @version:2018年1月17日 下午1:16:04 @描述：
 */
public class TestController {
	public static void main(String args[]){
        
        display("2008-08-08", "2008-08-24");
         
    }
     
    public static String[] display(String dateFirst, String dateSecond){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String[] arr=new String[10];
        try{
            Date dateOne = dateFormat.parse(dateFirst);
            Date dateTwo = dateFormat.parse(dateSecond);
             
            Calendar calendar = Calendar.getInstance();
             
            calendar.setTime(dateOne);
            int i=0;
            while(calendar.getTime().before(dateTwo)){               
                //System.out.println(dateFormat.format(calendar.getTime()));
                String time=dateFormat.format(calendar.getTime());
                arr[i]=time;
                i++;
                calendar.add(Calendar.DAY_OF_MONTH, 1);               
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
		return arr;
         
    }
}
