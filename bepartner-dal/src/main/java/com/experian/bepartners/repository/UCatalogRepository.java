package com.experian.bepartners.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.experian.bepartners.entity.UCatalog;

@Repository
public interface UCatalogRepository extends JpaRepository<UCatalog, Long> {

}
