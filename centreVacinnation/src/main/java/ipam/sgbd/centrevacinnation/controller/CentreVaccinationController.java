package ipam.sgbd.centrevacinnation.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import ipam.sgbd.centrevacinnation.model.CentreVaccination;
import ipam.sgbd.centrevacinnation.service.CentreVaccinationServiceImpl;

@RestController
public class CentreVaccinationController {
	
	@Autowired CentreVaccinationServiceImpl centreVaccinationServ;
	
	//Tous les centres
	@GetMapping("/centres/")
	public Iterable<CentreVaccination> allCentre(){
		return centreVaccinationServ.allCentres();
	}
	
	//Centre par id
	@GetMapping("/centre/{id}")
	public Optional<CentreVaccination> centreId(@PathVariable("id") long idCentre){
		return centreVaccinationServ.centreById(idCentre);
	}
	
	@DeleteMapping("/centre/delete/{id}")
	public void deleteCentre(@PathVariable("id") long idCentre) {
		centreVaccinationServ.centreById(idCentre);
	}
	
}
