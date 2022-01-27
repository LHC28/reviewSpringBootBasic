package com.LHC28.ex.pension.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LHC28.ex.pension.dao.BookingDAO;
import com.LHC28.ex.pension.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList(){
		return bookingDAO.selectBookingList();
	}
	
	public void deleteBookingById(int bookingId) {
		bookingDAO.deleteBookingById(bookingId);
	}
	
	public void addBooking(String name, String reservationDate, int day, int headcount, String phoneNumber) {
		bookingDAO.insertBooking(name, reservationDate, day, headcount, phoneNumber);
	}
	
	public Booking getBookingByNameAndPhoneNumber(String name, String phoneNumber) {
		return bookingDAO.selectBookingByNameAndPhoneNumber(name, phoneNumber);
	}
}
