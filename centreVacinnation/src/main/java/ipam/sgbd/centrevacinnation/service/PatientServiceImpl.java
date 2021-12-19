package ipam.sgbd.centrevacinnation.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ipam.sgbd.centrevacinnation.model.Patient;
import ipam.sgbd.centrevacinnation.repository.PatientRepository;



@Service
public class PatientServiceImpl implements PatientService  {
	
	@Autowired
	private PatientRepository patientRepository;
	
	// Retourner tout les patients

	public List<Patient> getAllPatients() {
		// TODO Auto-generated method stub
		return (List<Patient>) patientRepository.findAll();
	}
	
	// Retourner patient en fonction de son Id
	public Optional<Patient> getPatientById(Long idPatient) {
		return patientRepository.findById(idPatient);
	}
	
	
	// Supprimer le patient grace à id
	public void delete(Long idPatient) {
		patientRepository.deleteById(idPatient);;
	}

	// ajouter un patient
	public Patient addPatient(Patient patient) {
		return  patientRepository.save(patient);
	}
}
