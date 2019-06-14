package com.experian.bepartner.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.experian.bepartner.enums.CatalogThridInfoEnum;
import com.experian.bepartner.enums.CatalogUserAddInfoEnum;
import com.experian.bepartner.enums.EnableEnum;
import com.experian.bepartner.enums.EvidenteResponseEnum;
import com.experian.bepartner.enums.ListResponseEnum;
import com.experian.bepartner.enums.RuesResponseEnum;
import com.experian.bepartner.payload.Payload;
import com.experian.bepartner.payload.RegisterModel;
import com.experian.bepartner.payload.Third;
import com.experian.bepartner.payload.ThirdInfo;
import com.experian.bepartner.payload.ThirdModel;
import com.experian.bepartner.payload.User;
import com.experian.bepartner.payload.UserInfo;
import com.experian.bepartner.payload.UserModel;
import com.experian.bepartner.payload.UserThird;

@Service
public class RegisterService implements IRegisterService {

	@Autowired
	private IUserService iUserService;

	@Autowired
	private IThirdService iThirdService;

	@Autowired
	private IUserThirdService iUserThirdService;

	@Override
	public Payload register(RegisterModel registerModel) {
		boolean registrar = true;
		UserThird userThird = new UserThird();
		/**
		 * Validacion de respuestas de servicios web de Listas y Evidente
		 */
		registrar = validateListAndEvidente(registerModel);

		/**
		 * Habilita el registro
		 */
		if (registrar) {
			registerModel.getThird().setV_Enable(EnableEnum.HABILITADO.getValue());
			registerModel.getUser().setvEnable(EnableEnum.HABILITADO.getValue());
			userThird.setvEnable(EnableEnum.HABILITADO.getValue());
		} else {
			registerModel.getThird().setV_Enable(EnableEnum.INHABILITADO.getValue());
			registerModel.getUser().setvEnable(EnableEnum.INHABILITADO.getValue());
			userThird.setvEnable(EnableEnum.INHABILITADO.getValue());
		}

		/**
		 * Validar si este tipo de identificacion existe
		 */
		Payload thirdModelCreate = null;
		Payload userModelCreate = null;

		Payload thirdExist = iThirdService.findByIdentify(registerModel.getThird().getV_Id_Type(),
				registerModel.getThird().getV_Identification_Number());
		Payload userExist = iUserService.findByIdentify(registerModel.getUser().getvIdType(),
				registerModel.getUser().getvIdentificationNumber());

		if (thirdExist.getStatus().equals(HttpStatus.NO_CONTENT)) {
			ThirdModel thirdModel = new ThirdModel(registerModel.getThird(), registerModel.getThirdInfo());
			thirdModelCreate = iThirdService.thirdModelCreate(thirdModel);
		}

		if (userExist.getStatus().equals(HttpStatus.NO_CONTENT)) {
			UserModel userModel = new UserModel(registerModel.getUser(), registerModel.getUserInfo());
			userModelCreate = iUserService.userModelCreate(userModel);
		}

		/**
		 * Crear el usuario-tercero
		 */
		Payload registerTotalResponse = null;
		if (thirdModelCreate != null && userModelCreate != null)
			if (thirdModelCreate.getStatus().equals(HttpStatus.ACCEPTED)
					&& userModelCreate.getStatus().equals(HttpStatus.ACCEPTED)) {

				ThirdModel thirdPublic = (ThirdModel) thirdModelCreate.getContent();
				UserModel userPublic = (UserModel) userModelCreate.getContent();

				userThird.setvIdThirdPublic(thirdPublic.getThird().getV_Id_Third_Public());
				userThird.setvIdUserPublic(userPublic.getUser().getvIdUserPublic());
				registerTotalResponse = iUserThirdService.mpUserThridCreate(userThird);

			}

		return registerTotalResponse;
	}

	private boolean validateListAndEvidente(RegisterModel registerModel) {
		boolean registrar = true;

		for (UserInfo userInfo : registerModel.getUserInfo()) {
			if (userInfo.getvIdInfoTypeUser().equals(CatalogUserAddInfoEnum.VALIDATE_LIST.getValue())
					&& !userInfo.getvValue().equals(ListResponseEnum.NO_REPORTADO.getValue())) {
				registrar = false;
				break;
			}

			if (userInfo.getvIdInfoTypeUser().equals(CatalogUserAddInfoEnum.VALIDATE_EVIDENTE.getValue())
					&& !userInfo.getvValue().equals(EvidenteResponseEnum.APROBADO.getValue())) {
				registrar = false;
				break;
			}
		}

		for (ThirdInfo thirdInfo : registerModel.getThirdInfo()) {
			if (thirdInfo.getV_Id_Info_Type_Third().equals(CatalogThridInfoEnum.VALIDATE_LIST.getValue())
					&& !thirdInfo.getV_Value().equals(ListResponseEnum.NO_REPORTADO.getValue())) {
				registrar = false;
				break;
			}

			if (thirdInfo.getV_Id_Info_Type_Third().equals(CatalogThridInfoEnum.VALIDATE_RUES.getValue())
					&& !thirdInfo.getV_Value().equals(RuesResponseEnum.APROBADO.getValue())) {
				registrar = false;
				break;
			}
		}
		return registrar;
	}

}
