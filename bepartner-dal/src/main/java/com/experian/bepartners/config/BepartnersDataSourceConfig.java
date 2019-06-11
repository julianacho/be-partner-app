package com.experian.bepartners.config;

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
		basePackages = "com.experian.bepartners.repository",
        entityManagerFactoryRef = "bepartnersEntityManagerFactory",
        transactionManagerRef = "bepartnersTransactionManager"
)
public class BepartnersDataSourceConfig {

	@Autowired
	private Environment env;
	
//	@Primary
//	@Bean	
//    @ConfigurationProperties(prefix="datasource.bepartners")
//    public DataSourceProperties bepartnersDataSourceProperties() {
//        return new DataSourceProperties();
//    }
    
	@Primary
    @Bean(name = "bepartnersDataSource")
    public DataSource bepartnersDataSource() {
//        DataSourceProperties primaryDataSourceProperties = bepartnersDataSourceProperties();
//		return DataSourceBuilder.create()
//        			.driverClassName(primaryDataSourceProperties.getDriverClassName())
//        			.url(primaryDataSourceProperties.getUrl())
//        			.username(primaryDataSourceProperties.getUsername())
//        			.password(primaryDataSourceProperties.getPassword())
//        			.build();
		
		return DataSourceBuilder.create()
    			.driverClassName("com.mysql.jdbc.Driver")
    			.url("jdbc:mysql://localhost:3306/bepartners?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC")
    			.username("root")
    			.password("")
    			.build();
    }
	
	@Primary
	@Bean(name = "bepartnersJdbc")
	@Autowired
	public JdbcTemplate abcJdbcTemplate(@Qualifier("bepartnersDataSource") DataSource datasource) {
	    return new JdbcTemplate(datasource);
	}
    
	@Primary
    @Bean
    public PlatformTransactionManager bepartnersTransactionManager()
    {
        EntityManagerFactory factory = bepartnersEntityManagerFactory().getObject();
        return new JpaTransactionManager(factory);
    }

	@Primary
    @Bean
    public LocalContainerEntityManagerFactoryBean bepartnersEntityManagerFactory()
    {
    	LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
        factory.setDataSource(bepartnersDataSource());
        factory.setPersistenceUnitName("bepartnersUnit");
        factory.setPackagesToScan(new String[]{"com.experian.bepartners.entity"});
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
    
	@Primary
    @Bean
	public DataSourceInitializer bepartnersDataSourceInitializer() 
	{
		DataSourceInitializer dataSourceInitializer = new DataSourceInitializer();
		dataSourceInitializer.setDataSource(bepartnersDataSource());
		ResourceDatabasePopulator databasePopulator = new ResourceDatabasePopulator();
//		databasePopulator.addScript(new ClassPathResource("bepartners-data.sql"));
		dataSourceInitializer.setDatabasePopulator(databasePopulator);
		dataSourceInitializer.setEnabled(env.getProperty("datasource.bepartners.initialize", Boolean.class, false));
		return dataSourceInitializer;
	}
    
}
