package ipam.sgbd.centrevacinnation.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ipam.sgbd.centrevacinnation.model.CentreVaccination;
import ipam.sgbd.centrevacinnation.repository.CentreVaccinationRepository;

@Service
public class CentreVaccinationServiceImpl implements CentreVaccinationService {
	
	@Autowired CentreVaccinationRepository centreVaccinationRepo;
	
	// Demande toutes les centres
	@Override
	public List<CentreVaccination> allCentres() {
		return (List<CentreVaccination>) centreVaccinationRepo.findAll() ;
	}
	
	// Demande centres par id
	@Override
	public Optional<CentreVaccination> centreById(Long idCentre) {
		return centreVaccinationRepo.findById(idCentre);
	}
	
	//Supprimer centre par id
	@Override
	public void deleteCentreById(Long idCentre) {
		centreVaccinationRepo.deleteById(idCentre);
	}

}
