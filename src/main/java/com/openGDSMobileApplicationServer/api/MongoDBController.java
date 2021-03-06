package com.openGDSMobileApplicationServer.api;
 
import com.openGDSMobileApplicationServer.service.impl.OpenGDSMobileMongoServiceImp;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by intruder on 16. 8. 13.
 */
@RestController
@RequestMapping("/api/MongoDB")
public class MongoDBController {

    @Autowired
    OpenGDSMobileMongoServiceImp service;

    @RequestMapping (value="/{name}.do", method = {RequestMethod.GET})
    public List<Object> findAllCollection(@PathVariable String name){
        return service.findAllCollection(name);
    }


    /**
     *
     * @param name collection name
     * @param fieldName key value
     * @return
     */
    @RequestMapping (value="/{name}/{fieldName}.do", method = {RequestMethod.GET})
    public List<Object> findAllFieldCollection(@PathVariable String name, @PathVariable String fieldName){
        return service.findFieldCollection(name, fieldName);
    }

    /**
     *
     * @param name  get first value
     * @return
     */
    @RequestMapping (value="/selectOne/{name}.do", method = {RequestMethod.GET})
    public Object findFirstCollection(@PathVariable String name){

        return service.findFirstCollection(name);
    }

    /**
     *
     * @param request  get Value based on (collection name, key)
     * @return
     */
    @RequestMapping (value="/getValues.do", method = {RequestMethod.GET})
    public Object runCommandGetValues(HttpServletRequest request){
        String name = request.getParameter("name");
        String key = request.getParameter("key");
        return service.findValuesCollection(name, key);
    }

    /**
     *
     * @param name
     * @param request [query type{is(=), gt(>), gte(>=), lt(<), lte(<=)}:queryType, search field:field, value:value,
     *                (option) specific fields:sFields]
     * @return
     */
    @RequestMapping (value="/query/{name}.do", method = {RequestMethod.GET})
    public Object queryCollection(@PathVariable("name") String name, HttpServletRequest request){
        String queryType = request.getParameter("queryType");
        String field = request.getParameter("field");
        String value = request.getParameter("value");
        String sFields = request.getParameter("sFields");
        String unwind = request.getParameter("unwind");
        System.out.println(value);
        return service.queryWhereCollection(name, queryType, field, value, sFields, unwind);
    }

}
