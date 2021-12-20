package ipam.sgbd.centrevacinnation.model;



import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="siegeCentre")
@Data
public class SiegeCentre {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idSiege")
	private Long idSiege ;
	
	//Relation one to many avec Patient(PK)
	@OneToMany(mappedBy="siege")
	private List<Patient> patient;
	
	//Relation one to many avec CentreVaccination(PK)
	@OneToMany(mappedBy="siegeCentre")
	private List<CentreVaccination> centreVaccination;
	
	@Column(name="nom")
	private String nom ;
	
	@Column(name="adresse")
	private String adresse ;
}