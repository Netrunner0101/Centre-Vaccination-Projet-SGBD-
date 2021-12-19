package ipam.sgbd.centrevacinnation.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Entity
@Table(name="patient")
@Data
public class Patient {	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	long idPatient ;
	
	@Column(name="nom")
	private String nom ;
	
	@Column(name="prenom")
	private String prenom ;
	
	@Column(name="numeroNational")
	private long numeroNational;
	
	@Column(name="dateNaissance")
	@JsonFormat(pattern="dd/MM/yyyy")
	private Date dateNaissance;

	@Column(name="adresse")
	private String adresse ;
	
	@Column(name="email")
	private String email ;
	
	@Column(name="age")
	private int age ;
}
