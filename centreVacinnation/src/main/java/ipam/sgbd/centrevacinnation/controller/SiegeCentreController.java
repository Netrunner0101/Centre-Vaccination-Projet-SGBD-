package ipam.sgbd.centrevacinnation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import ipam.sgbd.centrevacinnation.model.CentreVaccination;
import ipam.sgbd.centrevacinnation.model.Patient;
import ipam.sgbd.centrevacinnation.model.SiegeCentre;
import ipam.sgbd.centrevacinnation.service.SiegeCentreServiceImpl;

@RestController
public class SiegeCentreController {
	
	@Autowired
	SiegeCentreServiceImpl siegeCentreServ;
	
	//Recherche le siege
	@GetMapping("/siege/info")
	public Iterable<SiegeCentre> info() {
		return siegeCentreServ.infoSiege();
	}
	
	//rechercher tous les patients
	@GetMapping("/siege/patients")
	public List<Patient> AllPatient(){
		return siegeCentreServ.allPatients();
	}
	
	//rechercher tous les centres
	@GetMapping("/siege/centres")
	public List<CentreVaccination> AllCentre(){
		return siegeCentreServ.allCentres();
	}
	
	//ajouter un patient au centre
	@PostMapping("/siege/addpatient")
	public Patient addPatient(@RequestBody Patient patient) {
		try {
			return siegeCentreServ.addPatient(patient);
		}
		catch(Exception e) {
			return null ;
		}
	}
	
	// ajouter un centre 
	@PostMapping("/siege/addcentre")
	public CentreVaccination addCentre(@RequestBody CentreVaccination centre) {
		try {
			return siegeCentreServ.addCentre(centre);
		}
		catch (Exception e) {
			return null;
		}
	}
	
	// supprimer un patient
	@DeleteMapping("/siege/deletepatient/{id}")
	void deletePatient(@PathVariable Long idPatient) {
		siegeCentreServ.deletePatient(idPatient);
	}
	
	//supprimer un centre 
	@DeleteMapping("/siege/deletecentre/{id}")
	void deleteCentre(@PathVariable Long idCentre) {
		siegeCentreServ.deleteCentre(idCentre);
	}
	
}
