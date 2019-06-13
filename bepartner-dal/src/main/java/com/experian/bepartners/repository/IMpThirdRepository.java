package com.experian.bepartners.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.experian.bepartners.entity.MpThird;

@Repository
public interface IMpThirdRepository extends JpaRepository<MpThird, Long> {

	@Query("select th from MpThird th where th.idType = :idType and th.identificationNumber = :identificationNumber")
	public MpThird findByIdentify(@Param("idType") String idType, @Param("identificationNumber") String identificationNumber);
}
