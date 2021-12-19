package ipam.sgbd.centrevacinnation.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import ipam.sgbd.centrevacinnation.model.Patient;

@Service
public interface PatientService {
	
	public List<Patient> getAllPatients();
	public Optional<Patient> getPatientById(Long idPatient);
	public Patient addPatient(Patient patient);
	public void delete(Long idPatient);
	
}
