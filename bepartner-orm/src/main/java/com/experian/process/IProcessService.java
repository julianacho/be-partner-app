package com.experian.process;

import java.util.Map;

import javax.sql.DataSource;

import com.fasterxml.jackson.core.type.TypeReference;

public interface IProcessService {

	public Object callProcedure(DataSource datasource,String procedureName, Map<String, Object> parameters, Class<?> classreturn)throws Exception;
	
	public <T> Object callProcedureResultToJson(DataSource datasource,String procedureName, Map<String, Object> parameters, Class<?> classreturn)throws Exception;
	
	public Object callFunction(DataSource datasource,String functionName, Map<String, Object> parameters, Class<?> classreturn)throws Exception;
}
