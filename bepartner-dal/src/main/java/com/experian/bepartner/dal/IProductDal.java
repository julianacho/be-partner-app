package com.experian.bepartner.dal;

import com.experian.bepartners.payload.Product;

public interface IProductDal {
	
	public Object mpProductCreate(Product producto,String message) throws Exception;
}
