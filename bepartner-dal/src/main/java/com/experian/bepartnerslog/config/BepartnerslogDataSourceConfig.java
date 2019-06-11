package com.experian.bepartnerslog.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.init.DataSourceInitializer;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;


@Configuration
@EnableJpaRepositories(
		basePackages = "com.experian.bepartnerslog.repository",
        entityManagerFactoryRef = "bepartnerslogEntityManagerFactory",
        transactionManagerRef = "bepartnerslogTransactionManager"
)
public class BepartnerslogDataSourceConfig
{
	@Autowired
	private Environment env;
		
//    @Bean    
//    @ConfigurationProperties(prefix="datasource.bepartnerslog")
//    public DataSourceProperties bepartnerslogDataSourceProperties() {
//        return new DataSourceProperties();
//    }
    
    
    @Bean(name = "bepartnerslogDataSource")
    public DataSource bepartnerslogDataSource() {
//        DataSourceProperties bepartnerslogDataSourceProperties = bepartnerslogDataSourceProperties();
//		return DataSourceBuilder.create()
//        			.driverClassName(bepartnerslogDataSourceProperties.getDriverClassName())
//        			.url(bepartnerslogDataSourceProperties.getUrl())
//        			.username(bepartnerslogDataSourceProperties.getUsername())
//        			.password(bepartnerslogDataSourceProperties.getPassword())
//        			.build();
    	
    	return DataSourceBuilder.create()
    			.driverClassName("com.mysql.jdbc.Driver")
    			.url("jdbc:mysql://localhost:3306/bepartnerslog?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC")
    			.username("root")
    			.password("")
    			.build();
    }
    
    @Bean(name = "bepartnerslogJdbc")
	@Autowired
	public JdbcTemplate abcJdbcTemplate(@Qualifier("bepartnerslogDataSource") DataSource datasource) {
	    return new JdbcTemplate(datasource);
	}
    
    @Bean
    public PlatformTransactionManager bepartnerslogTransactionManager()
    {
        EntityManagerFactory factory = bepartnerslogEntityManagerFactory().getObject();
        return new JpaTransactionManager(factory);
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean bepartnerslogEntityManagerFactory()
    {
        LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
        factory.setDataSource(bepartnerslogDataSource());
        factory.setPersistenceUnitName("bepartnerslogUnit");
        factory.setPackagesToScan(new String[]{"com.experian.bepartnerslog.entity"});
        factory.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        
        Properties jpaProperties = new Properties();
//        jpaProperties.put("hibernate.hbm2ddl.auto", env.getProperty("spring.jpa.hibernate.ddl-auto"));
//        jpaProperties.put("hibernate.show-sql", env.getProperty("spring.jpa.show-sql"));
//        jpaProperties.put("hibernate.dialect", env.getProperty("spring.jpa.properties.hibernate.dialect"));
        
        
        jpaProperties.put("hibernate.hbm2ddl.auto", "none");
        jpaProperties.put("hibernate.show-sql", "true");
        jpaProperties.put("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
        
        factory.setJpaProperties(jpaProperties);
        
        return factory;
    }
    
    @Bean
	public DataSourceInitializer bepartnerslogDataSourceInitializer() 
	{
		DataSourceInitializer dataSourceInitializer = new DataSourceInitializer();
		dataSourceInitializer.setDataSource(bepartnerslogDataSource());
		ResourceDatabasePopulator databasePopulator = new ResourceDatabasePopulator();
//		databasePopulator.addScript(new ClassPathResource("bepartnerslog-data.sql"));
		dataSourceInitializer.setDatabasePopulator(databasePopulator);
		dataSourceInitializer.setEnabled(env.getProperty("datasource.bepartnerslog.initialize", Boolean.class, false));
		return dataSourceInitializer;
	}
    
    
}
