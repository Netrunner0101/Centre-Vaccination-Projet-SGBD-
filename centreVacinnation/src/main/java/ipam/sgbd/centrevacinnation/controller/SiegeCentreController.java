package ipam.sgbd.centrevacinnation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import ipam.sgbd.centrevacinnation.model.CentreVaccination;
import ipam.sgbd.centrevacinnation.model.Patient;
import ipam.sgbd.centrevacinnation.model.SiegeCentre;
import ipam.sgbd.centrevacinnation.service.SiegeCentreServiceImpl;

@RestController
public class SiegeCentreController {
	
	@Autowired
	SiegeCentreServiceImpl siegeCentreServ;
	
	//Marche pas findAll() sur Siege
	//rechercher information sur le siege
	@GetMapping("/siege/info")
	public SiegeCentre info() {
		return (SiegeCentre) siegeCentreServ.infoSiege();
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
	
}
