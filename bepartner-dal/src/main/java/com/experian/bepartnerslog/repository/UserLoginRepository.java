package com.experian.bepartnerslog.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.experian.bepartnerslog.entity.UserLogin;

@Repository
public interface UserLoginRepository extends JpaRepository<UserLogin, Long> {

	@Query("select ul from UserLogin ul where ul.idUser = :idUser")
	public UserLogin findByNit(@Param("idUser") Long idUser);

}
