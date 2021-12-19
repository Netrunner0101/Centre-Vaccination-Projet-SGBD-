package ipam.sgbd.centrevacinnation.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import ipam.sgbd.centrevacinnation.model.CentreVaccination;

@Repository
public interface CentreVaccinationRepository extends CrudRepository<CentreVaccination,Long> {

}
