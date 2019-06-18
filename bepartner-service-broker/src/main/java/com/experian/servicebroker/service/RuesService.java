package com.experian.servicebroker.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.experian.bepartner.enums.RuesResponseEnum;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.Rows;
import com.experian.bepartners.payload.RuesRequest;
import com.experian.bepartners.payload.RuesResponse;

@Service
public class RuesService implements IRuesService {

	@Autowired
	private RestTemplate restTemplate;

	@Override
	public Payload requestRues(RuesRequest ruesRequest) {
		try {
			HttpEntity<RuesRequest> rues = new HttpEntity<RuesRequest>(ruesRequest);
			RuesResponse responseBody = restTemplate
					.exchange("http://www.rues.org.co/RM/ConsultaNIT_json", HttpMethod.POST, rues, RuesResponse.class)
					.getBody();
			if (responseBody.getCodigo_error().equals("0000")) {
				if (responseBody.getRows() != null && responseBody.getRows().length > 0) {
					Rows row = responseBody.getRows()[0];
					if (row.getEstado().equals("ACTIVA")) {
						return new Payload(HttpStatus.ACCEPTED, RuesResponseEnum.APROBADO.getValue());
					} else {
						return new Payload(HttpStatus.ACCEPTED, RuesResponseEnum.RECHAZADO.getValue());
					}
				} else {
					return new Payload(HttpStatus.ACCEPTED, RuesResponseEnum.IDENTIFICACION_NO_EXISTE.getValue());
				}
			} else {
				return new Payload(HttpStatus.ACCEPTED, RuesResponseEnum.IDENTIFICACION_NO_EXISTE.getValue());
			}
		} catch (Exception e) {
			return new Payload(HttpStatus.CONFLICT, RuesResponseEnum.ERROR_CONSULTA.getValue());
		}
	}

}
