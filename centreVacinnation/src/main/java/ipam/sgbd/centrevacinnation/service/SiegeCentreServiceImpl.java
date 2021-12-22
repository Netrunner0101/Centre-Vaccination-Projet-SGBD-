package ipam.sgbd.centrevacinnation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ipam.sgbd.centrevacinnation.model.CentreVaccination;
import ipam.sgbd.centrevacinnation.model.Patient;
import ipam.sgbd.centrevacinnation.model.SiegeCentre;
import ipam.sgbd.centrevacinnation.repository.CentreVaccinationRepository;
import ipam.sgbd.centrevacinnation.repository.PatientRepository;
import ipam.sgbd.centrevacinnation.repository.SiegeCentreRepository;

@Service
public class SiegeCentreServiceImpl implements SiegeCentreService {
	
	@Autowired SiegeCentreRepository siegeCentreRepo;
	
	@Autowired PatientRepository patientRepo;
	
	@Autowired CentreVaccinationRepository centreVaccinationRepo;
	
	// NE MARCHE PAS ?? Voir Probleme
	public Iterable<SiegeCentre> infoSiege() {
		return siegeCentreRepo.findAll();
	}
	
	public List<Patient> allPatients(){
		return (List<Patient>) patientRepo.findAll() ;
	}
	
	public List<CentreVaccination> allCentres(){
		return (List<CentreVaccination>) centreVaccinationRepo.findAll();
	}

	public Patient addPatient(Patient patient) {
		return patientRepo.save(patient);
	}

	@Override
	public CentreVaccination addCentre(CentreVaccination centreVaccination) {
		return centreVaccinationRepo.save(centreVaccination);
	}

	@Override
	public void deletePatient(Long IdPatient) {
		patientRepo.deleteById(IdPatient);
		
	}

	@Override
	public void deleteCentre(Long IdCentre) {
		centreVaccinationRepo.deleteById(IdCentre);
		
	}


	
}
