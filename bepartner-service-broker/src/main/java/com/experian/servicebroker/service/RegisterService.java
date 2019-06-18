package com.experian.servicebroker.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.RegisterModel;

@Service
public class RegisterService implements IRegisterService {

	@Autowired
	private RestTemplate restTemplate;

	@Override
	public Payload register(RegisterModel registerModel) {
		HttpEntity<RegisterModel> registerRequest = new HttpEntity<RegisterModel>(registerModel);
		Payload registerResponse = restTemplate.exchange("http://localhost:8080/api/userthird/create/", HttpMethod.POST,
				registerRequest, Payload.class).getBody();
		return registerResponse;
	}

}
