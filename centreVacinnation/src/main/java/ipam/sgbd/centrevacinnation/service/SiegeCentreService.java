package ipam.sgbd.centrevacinnation.service;

import org.springframework.stereotype.Service;

import ipam.sgbd.centrevacinnation.model.CentreVaccination;
import ipam.sgbd.centrevacinnation.model.Patient;

@Service
public interface SiegeCentreService {
	
	CentreVaccination addCentre(CentreVaccination centreVaccination);
	void deletePatient (Long IdPatient);
	void deleteCentre (Long IdCentre);
	Patient addPatient(Patient patient);
	
}
