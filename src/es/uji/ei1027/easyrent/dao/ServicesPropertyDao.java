package es.uji.ei1027.easyrent.dao;


import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.easyrent.domain.ServiceProperty;
import es.uji.ei1027.easyrent.domain.Property;

@Repository
public class ServicesPropertyDao {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public void addServicesProperty(Property services) throws PSQLException{
		int propiedad = services.getId();
		String query;
		if(services.getPiscina()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+0+");";
			this.jdbcTemplate.update(query);
		}if(services.getBalcon()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+1+");";
			this.jdbcTemplate.update(query);
		}if(services.getJacuzzi()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+2+");";
			this.jdbcTemplate.update(query);
		}if(services.getParque()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+3+");";
			this.jdbcTemplate.update(query);
		}if(services.getJardin()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+4+");";
			this.jdbcTemplate.update(query);
		}if(services.getWifi()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+5+");";
			this.jdbcTemplate.update(query);
		}if(services.getTelevision()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+6+");";
			this.jdbcTemplate.update(query);
		}if(services.getGimnasio()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+7+");";
			this.jdbcTemplate.update(query);
		}if(services.getCocina()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+8+");";
			this.jdbcTemplate.update(query);
		}
	}
	
	public void updateServicesProperty(Property services) throws PSQLException{
		int propiedad = services.getId();
		String query = "DELETE FROM serviceproperty WHERE property_id=" + propiedad + ";";
		this.jdbcTemplate.update(query);
		if(services.getPiscina()==1){
			query = "INSERT INTO serviceproperty(property_id ,service_id) VALUES(" + propiedad + "," + 0 + ");";
			this.jdbcTemplate.update(query);
		}if(services.getBalcon()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+1+");";
			this.jdbcTemplate.update(query);
		}if(services.getJacuzzi()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+2+");";
			this.jdbcTemplate.update(query);
		}if(services.getParque()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+3+");";
			this.jdbcTemplate.update(query);
		}if(services.getJardin()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+4+");";
			this.jdbcTemplate.update(query);
		}if(services.getWifi()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+5+");";
			this.jdbcTemplate.update(query);
		}if(services.getTelevision()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+6+");";
			this.jdbcTemplate.update(query);
		}if(services.getGimnasio()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+7+");";
			this.jdbcTemplate.update(query);
		}if(services.getCocina()==1){
			query = " INSERT INTO serviceproperty(property_id ,service_id) VALUES("+propiedad+","+8+");";
			this.jdbcTemplate.update(query);
		}
	}
	
}
