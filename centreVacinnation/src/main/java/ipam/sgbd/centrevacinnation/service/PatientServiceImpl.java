package ipam.sgbd.centrevacinnation.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ipam.sgbd.centrevacinnation.model.Patient;
import ipam.sgbd.centrevacinnation.model.Reservation;
import ipam.sgbd.centrevacinnation.repository.PatientRepository;
import ipam.sgbd.centrevacinnation.repository.ReservationRepository;


@Service
public class PatientServiceImpl implements PatientService  {
	
	@Autowired PatientRepository patientRepository;
	@Autowired ReservationRepository reservationRepo;
	
	// Retourner tout les patients

	public List<Patient> getAllPatients() {
		return (List<Patient>) patientRepository.findAll();
	}
	
	// Tous les reservations du client
	@Override
	public List<Reservation> allReservation() {
		return (List<Reservation>) reservationRepo.findAll();
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
