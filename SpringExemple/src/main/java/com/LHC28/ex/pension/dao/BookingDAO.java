package com.LHC28.ex.pension.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.LHC28.ex.pension.model.Booking;

@Repository
public interface BookingDAO {

	public List<Booking> selectBookingList();
	
	public void deleteBookingById(@Param("bookingId") int bookingId);
	
	public void insertBooking(
			@Param("name") String name
			,@Param("reservationDate") String reservationDate
			,@Param("day") int day
			,@Param("headcount") int headcount
			,@Param("phoneNumber") String phoneNumber);
	
	public Booking selectBookingByNameAndPhoneNumber(
			@Param("name") String name
			,@Param("phoneNumber") String phoneNumber);
}
