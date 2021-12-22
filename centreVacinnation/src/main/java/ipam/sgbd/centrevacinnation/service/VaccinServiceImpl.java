package ipam.sgbd.centrevacinnation.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ipam.sgbd.centrevacinnation.model.Vaccin;
import ipam.sgbd.centrevacinnation.repository.VaccinRepository;

@Service
public class VaccinServiceImpl implements VaccinService {
	
	@Autowired VaccinRepository vaccinRepo;
	
	@Override
	public List<Vaccin> getAllVaccin() {
		return (List<Vaccin>) vaccinRepo.findAll();
	}

	@Override
	public Optional<Vaccin> getVaccinById(Long idVaccin) {
		return vaccinRepo.findById(idVaccin);
	}

	@Override
	public void deleteVaccin(Long idVaccin) {
		vaccinRepo.deleteById(idVaccin);
	}

}
