package ipam.sgbd.centrevacinnation.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name="centreVaccination")
public class CentreVaccination {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idCentre ;
	
	@Column(name="nom")
	private String nom;
	
	@Column(name="adresse")
	private String adresse;
	
	@Column(name="email")
	private String email;
	
	
	
}
