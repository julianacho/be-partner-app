package com.experian.bepartner.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.experian.bepartner.dal.IThirdDal;
import com.experian.bepartners.entity.MpThird;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.Third;
import com.experian.bepartners.payload.ThirdInfo;
import com.experian.bepartners.payload.ThirdModel;
import com.experian.bepartners.repository.IMpThirdRepository;

@Service
@Transactional
public class ThirdService implements IThirdService {

	private static final Logger logger = LoggerFactory.getLogger(ThirdService.class);

	@Autowired
	private IThirdDal iThirdDal;

	@Autowired
	private IMpThirdRepository iMpThirdRepository;

	@Override
	public Payload thirdModelCreate(ThirdModel thirdModel) {
		try {
			Third third = iThirdDal.mpThirdCreate(thirdModel.getThird());
			for (ThirdInfo thirdInfo : thirdModel.getThirdInfos()) {
				thirdInfo.setV_Id_Third_Public(third.getV_Id_Third_Public());
			}
			List<ThirdInfo> thirdInfos = iThirdDal.mpThirdInfoCreate(thirdModel.getThirdInfos());
			return new Payload(HttpStatus.ACCEPTED, new ThirdModel(third, thirdInfos));
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new Payload(HttpStatus.CONFLICT, e.getMessage());
		}
	}

	@Override
	public Payload thirdCreate(Third third) {
		try {
			Third thirdObj = iThirdDal.mpThirdCreate(third);
			return new Payload(HttpStatus.ACCEPTED, thirdObj);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new Payload(HttpStatus.CONFLICT, e.getMessage());
		}
	}

	@Override
	public Payload thirdInfoCreate(List<ThirdInfo> thirdInfos) {
		try {
			List<ThirdInfo> thridInfoObj = iThirdDal.mpThirdInfoCreate(thirdInfos);
			return new Payload(HttpStatus.ACCEPTED, thridInfoObj);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new Payload(HttpStatus.CONFLICT, e.getMessage());
		}
	}

	@Override
	public Payload findByIdentify(String idType, String identificationNumber) {
		try {
			MpThird mpThird = iMpThirdRepository.findByIdentify(idType, identificationNumber);
			if (mpThird != null)
				return new Payload(HttpStatus.ACCEPTED, mpThird);
			return new Payload(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new Payload(HttpStatus.CONFLICT, e.getMessage());
		}
	}

}
