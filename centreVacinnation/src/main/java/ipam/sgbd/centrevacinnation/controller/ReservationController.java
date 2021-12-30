package ipam.sgbd.centrevacinnation.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import ipam.sgbd.centrevacinnation.model.Reservation;
import ipam.sgbd.centrevacinnation.service.ReservationServiceImpl;

@RestController
public class ReservationController {
	
	@Autowired ReservationServiceImpl reservationServ;
	
	// Rechercher tous les reservations
	@GetMapping("/reservations")
	public List<Reservation> allReservations(){
		return (List<Reservation>) reservationServ.allReservation();
	}
	
	// Les reservations par id
	@GetMapping("/reservation/{id}")
	public Optional<Reservation> reservationId(@PathVariable("id") Long idReservation) {
		return reservationServ.reservationId(idReservation);
	}
	
	// Creer une reservation
	@PostMapping("/reservation/create")
	public Reservation createReservation(@RequestBody Reservation reservation) {
		return reservationServ.reservationCreate(reservation);
	}
	
	// Update une reservation
	@PatchMapping("/reservation/update/{id}")
	public Reservation updateReservation(@RequestBody Reservation reservation,@PathVariable("id") long idReservation) {
		return reservationServ.reservationUpdate(reservation, idReservation);
	}
	
	//Changer vaccin  
	@PatchMapping("/reservation/{idR}/vaccin/{idV}")
	public void updateVaccin(long idVaccin, long idReservation) {
		reservationServ.changeVaccinId(idVaccin, idReservation);
	}
	
	//Delete Reservation
	@DeleteMapping("/reservation/delete/{id}")
	public void deleteReservation(@PathVariable("id") long idReservation){
		reservationServ.deleteReservation(idReservation);
	}
	
}
