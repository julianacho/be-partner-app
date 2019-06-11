package com.experian.bepartner.dal;

import com.experian.bepartner.payload.Product;

public interface IProductDal {
	
	public Object mpProductCreate(Product producto,String message);
}
