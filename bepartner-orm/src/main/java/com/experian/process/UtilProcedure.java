package com.experian.process;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
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
	public Object callProcedure(String procedureName, Map<String, Object> parameters, Class<?> classreturn) {
		simpleJdbcCall.withProcedureName(procedureName);
		RowMapper<Object> rowMapper = new RowMapper<Object>() {
			
			@Override
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new Object[] { rowNum, rs.getInt(1) };
			}
		};
		simpleJdbcCall.returningResultSet("RESULTADO", rowMapper);
		
        MapSqlParameterSource inParams = new MapSqlParameterSource();
        if(null!=parameters) {
            for (Map.Entry<String, Object> parameter : parameters.entrySet()) {
                inParams.addValue(parameter.getKey(), parameter.getValue());
            }
        }
        
        logger.info("PROCEDURE {} IS CALLED",procedureName);
        return simpleJdbcCall.execute(inParams);

	}

	@Override
	public Object callFunction(String functionName, Map<String, Object> parameters, Class<?> classreturn) {
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
