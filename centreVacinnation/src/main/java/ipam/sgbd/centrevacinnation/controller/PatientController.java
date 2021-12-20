package ipam.sgbd.centrevacinnation.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import ipam.sgbd.centrevacinnation.model.Patient;
import ipam.sgbd.centrevacinnation.service.PatientServiceImpl;


@RestController
public class PatientController {

	@Autowired
	PatientServiceImpl patientServiceImpl;

	
	//rechercher la liste de tous les patients 
	@GetMapping("/patients")
	public List<Patient> getAllPatients() {
		return (List<Patient>) patientServiceImpl.getAllPatients();
	}
	
	//rechercher un patient avec son id
	@GetMapping("/patient/{id}")
	public Optional<Patient> getPatientById(@PathVariable("id")Long idPatient) {
		return patientServiceImpl.getPatientById(idPatient);
	}
	
	//supprimer un patient
	@DeleteMapping("/patient/{id}")
	public void deletePatient(@PathVariable("id") Long idPatient) {
		patientServiceImpl.delete(idPatient);
	}
	
	//ajouter un patient
	@PostMapping("/patient")
	public Patient addPatient(@RequestBody Patient patient ) {
		try {
			return patientServiceImpl.addPatient(patient);
		}
		catch(Exception e){
			return null;
		}
	}
	
	
}
