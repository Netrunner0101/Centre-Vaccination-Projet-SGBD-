package ipam.sgbd.centrevacinnation.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ipam.sgbd.centrevacinnation.model.Personnel;
import ipam.sgbd.centrevacinnation.repository.PersonnelRepository;

@Service
public class PersonnelServiceImpl implements PersonnelService {
	
	@Autowired PersonnelRepository personnelRepo;

	@Override
	public Optional<Personnel> findPersonnelById(Long idPersonnel) {
		return personnelRepo.findById(idPersonnel);
	}

	@Override
	public List<Personnel> all() {
		return (List<Personnel>) personnelRepo.findAll();
	}

	@Override
	public void deleteByIdPersonnel(Long idPersonnel) {
		personnelRepo.deleteById(idPersonnel);
	}

}
