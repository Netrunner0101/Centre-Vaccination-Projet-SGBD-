package ipam.sgbd.centrevacinnation.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import ipam.sgbd.centrevacinnation.model.SiegeCentre;

@Repository
public interface SiegeCentreRepository extends CrudRepository<SiegeCentre,Long> {

}