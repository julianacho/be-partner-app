package com.experian.bepartner.payload;

import java.util.List;

public class ThirdModel {
	private Third third;
	private List<ThirdInfo> thirdInfos;

	public ThirdModel(Third third, List<ThirdInfo> thirdInfos) {
		super();
		this.third = third;
		this.thirdInfos =  thirdInfos;
	}

	public Third getThird() {
		return third;
	}

	public void setThird(Third third) {
		this.third = third;
	}

	public List<ThirdInfo> getThirdInfos() {
		return thirdInfos;
	}

	public void setThirdInfos(List<ThirdInfo> thirdInfos) {
		this.thirdInfos = thirdInfos;
	}

}
