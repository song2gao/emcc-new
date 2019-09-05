package com.gs.common.util;

import java.util.ArrayList;

import com.gs.domain.HistoryTableData;

/** 
* @Package:com.gs.common.util 
* @author:  ybzhu
* @version:2017年12月15日 下午3:44:27 
* @描述： 
 * @param <E>
*/
public class ChangArray<E> extends ArrayList<E>{
	public boolean add(E e) {  
        if(e instanceof HistoryTableData){  
        	HistoryTableData u = (HistoryTableData)e;  
            for(int i=0;i<super.size();i++){  
            	HistoryTableData t = (HistoryTableData)super.get(i);  
                if(u.equals(t)){ 
//                	t.calValue;
//                    t.getCalValue()=t.getCalValue()+u.getCalValue();  
                    return true;  
                }  
            }  
        }  
        return super.add(e);  
    }  
	
	

}
