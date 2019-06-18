package com.experian.bepartner.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.experian.bepartner.enums.CatalogThridInfoEnum;
import com.experian.bepartner.enums.CatalogUserAddInfoEnum;
import com.experian.bepartner.enums.EnableEnum;
import com.experian.bepartner.enums.EvidenteResponseEnum;
import com.experian.bepartner.enums.ListResponseEnum;
import com.experian.bepartner.enums.RuesResponseEnum;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.RegisterModel;
import com.experian.bepartners.payload.RuesRequest;
import com.experian.bepartners.payload.Third;
import com.experian.bepartners.payload.ThirdInfo;
import com.experian.bepartners.payload.ThirdModel;
import com.experian.bepartners.payload.User;
import com.experian.bepartners.payload.UserInfo;
import com.experian.bepartners.payload.UserLogInfo;
import com.experian.bepartners.payload.UserModel;
import com.experian.bepartners.payload.UserThird;
import com.experian.bepartnerslog.enums.AddInfoLogEnum;
import com.experian.bepartnerslog.enums.ReasonLogsEnum;
import com.experian.bepartnerslog.enums.StatusLogEnum;
import com.experian.bepartnerslog.service.ILogRegistroService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
@Transactional
public class RegisterService implements IRegisterService {

	private static final Logger logger = LoggerFactory.getLogger(RegisterService.class);

	@Autowired
	private IUserService iUserService;

	@Autowired
	private IThirdService iThirdService;

	@Autowired
	private IUserThirdService iUserThirdService;
	
	@Autowired
	private ILogRegistroService iLogRegistroService;
	
	@Autowired
	private RestTemplate restTemplate;

	@Override
	public Payload register(RegisterModel registerModel) {
		boolean registrar = true;
		try {
			UserThird userThird = new UserThird();
			/**
			 * Validacion de respuestas de servicios web de Listas y Evidente
			 */
			
			registrar = validateListAndEvidente(registerModel);

			/**
			 * Habilita el registro
			 */
			if (registrar) {
				registerModel.getThird().setvEnable(EnableEnum.HABILITADO.getValue());
				registerModel.getUser().setvEnable(EnableEnum.HABILITADO.getValue());
				userThird.setvEnable(EnableEnum.HABILITADO.getValue());
			} else {
				registerModel.getThird().setvEnable(EnableEnum.INHABILITADO.getValue());
				registerModel.getUser().setvEnable(EnableEnum.INHABILITADO.getValue());
				userThird.setvEnable(EnableEnum.INHABILITADO.getValue());
			}

			/**
			 * Validar si este tipo de identificacion existe
			 */
			Payload thirdModelCreate = null;
			Payload userModelCreate = null;

			Payload thirdExist = iThirdService.findByIdentify(registerModel.getThird().getvIdType(),
					registerModel.getThird().getvIdentificationNumber());
			Payload userExist = iUserService.findByIdentify(registerModel.getUser().getvIdType(),
					registerModel.getUser().getvIdentificationNumber());

			if (thirdExist.getStatus().equals(HttpStatus.NO_CONTENT)) {
				ThirdModel thirdModel = new ThirdModel(registerModel.getThird(), registerModel.getThirdInfo());
				thirdModelCreate = iThirdService.thirdModelCreate(thirdModel);
			}//else return

			if (userExist.getStatus().equals(HttpStatus.NO_CONTENT)) {
				UserModel userModel = new UserModel(registerModel.getUser(), registerModel.getUserInfo());
				userModelCreate = iUserService.userModelCreate(userModel);
			}//else return

			/**
			 * Crear el usuario-tercero
			 */
			if (thirdModelCreate != null && userModelCreate != null)
				if (thirdModelCreate.getStatus().equals(HttpStatus.ACCEPTED)
						&& userModelCreate.getStatus().equals(HttpStatus.ACCEPTED)) {

					ThirdModel thirdPublic = (ThirdModel) thirdModelCreate.getContent();
					UserModel userPublic = (UserModel) userModelCreate.getContent();

					userThird.setvIdThirdPublic(thirdPublic.getThird().getvIdThirdPublic());
					userThird.setvIdUserPublic(userPublic.getUser().getvIdUserPublic());
					
					registerLog(
							thirdPublic.getThird().getvIdThirdPublic(), 
							userPublic.getUser().getvIdUserPublic(), 
							ReasonLogsEnum.REGISTRO.getValue(), 
							StatusLogEnum.EXITO.getValue(),thirdPublic,userPublic);
					
					
					
					return iUserThirdService.mpUserThridCreate(userThird);

				} else {
					return new Payload(HttpStatus.CONFLICT);
				}
			else {
				return new Payload(HttpStatus.CONFLICT);//MensaJkes personalizados
			}

		} catch (Exception e) {
			logger.error(e.getMessage());
			return new Payload(HttpStatus.CONFLICT, e.getMessage());
		}
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
			if (thirdInfo.getVIdInfoTypeThird().equals(CatalogThridInfoEnum.VALIDATE_LIST.getValue())
					&& !thirdInfo.getVValue().equals(ListResponseEnum.NO_REPORTADO.getValue())) {
				registrar = false;
				break;
			}

			if (thirdInfo.getVIdInfoTypeThird().equals(CatalogThridInfoEnum.VALIDATE_RUES.getValue())
					&& !thirdInfo.getVValue().equals(RuesResponseEnum.APROBADO.getValue())) {
				registrar = false;
				break;
			}
		}
		return registrar;
	}
	 
	private void registerLog(String vIdThirdPublic,String vIdUserPublic, String VIdRazon, String VIdEstatus,ThirdModel thirdPublic,UserModel userPublic) {
		List<UserLogInfo> infos=new ArrayList<UserLogInfo>();
		RegisterModel registerModel = new RegisterModel(userPublic.getUser(), userPublic.getUserInfo(), thirdPublic.getThird(), thirdPublic.getThirdInfos());
		
		String jsonPetition="";
		ObjectMapper mapper = new ObjectMapper(); 
		try {
			jsonPetition=mapper.writeValueAsString(registerModel);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		UserLogInfo logA=new UserLogInfo(jsonPetition, AddInfoLogEnum.PETICION_JSON.getValue());
		UserLogInfo logB=new UserLogInfo(userPublic.getUser().getvIdType(), AddInfoLogEnum.TIP_IDENTIFICACION_USUARIO.getValue());
		UserLogInfo logC=new UserLogInfo(userPublic.getUser().getvIdentificationNumber(), AddInfoLogEnum.IDENTIFICACION_USUARIO.getValue());
		UserLogInfo logD=new UserLogInfo(thirdPublic.getThird().getvIdType(), AddInfoLogEnum.TIP_IDENTIFICACION_USUARIO.getValue());
		UserLogInfo logE=new UserLogInfo(thirdPublic.getThird().getvIdentificationNumber(), AddInfoLogEnum.IDENTIFICACION_USUARIO.getValue());
		
		
		infos.add(logA);
		infos.add(logB);
		infos.add(logC);
		infos.add(logD);
		infos.add(logE);
				
						
						
		iLogRegistroService.logInfoRegister(vIdThirdPublic, vIdUserPublic, VIdRazon, VIdEstatus, infos);
	}

	@Override
	public Payload requestRues(String nit) {
		HttpEntity<RuesRequest> registerRequest = new HttpEntity<RuesRequest>(new RuesRequest(nit));
		Payload registerResponse = restTemplate.exchange("http://localhost:8080/v1/catalog/rues/send/", HttpMethod.POST,
				registerRequest, Payload.class).getBody();
		return new Payload(HttpStatus.ACCEPTED,registerResponse.getContent());
	}

}
