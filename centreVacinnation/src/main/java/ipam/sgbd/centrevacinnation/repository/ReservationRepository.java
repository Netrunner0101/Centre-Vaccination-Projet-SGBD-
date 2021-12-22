package ipam.sgbd.centrevacinnation.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import ipam.sgbd.centrevacinnation.model.Reservation;

@Repository
public interface ReservationRepository extends CrudRepository<Reservation,Long> {

}
