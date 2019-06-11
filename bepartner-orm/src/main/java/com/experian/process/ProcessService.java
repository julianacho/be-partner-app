package com.experian.process;

import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProcessService implements IProcessService {

	
	@Autowired
	private IUtilProcedure iUtilProcedure;
	
	@Override
	public Object callProcedure(DataSource datasource, String procedureName, Map<String, Object> parameters, Class<?> classreturn) {
		iUtilProcedure.setDatasource(datasource);
		return iUtilProcedure.callProcedure(procedureName, parameters,classreturn);

	}

	@Override
	public Object callFunction(DataSource datasource, String functionName, Map<String, Object> parameters,
			Class<?> classreturn) {
		iUtilProcedure.setDatasource(datasource);
		return iUtilProcedure.callFunction(functionName, parameters, classreturn);
	}

}
