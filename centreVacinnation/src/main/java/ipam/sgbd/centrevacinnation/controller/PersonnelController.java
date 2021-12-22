package ipam.sgbd.centrevacinnation.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import ipam.sgbd.centrevacinnation.model.Personnel;
import ipam.sgbd.centrevacinnation.repository.PersonnelRepository;
import ipam.sgbd.centrevacinnation.service.PersonnelServiceImpl;

@RestController
public class PersonnelController {

	@Autowired PersonnelServiceImpl personnelServ;
	@Autowired PersonnelRepository personnelRepo;
	
	//rechercher TOUTES personnel
	@GetMapping("/personnels")
	public List<Personnel> allPersonnels(){
		return personnelServ.all();
	}
	
	//rechercher un personnel par id
	@GetMapping("/personnel/{id}")
	public Optional<Personnel> findPersonnelId(@PathVariable("id") Long idPersonnel ) {
		return personnelServ.findPersonnelById(idPersonnel);
	}
	
	//supprimer un personnel par id
	@DeleteMapping("/personnel/delete/{id}")
	void deletePersonnelById(@PathVariable("id") Long idPersonnel ) {
		personnelServ.deleteByIdPersonnel(idPersonnel);
	}
	
	//Modifier un personnel 
	@PutMapping("/personnel/update/{id}")
	public Personnel personnelUpdate(@RequestBody Personnel personnel, @PathVariable("id") Long idPersonnel){
		Personnel UpdatePersonnel = personnelRepo.findById(idPersonnel).get();
		UpdatePersonnel.setNom(personnel.getNom());
		UpdatePersonnel.setPrenom(personnel.getPrenom());
		UpdatePersonnel.setOccupation(personnel.getOccupation());
		UpdatePersonnel.setEmail(personnel.getEmail());
		return personnelRepo.save(UpdatePersonnel);
	}
	
}
