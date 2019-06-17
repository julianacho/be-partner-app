package com.experian.bepartner.service;

import java.util.List;

import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.Third;
import com.experian.bepartners.payload.ThirdInfo;
import com.experian.bepartners.payload.ThirdModel;

public interface IThirdService {
	public Payload thirdModelCreate(ThirdModel thirdModel);

	public Payload thirdCreate(Third third);

	public Payload thirdInfoCreate(List<ThirdInfo> thirdInfo);

	public Payload findByIdentify(String idType, String identificationNumber);
}
