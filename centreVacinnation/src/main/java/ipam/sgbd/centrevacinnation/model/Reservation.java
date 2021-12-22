package ipam.sgbd.centrevacinnation.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="reservation")
public class Reservation {
	
	@Id
	@Column(name="idReservation")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long idReservation;

	// Relation many to one avec Patient et Centre Vaccination
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="idPatient")
	private Patient patientReservation;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="idCentre")
	private CentreVaccination centreReservation;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="idVaccin")
	private Vaccin vaccinReservation; 
	
	// Voir comment on met les dates et Temps dans la  DB ?
	
}
