package com.experian.bepartner.dal;

import java.util.List;

import com.experian.bepartner.payload.Third;
import com.experian.bepartner.payload.ThirdInfo;

public interface IThirdDal {

	public Object mpThirdCreate(Third third);

	public List<Object> mpThirdInfoCreate(List<ThirdInfo> thirdInfos);
}
