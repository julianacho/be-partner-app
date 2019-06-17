package com.experian.bepartner.dal;

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
import org.springframework.transaction.annotation.Transactional;

import com.experian.bepartners.payload.Product;
import com.experian.process.IProcessService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
@Transactional
public class ProductDal implements IProductDal {

	private static final Logger logger = LoggerFactory.getLogger(ProductDal.class);

	@PersistenceContext(unitName = "bepartnersUnit")
	private EntityManager bepartnersEntityManager;

	@Autowired
	@Qualifier("bepartnersDataSource")
	private DataSource dataSource;

	@Autowired
	private IProcessService iProcessService;

	@Override
	public Object mpProductCreate(Product producto, String message) throws Exception{
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("V_Name", producto.getVName());
		parameters.put("V_Id_Product_Type", producto.getVIdProductType());
		parameters.put("V_ProductCode", producto.getVProductcode());
		parameters.put("V_Description", producto.getVDescription());

		Object object = iProcessService.callProcedure(dataSource, "MP_create_product", parameters, Object.class);

		logger.debug("ProductDal.paCrearProducto {}", object);
		
		return object;

	}

}
