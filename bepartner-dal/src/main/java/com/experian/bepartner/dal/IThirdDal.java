package com.experian.bepartner.dal;

import java.util.List;

import com.experian.bepartners.payload.Third;
import com.experian.bepartners.payload.ThirdInfo;

public interface IThirdDal {

	public Third mpThirdCreate(Third third) throws Exception;

	public List<ThirdInfo> mpThirdInfoCreate(List<ThirdInfo> thirdInfos) throws Exception;
}
