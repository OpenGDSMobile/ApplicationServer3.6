package com.openGDSMobileApplicationServer.core.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.json.JSONArray;
import org.json.JSONObject; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.openGDSMobileApplicationServer.core.dao.OpenData;
import com.openGDSMobileApplicationServer.core.dao.impl.OpenGDSMobileTableDAO;
import com.openGDSMobileApplicationServer.core.service.OpenDataService;
import com.openGDSMobileApplicationServer.core.valueObject.CollectVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("Seoul")
public class SeoulOpenDataService extends EgovAbstractServiceImpl implements OpenDataService{

	@Autowired
	@Qualifier("seoulPublicDAO")
	OpenData publicDataobj;   
	/*
	private String serviceName = "TimeAverageAirQuality";
	private String serviceURL = null;
	private String[] resultJSONKeys = null;
	*/

    @Autowired
    OpenGDSMobileTableDAO dao;
    
    private String serviceURL = null;
	
    Logger log = LoggerFactory.getLogger(SeoulOpenDataService.class);
	
	@Override
	public Object requestRealtimeData(String name) {
        log.info("requestData :" + name);

        CollectVO serviceInfo = dao.findOneCollect(name);
        serviceURL = serviceInfo.getEp() + serviceInfo.getKeys();
        if ("TimeAverageAirQuality".equals(serviceInfo.getName())) {
            String curTime = this.getyyyyMMddHH00();
            serviceURL = serviceURL + curTime;
        } else if ("WPOSInformation".equals(serviceInfo.getName())) {
            String prevTime = this.getPrevyyyyMMdd();
            serviceURL = serviceURL + prevTime;
        }
		return null;
		
		
	/*	Iterator<?> it = data.keySet().iterator();
		serviceName = null;
		log.info(data);
		while(it.hasNext()){
			String tmp = (String) it.next();
			if(tmp.equals("serviceName")){
				serviceName = String.valueOf(data.get(tmp));
			}			
		} 
		if(serviceName.equals("TimeAverageAirQuality") || serviceName.equals("RealtimeRoadsideStation")){
			String baseURL = "http://openapi.seoul.go.kr:8088/";
			String[] urlOrder = 
					new String []{"serviceKey", "returnType", "serviceName", "amount", "dateTimeValue"};
			serviceURL=processServiceURL(data, urlOrder, baseURL);
			JSONObject jsonObj = publicDataobj.getJSON(serviceURL, "UTF-8");
			
			
			resultJSONKeys = new String[]{"MSRSTE_NM", (String) data.get("envType") };
		
			return processJSONbySeoulData(jsonObj, resultJSONKeys).toString();
		}
		return "";  */
	}
	
/*
	public String processServiceURL(JSONObject data, String[] urlOrder,String baseURL){
		String url = baseURL;
		int order = 0;
		for (int i=0; i<urlOrder.length; i++){
			Iterator<?> it = data.keySet().iterator();
			while(it.hasNext()){
				String key = (String) it.next();
				if (urlOrder[order].equals(key)){
					url += data.get(key) + "/";
					break;
				}
			}			
			order++;
		}
		log.info(url);
		return url;
	}
		
	public JSONObject processJSONbySeoulData(JSONObject data, String[] keys){
		log.info(data);
		JSONObject source = (JSONObject) data.get(serviceName);
		JSONArray rowList = (JSONArray) source.get("row");
		log.info(rowList);
		JSONObject result = new JSONObject();
		JSONArray list = new JSONArray();
		for(int i=0; i<rowList.length(); i++){
			JSONObject contents = (JSONObject) rowList.get(i);
			JSONObject obj = new JSONObject();
			for(int j=0; j<keys.length; j++){
				obj.put(keys[j], contents.get(keys[j]));				
			}
			list.put(obj);
		}
		result.put("row", list);
		log.info(source);
		log.info(result);
		return result;
	}
*/
	
	

    /**
     * getPrevyyyyMMdd
     * @return String "YYYYMMDD"
     */
    public String getPrevyyyyMMdd() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, -1);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        return dateFormat.format(calendar.getTime());
    }

    /**
     * getyyyyMMddHHMM
     * @return String yyyyMMddHHmm
     */
    public String getyyyyMMddHHMM() {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
        return dateFormat.format(calendar.getTime());
    }

    /**
     * getyyyyMMddHH00
     * @return String yyyyMMddHH00
     */
    public String getyyyyMMddHH00() {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
        String resultTime = dateFormat.format(calendar.getTime());
        int date = Integer.parseInt(resultTime.substring(0, resultTime.length()-4));
        int hour = Integer.parseInt(resultTime.substring(resultTime.length()-4, resultTime.length()-2));
        int minute = Integer.parseInt(resultTime.substring(resultTime.length()-2, resultTime.length()));
        if (minute < 40) {
            if (hour == 0) {
                hour = 23;
                calendar.add(Calendar.DATE, -1);
                SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyyMMdd");
                date = Integer.parseInt(dateFormatter.format(calendar.getTime()));
            } else {
                hour--;
            }

        }
        String stringHour = (hour < 10) ? "0" + Integer.toString(hour) : Integer.toString(hour);
        return Integer.toString(date) + stringHour + "00";
    }
	
}