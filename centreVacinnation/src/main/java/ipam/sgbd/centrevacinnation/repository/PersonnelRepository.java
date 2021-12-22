package ipam.sgbd.centrevacinnation.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import ipam.sgbd.centrevacinnation.model.Personnel;

@Repository
public interface PersonnelRepository extends CrudRepository<Personnel, Long> {

}
