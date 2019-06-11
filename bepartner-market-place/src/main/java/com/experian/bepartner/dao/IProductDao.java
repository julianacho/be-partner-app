package com.experian.bepartner.dao;

import com.experian.bepartner.payload.Producto;

public interface IProductDao {
	
	public void paCrearProducto(Producto producto,String message);
}
