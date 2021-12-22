package ipam.sgbd.centrevacinnation.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import ipam.sgbd.centrevacinnation.model.Vaccin;

@Repository
public interface VaccinRepository extends CrudRepository<Vaccin,Long>{

}
