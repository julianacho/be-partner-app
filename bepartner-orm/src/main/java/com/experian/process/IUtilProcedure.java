package com.experian.process;

import java.util.Map;

import javax.sql.DataSource;

public interface IUtilProcedure {

	public void setDatasource(DataSource datasource);
	
	public Object callProcedure(String procedureName, Map<String,Object> parameters, Class<?> classreturn);
	
	public Object callFunction(String functionName, Map<String,Object> parameters, Class<?> classreturn);
}
