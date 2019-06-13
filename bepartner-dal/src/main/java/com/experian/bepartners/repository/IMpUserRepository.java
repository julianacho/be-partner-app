package com.experian.bepartners.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.experian.bepartners.entity.MpUser;

@Repository
public interface IMpUserRepository extends JpaRepository<MpUser, Long> {

	@Query("select us from MpUser us where us.idType = :idType and us.identificationNumber = :identificationNumber")
	public MpUser findByIdentify(@Param("idType") String idType,
			@Param("identificationNumber") String identificationNumber);

}
