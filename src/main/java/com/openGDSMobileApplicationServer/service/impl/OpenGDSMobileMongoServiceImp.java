package com.openGDSMobileApplicationServer.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

@Service
public class OpenGDSMobileMongoServiceImp {
	
	@Autowired
	OpenGDSMobileMongoDAO dao;
	  public List<Object> findAllCollection(String name){
	        return dao.findAll(name);

	    }

	    public List<Object> findFieldCollection(String name, String fieldName){
	        return dao.findFieldQuery(name, fieldName);

	    }

	    public Object findFirstCollection(String name){
	        return dao.findFirstQuery(name);
	    }


	    public Object queryWhereCollection(String name, String queryType, String field, String value, String sFields,String unwind){
	        List<DBObject> result = new ArrayList<DBObject>();
	        String[] queryTypes = queryType.split(",");
	        String[] searchFields = field.split(",");
	        String[] values = value.split(",");
	        String[] specFields = null;

	        if(sFields != null){
	            specFields = sFields.split(",");
	        }
	        if (queryTypes.length == 1) {
	            return dao.findWhereQuery(name, queryType, field, value, specFields);
	        } else {
	            if (unwind != null) {
	                result.add(new BasicDBObject("$unwind", "$" + unwind));
	            }
	            for (int i=0; i<queryTypes.length; i++){
	                String type = confimQueryType(queryTypes[i]);
	                String key = searchFields[i];
	                String v = values[i];
	                result.add(new BasicDBObject("$match",
	                        new BasicDBObject(key,
	                        new BasicDBObject(type, v)
	                        )));
	            }
	            if(specFields != null){
	                BasicDBObject project = new BasicDBObject();
	                BasicDBObject content = new BasicDBObject();
	                for (String v : specFields){
	                    String[] proValue = v.split("\\.");
	                    if (proValue.length != 1){
	                        String tmpValue = proValue[proValue.length-1];
	                        content.put(tmpValue, "$" + v);
	                    }else {
	                        content.put(v, "$" + v);
	                    }

	                }
	                project.put("$project", content);
	                result.add(project);
	            }
	            List<Object> dbQueryResult = dao.findWhereMultiQuery(name, result);
	            List<BasicDBObject> root = new ArrayList<BasicDBObject>();
	            root.add(new BasicDBObject(unwind, dbQueryResult));
	            return root;
	        }
	    }

	    public String confimQueryType(String s){
	        if (s.equals("=")){
	            return "$eq";
	        } else if (s.equals(">=") || s.equals("&gt;=")){
	            return "$gte";
	        } else if (s.equals(">")|| s.equals("&gt;")){
	            return "$gt";
	        } else if (s.equals("<")|| s.equals("&lt;")){
	            return "$lt";
	        } else if (s.equals("<=")|| s.equals("&lt;=")){
	            return "$lte";
	        }
	        return null;
	    }
	    public Object findValuesCollection(String name, String key){
	        return dao.findValueSearchQuery(name, key);

	    }
}
