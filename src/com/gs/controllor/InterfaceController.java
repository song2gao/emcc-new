package com.gs.controllor;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gs.domain.*;
import com.gs.fusioncharts.EchartsData;
import com.gs.fusioncharts.LineOption;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.gs.service.MonitorService;
import com.gs.service.coolsystem.CoolSystemService;
import com.gs.service.socket.SocketService;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/ic")
public class InterfaceController {
    @Autowired
    public MonitorService monitorService;
    @Autowired
    public SocketService socketService;
    @Autowired
    public CoolSystemService coolSystemService;

    /**
     * 跳转到节能控制系统--照明控制管理系统
     *
     * @param request
     * @return
     */
    @RequestMapping("/bulidinglist")
    public String tobulidinglist(HttpServletRequest request, HttpServletResponse response)throws IOException{
        response.setHeader("Access-Control-Allow-Headers", "X-Requested-With, accept, content-type, xxxx");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, PATCH");
        response.setHeader("Access-Control-Allow-Origin", "*");
        String pid=request.getParameter("id");
        List<PomsEnergyUsingLocation> list=monitorService.getOrganizationList(pid);
        JSONObject json = new JSONObject();
        json.put("code",0);
        json.put("list", list);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().println(json);
        return null;
    }
    /**
     * 跳转到节能控制系统--照明控制管理系统
     *
     * @param request
     * @return
     */
    @RequestMapping("/systemlist")
    public String toSystemlist(HttpServletRequest request, HttpServletResponse response)throws IOException{
        response.setHeader("Access-Control-Allow-Headers", "X-Requested-With, accept, content-type, xxxx");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, PATCH");
        response.setHeader("Access-Control-Allow-Origin", "*");
        String pid=request.getParameter("ID");
        String level=request.getParameter("EUS_LEVEL");
        List<PomsEnergyUsingSystem> list=monitorService.getSystemList(pid,level);
        JSONObject json = new JSONObject();
        json.put("code",0);
        json.put("list", list);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().println(json);
        return null;
    }
    /**
     * 跳转到节能控制系统--照明控制管理系统
     *
     * @param request
     * @return
     */
    @RequestMapping("/sumvalue")
    public String toSumValue(HttpServletRequest request, HttpServletResponse response)throws IOException{
        response.setHeader("Access-Control-Allow-Headers", "X-Requested-With, accept, content-type, xxxx");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, PATCH");
        response.setHeader("Access-Control-Allow-Origin", "*");
        String dateType=request.getParameter("dateType");
        String dateCode=request.getParameter("dateCode");
        String statisticsType=request.getParameter("statisticsType");
        String statisticsCode=request.getParameter("statisticsCode");
        JSONObject json = new JSONObject();
        ICSumValue sum=new ICSumValue();
        sum.setDateCode(dateCode);
        sum.setDateType(dateType);
        sum.setStatisticsCode(statisticsCode);
        sum.setStatisticsType(statisticsType);
        sum.seteSumValue(new BigDecimal("12321"));
        sum.seteUnit("kWh");
        sum.setwSumValue(new BigDecimal("123"));
        sum.setwUnit("t");
        sum.setfSumValue(new BigDecimal("11"));
        sum.setfUnit("m³");
        sum.setcSumValue(new BigDecimal("121"));
        sum.setcUnit("co/t");
        json.put("code",0);
        json.put("sum", sum);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().println(json);
        return null;
    }
    /**
     * 跳转到节能控制系统--照明控制管理系统
     *
     * @param request
     * @return
     */
    @RequestMapping("/pievalue")
    public String toPieValue(HttpServletRequest request, HttpServletResponse response)throws IOException{
        response.setHeader("Access-Control-Allow-Headers", "X-Requested-With, accept, content-type, xxxx");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, PATCH");
        response.setHeader("Access-Control-Allow-Origin", "*");
        String dateType=request.getParameter("dateType");
        String dateCode=request.getParameter("dateCode");
        String energyType=request.getParameter("energyType");
        String statisticsType=request.getParameter("statisticsType");
        JSONObject json = new JSONObject();
        ColumnValue columnValue=new ColumnValue();
        columnValue.setDateType(dateType);
        columnValue.setDateCode(dateCode);
        columnValue.setStatisticsType(statisticsType);
        columnValue.setEnergyType(energyType);
        Map<String,BigDecimal> map=new HashMap<>();
        map.put("1号馆",new BigDecimal("30"));
        map.put("2号馆",new BigDecimal("20"));
        map.put("4号馆",new BigDecimal("40"));
        map.put("5号馆",new BigDecimal("10"));
        columnValue.setColumnMap(map);
        columnValue.setUnit("%");
        json.put("code",0);
        json.put("columnValue",columnValue);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().println(json);
        return null;
    }
    /**
     * 跳转到节能控制系统--照明控制管理系统
     *
     * @param request
     * @return
     */
    @RequestMapping("/columnvalue")
    public String toColumnValue(HttpServletRequest request, HttpServletResponse response)throws IOException{
        response.setHeader("Access-Control-Allow-Headers", "X-Requested-With, accept, content-type, xxxx");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, PATCH");
        response.setHeader("Access-Control-Allow-Origin", "*");
        String dateType=request.getParameter("dateType");
        String dateCode=request.getParameter("dateCode");
        String energyType=request.getParameter("energyType");
        String statisticsType=request.getParameter("statisticsType");
        JSONObject json = new JSONObject();
        ColumnValue columnValue=new ColumnValue();
        columnValue.setDateType(dateType);
        columnValue.setDateCode(dateCode);
        columnValue.setStatisticsType(statisticsType);
        columnValue.setEnergyType(energyType);
        Map<String,BigDecimal> map=new HashMap<>();
        map.put("1号馆",new BigDecimal("1232"));
        map.put("2号馆",new BigDecimal("632"));
        map.put("4号馆",new BigDecimal("732"));
        map.put("5号馆",new BigDecimal("1332"));
        columnValue.setColumnMap(map);
        columnValue.setUnit("kWh");
        json.put("code",0);
        json.put("columnValue",columnValue);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().println(json);
        return null;
    }
    /**
     * 跳转到节能控制系统--照明控制管理系统
     *
     * @param request
     * @return
     */
    @RequestMapping("/dayline")
    public String toDayline(HttpServletRequest request, HttpServletResponse response)throws IOException{
        response.setHeader("Access-Control-Allow-Headers", "X-Requested-With, accept, content-type, xxxx");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, PATCH");
        response.setHeader("Access-Control-Allow-Origin", "*");
        String energyType=request.getParameter("ENERGY_TYPE");
        String dateCode=request.getParameter("DATE_CODE");
        String statisticsType=request.getParameter("statistics_type");
        String statisticsCode=request.getParameter("statistics_code");
        ICDayLine day=new ICDayLine();
        day.setEnergyCode(energyType);
        day.setDateCode(dateCode);
        day.setStatisticsType(statisticsType);
        day.setStatisticsCode(statisticsCode);
        BigDecimal[] yestoday=new BigDecimal[24];
        BigDecimal[] today=new BigDecimal[24];
        EchartsData data=new EchartsData();
        String[] cate=new String[]{"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17",
                "18", "19", "20", "21", "22", "23", "24"};
        String[] serrriName=new String[]{"今日","昨日"};
        day.setToday(today);
        day.setYestoday(yestoday);
        BigDecimal[][] datavalue=new BigDecimal[serrriName.length][cate.length];
        for(int i=0;i<serrriName.length;i++){
            for(int j=0;j<cate.length;j++){
                datavalue[i][j]=new BigDecimal("123.2");
            }
        }
        LineOption lineOption=data.getLineOption(cate,serrriName,datavalue);
        JSONObject json = new JSONObject();
        json.put("line", lineOption);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().println(json);
        return null;
    }
    /**
     * 跳转到节能控制系统--照明控制管理系统
     *
     * @param request
     * @return
     */
    @RequestMapping("/monthline")
    public String toMonthline(HttpServletRequest request, HttpServletResponse response)throws IOException{
        response.setHeader("Access-Control-Allow-Headers", "X-Requested-With, accept, content-type, xxxx");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, PATCH");
        response.setHeader("Access-Control-Allow-Origin", "*");
        String energyType=request.getParameter("ENERGY_TYPE");
        String dateCode=request.getParameter("DATE_CODE");
        String statisticsType=request.getParameter("statistics_type");
        String statisticsCode=request.getParameter("statistics_code");
        ICMonthLine month=new ICMonthLine();
        month.setEnergyCode(energyType);
        month.setDateCode(dateCode);
        month.setStatisticsType(statisticsType);
        month.setStatisticsCode(statisticsCode);
        month.setUnit("kWh");
        JSONObject json = new JSONObject();
        json.put("month", month);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().println(json);
        return null;
    }
    /**
     * 跳转到节能控制系统--照明控制管理系统
     *
     * @param request
     * @return
     */
    @RequestMapping("/yearline")
    public String toYearline(HttpServletRequest request, HttpServletResponse response)throws IOException{
        response.setHeader("Access-Control-Allow-Headers", "X-Requested-With, accept, content-type, xxxx");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, PATCH");
        response.setHeader("Access-Control-Allow-Origin", "*");
        String energyType=request.getParameter("ENERGY_TYPE");
        String dateCode=request.getParameter("DATE_CODE");
        String statisticsType=request.getParameter("statistics_type");
        String statisticsCode=request.getParameter("statistics_code");
        ICYearLine year=new ICYearLine();
        year.setEnergyCode(energyType);
        year.setDateCode(dateCode);
        year.setStatisticsType(statisticsType);
        year.setStatisticsCode(statisticsCode);
        year.setUnit("kWh");
        JSONObject json = new JSONObject();
        json.put("year", year);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().println(json);
        return null;
    }

    /**
     * 跳转到节能控制系统--照明控制管理系统
     *
     * @param request
     * @return
     */
    @RequestMapping("/bulidingData")
    public String tobulidingData(HttpServletRequest request, HttpServletResponse response)throws IOException{
        response.setHeader("Access-Control-Allow-Headers", "X-Requested-With, accept, content-type, xxxx");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, PATCH");
        response.setHeader("Access-Control-Allow-Origin", "*");

        String dataStr="[{" +
                "          \"open\": true," +
                "          \"label\": '体训中心'," +
                "\"id\":1," +
                "          \"children\": [{" +
                "            \"label\": '游泳跳水馆'," +
                "          },{" +
                "            \"label\": '武术体操馆'," +
                "          },{" +
                "            \"label\": '重竞技馆'," +
                "          },{\"label\": '综合球类馆',}," +
                "           { \"label\": '室内田径馆', }]" +
                "        }]";

        JSONObject json = new JSONObject();
        json.put("list", dataStr);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().println(json);
        return null;
    }
}
