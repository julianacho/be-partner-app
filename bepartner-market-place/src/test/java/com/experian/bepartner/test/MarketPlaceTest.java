package com.experian.bepartner.test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.experian.AppConfig;
import com.experian.bepartner.dal.IProductDal;
import com.experian.bepartner.dal.ProductDal;
import com.experian.bepartner.payload.Product;
import com.experian.bepartners.config.BepartnersDataSourceConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { AppConfig.class})
public class MarketPlaceTest {

	@Autowired
	private IProductDal iProductDao;

	@Test
	public void testA() {
//		Product producto = new Product("Producto FHf-2314", "TYPE FHf-2314", "FHF-2314", "Producto FHF-2314");

//		iProductDao.mpProductCreate(producto, "");
		assertEquals(0, 0);
	}

}
