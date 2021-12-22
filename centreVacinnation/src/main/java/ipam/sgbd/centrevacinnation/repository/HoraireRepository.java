package ipam.sgbd.centrevacinnation.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import ipam.sgbd.centrevacinnation.model.Horaire;

@Repository
public interface HoraireRepository extends CrudRepository<Horaire,Long> {

}
