package com.experian.bepartner.service;

import java.util.List;

import com.experian.bepartner.payload.Payload;
import com.experian.bepartner.payload.Third;
import com.experian.bepartner.payload.ThirdInfo;
import com.experian.bepartner.payload.ThirdModel;

public interface IThirdService {
	public Payload thirdModelCreate(ThirdModel thirdModel);

	public Payload thirdCreate(Third third);

	public Payload thirdInfoCreate(List<ThirdInfo> thirdInfo);

	public Payload findByIdentify(String idType, String identificationNumber);
}
