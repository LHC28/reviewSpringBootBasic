package com.LHC28.ex.weather;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.LHC28.ex.weather.bo.WeatherBO;
import com.LHC28.ex.weather.model.WeatherHistory;

@Controller
@RequestMapping("/weather")
public class WeatherhistoryController {

	@Autowired
	private WeatherBO weatherBO;
	
	@RequestMapping("/page1")
	public String page1(Model model) {
		List<WeatherHistory> weatherhistory = new ArrayList<>();
		weatherhistory = weatherBO.getWeatherhistory();
		model.addAttribute("weatherhistory", weatherhistory);
		return "weather/page1";
	}
	
	@RequestMapping("/page2")
	public String page2(
		
			) {
		return "weather/page2";
	}
	
	@PostMapping("/addWeather")
	public String addWeather(
			@RequestParam("date") String date
			,@RequestParam("weather") String weather
			,@RequestParam("temperatures") double temperatures
			,@RequestParam("preciptitation") double preciptitation
			,@RequestParam("microDust") String microDust
			,@RequestParam("windSpeed") double windSpeed
			) {
		
		weatherBO.addWeatherhistory(date, weather, temperatures, preciptitation, microDust, windSpeed);
		
		return "redirect:/weather/page1";
	}
}
