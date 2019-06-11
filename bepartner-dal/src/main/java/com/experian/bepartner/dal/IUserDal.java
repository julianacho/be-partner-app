package com.experian.bepartner.dal;

import java.util.List;

import com.experian.bepartner.payload.Usuario;
import com.experian.bepartner.payload.UsuarioInfo;

public interface IUserDal {
	
	public Object mpUserCreate(Usuario usuario);
	
	public List<Object> mpUserInfoCreate(List<UsuarioInfo> usuarioInfo);
}
