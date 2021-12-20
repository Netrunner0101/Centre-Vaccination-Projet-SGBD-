package ipam.sgbd.centrevacinnation.model;


import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name="centreVaccination")
public class CentreVaccination {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idCentre ;
	
	//Relation many to one avec Siege 
	@ManyToOne
	@JoinColumn(name="idSiege")
	private SiegeCentre siegeCentre;
	
	//Relation one to many avec Patient
	@OneToMany(mappedBy="centreVaccination")
	private List<Patient> patient;
	
	@Column(name="nom")
	private String nom;
	
	@Column(name="adresse")
	private String adresse;
	
	@Column(name="email")
	private String email;
	
	
	
}
