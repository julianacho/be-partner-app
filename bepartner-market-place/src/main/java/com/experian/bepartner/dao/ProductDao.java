package com.experian.bepartner.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.experian.bepartner.payload.Producto;
import com.experian.process.IProcessService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Service
public class ProductDao implements IProductDao {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductDao.class);
	
	@PersistenceContext(unitName = "bepartnersUnit")
    private EntityManager bepartnersEntityManager;

	
    private DataSource dataSource;
	
    @Autowired
    @Qualifier("bepartnersDataSource")
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}



	@Autowired
	private IProcessService iProcessService;
	


	@Override
	public void paCrearProducto(Producto producto, String message) {
		Map<String, Object> parameters=new HashMap<String, Object>();
		parameters.put("V_Name", producto.getVName());
		parameters.put("V_Id_Product_Type", producto.getVIdProductType());
		parameters.put("V_ProductCode", producto.getVProductcode());
		parameters.put("V_Description", producto.getVDescription());
		Object object=iProcessService.callProcedure(dataSource,"pa_crear_producto", parameters,Object.class);
		
		logger.debug("MESSAGE RETURNED {}",object);
		
		
	}
	

}
