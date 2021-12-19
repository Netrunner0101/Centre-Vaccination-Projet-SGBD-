package ipam.sgbd.centrevacinnation.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import ipam.sgbd.centrevacinnation.model.Patient;


@Repository
public interface PatientRepository extends CrudRepository<Patient,Long> {

}
