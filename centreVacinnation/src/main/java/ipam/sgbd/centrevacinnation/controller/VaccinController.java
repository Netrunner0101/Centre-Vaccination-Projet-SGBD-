package ipam.sgbd.centrevacinnation.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import ipam.sgbd.centrevacinnation.model.Vaccin;
import ipam.sgbd.centrevacinnation.service.VaccinServiceImpl;

@RestController
public class VaccinController {
	
	@Autowired VaccinServiceImpl vaccinServ;
	
	@GetMapping("/vaccins")
	public List<Vaccin> getAllVaccins(){
		return vaccinServ.getAllVaccin();
	}
	
	@GetMapping("/vaccin/{id}")
	public Optional<Vaccin> getVaccinById(@PathVariable(name="id") long idVaccin){
		return vaccinServ.getVaccinById(idVaccin);
	}
	
	@GetMapping("/vaccin/delete/{id}")
	void deleteVaccin(@PathVariable(name="id") long idVaccin) {
		vaccinServ.deleteVaccin(idVaccin);
	}
	
}
