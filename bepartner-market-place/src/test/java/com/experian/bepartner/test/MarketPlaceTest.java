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
import com.experian.bepartner.dao.IProductDao;
import com.experian.bepartner.dao.ProductDao;
import com.experian.bepartner.payload.Producto;
import com.experian.bepartners.config.BepartnersDataSourceConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { AppConfig.class,BepartnersDataSourceConfig.class})
@EnableJpaRepositories(basePackages = { "com.experian.process" })
public class MarketPlaceTest {

	@Autowired
	private IProductDao iProductDao;

	@Test
	public void testA() {
		Producto producto = new Producto();
		producto.setVProductcode("FH-2314");
		producto.setVDescription("Producto FH-2314");
		producto.setVName("Producto FH-2314");
		producto.setVIdProductType("TYPE FH-2314");

		iProductDao.paCrearProducto(producto, "");
		assertEquals(0, 0);
	}

}
