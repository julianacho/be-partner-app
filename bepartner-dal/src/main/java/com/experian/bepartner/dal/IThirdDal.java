package com.experian.bepartner.dal;

import java.util.List;

import com.experian.bepartner.payload.Third;
import com.experian.bepartner.payload.ThirdInfo;

public interface IThirdDal {

	public Third mpThirdCreate(Third third);

	public List<ThirdInfo> mpThirdInfoCreate(List<ThirdInfo> thirdInfos);
}
