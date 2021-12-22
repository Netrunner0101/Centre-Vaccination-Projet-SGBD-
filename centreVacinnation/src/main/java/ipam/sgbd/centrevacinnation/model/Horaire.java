package ipam.sgbd.centrevacinnation.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="horaire")
@Data
public class Horaire {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long idHoraire;
	
	//Relation many to one Personnel
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="idPersonnel")
	private Personnel personnelHoraire;
	
	//Relation many to one Centre vaccination
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="idCentre")
	private CentreVaccination centreHoraire;
	
}
