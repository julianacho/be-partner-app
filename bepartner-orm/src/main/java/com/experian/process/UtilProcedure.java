package com.experian.process;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Service;

@Service
public class UtilProcedure implements IUtilProcedure {

	Logger logger = LoggerFactory.getLogger(UtilProcedure.class);
    private SimpleJdbcCall simpleJdbcCall;
    
	@Override
	public void setDatasource(DataSource datasource) {
		this.simpleJdbcCall =new SimpleJdbcCall(datasource);
		logger.info("INJECT CONNECTION");
	}

	@Override
	public Object callProcedure(String procedureName, Map<String, Object> parameters, Class<?> classreturn) throws Exception{
		logger.info("UtilProcedure.callProcedure : {}",parameters);
		
		simpleJdbcCall.withProcedureName(procedureName);
		SqlParameterSource in = new MapSqlParameterSource(parameters);
		
		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
		
		
		logger.info("UtilProcedure.callProcedure - Result : {}",simpleJdbcCallResult);
		
        return simpleJdbcCallResult.get("#result-set-1");

	}

	@Override
	public Object callFunction(String functionName, Map<String, Object> parameters, Class<?> classreturn) throws Exception{
		simpleJdbcCall.withFunctionName(functionName);
        simpleJdbcCall.withReturnValue();
        MapSqlParameterSource inParams = new MapSqlParameterSource();
        if(null!=parameters) {
            for (Map.Entry<String, Object> parameter : parameters.entrySet()) {
                inParams.addValue(parameter.getKey(), parameter.getValue());
            }
        }
        logger.info("FUNCTION {} IS CALLED",functionName);
        return simpleJdbcCall.executeFunction(classreturn,inParams);
	}

}
