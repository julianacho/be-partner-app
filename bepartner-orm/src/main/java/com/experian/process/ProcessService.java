package com.experian.process;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ProcessService implements IProcessService {
	
	@Autowired
	private IUtilProcedure iUtilProcedure;
	
	@Override
	public Object callProcedure(DataSource datasource, String procedureName, Map<String, Object> parameters, Class<?> classreturn) throws Exception{
		iUtilProcedure.setDatasource(datasource);
		return iUtilProcedure.callProcedure(procedureName, parameters,classreturn);
	}

	@Override
	public Object callFunction(DataSource datasource, String functionName, Map<String, Object> parameters,
			Class<?> classreturn)throws Exception {
		iUtilProcedure.setDatasource(datasource);
		return iUtilProcedure.callFunction(functionName, parameters, classreturn);
	}

	@Override
	public <T> Object callProcedureResultToJson(DataSource datasource, String procedureName, Map<String, Object> parameters,
			Class<?> classreturn) throws Exception{
		return callProcedure(datasource, procedureName, parameters, Object.class);	
	}
}
