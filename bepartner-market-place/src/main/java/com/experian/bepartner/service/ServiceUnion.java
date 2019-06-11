
package com.experian.bepartner.service;

import java.util.List;

import javax.management.Query;
import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.experian.bepartner.dal.IProductDal;
import com.experian.bepartners.entity.UCatalog;
import com.experian.bepartners.repository.UCatalogRepository;
import com.experian.bepartnerslog.entity.UserLogin;
import com.experian.bepartnerslog.repository.UserLoginRepository;

@Service
public class ServiceUnion {
	@Autowired
	private UCatalogRepository uCatalogRepository;

	@Autowired
	private UserLoginRepository userLoginRepository;
	
	
	
	@PersistenceContext(unitName = "bepartnersUnit")
    private EntityManager bepartnersEntityManager;
	
	@PersistenceContext(unitName = "bepartnerslogUnit")
    private EntityManager bepartnerslogEntityManager;

	@Transactional(transactionManager = "bepartnerslogTransactionManager")
	public List<UserLogin> getUserLogins() {
		return userLoginRepository.findAll();
	}

	@Transactional(transactionManager = "bepartnersTransactionManager")
	public List<UCatalog> getUCatalogs() {
		return uCatalogRepository.findAll();
	}
	
	
	public void getAllUCatalog(){
		StoredProcedureQuery query = bepartnersEntityManager
				.createStoredProcedureQuery("p_u_catalog")
				//.registerStoredProcedureParameter("postId",Long.class,ParameterMode.IN)
				//.registerStoredProcedureParameter("commentCount",Long.class,ParameterMode.OUT)
				//.setParameter("postId", 1L)
				;
		boolean status = query.execute();
		
		System.out.printf("****************** status=%s\n", status);
	    List rs =  query.getResultList();
	    //assertNotNull(rs);
	    System.out.printf("****************** rs=%s\n", rs );
	    Object row[] = (Object[])rs.get(0);
	    System.out.printf("****************** row=%s\n", row );
	    for (int col=0; col<row.length; ++col ) {
	        System.out.printf("**** row[%d]=%s\n", col, row[col]  );
	    }
	}
	
}
