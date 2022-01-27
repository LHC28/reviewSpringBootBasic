package com.LHC28.ex.pension;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.transform.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.LHC28.ex.pension.bo.BookingBO;
import com.LHC28.ex.pension.model.Booking;

@RequestMapping("/pension")
@Controller
public class PensionController {

	@Autowired
	private BookingBO bookingBO;
	
	@RequestMapping("/pension_view")
	public String pensionView() {
		return "pension/mainPage";
	}
	
	// 예약목록
	@RequestMapping("/reservationList_view")
	public String reservationListView(Model model) {
		
		List<Booking> bookingList =  bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		return "pension/reservationListPage";
	}
	
	//예약하기
	@RequestMapping("/reservation_view")
	public String reservationView() {
		
		return "pension/reservationPage";
	}
	
	@PostMapping("/del_booking")
	@ResponseBody
	public Map<String, String> delBooking(
			@RequestParam("bookingId") int bookingId
			){
		
		bookingBO.deleteBookingById(bookingId);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	@PostMapping("/add_booking")
	@ResponseBody
	public Map<String, String> addBooking(
			@RequestParam("name") String name,
			@RequestParam("reservationDate") String reservationDate,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber
			){
		
		bookingBO.addBooking(name, reservationDate, day, headcount, phoneNumber);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	@PostMapping("/get_reservation")
	@ResponseBody
	public Map<String, Object> getReservation(
			@RequestParam("name") String name
			,@RequestParam("phoneNumber") String phoneNumber
			){
		Booking booking = bookingBO.getBookingByNameAndPhoneNumber(name, phoneNumber);
		Map<String, Object> result = new HashMap<>();
		if(booking==null) {
			result.put("result", "fail");
		}else {
			result.put("result", "success");
			result.put("name",booking.getName());
			result.put("date", booking.getDate());
			result.put("day",booking.getDay());
			result.put("headcount",booking.getHeadcount());
			result.put("state",booking.getState());
		}
		
		return result;
	}
}
