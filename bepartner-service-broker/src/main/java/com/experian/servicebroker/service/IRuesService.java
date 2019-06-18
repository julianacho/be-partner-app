package com.experian.servicebroker.service;

import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.RuesRequest;

public interface IRuesService {
	
	public Payload requestRues(RuesRequest ruesRequest);

}
