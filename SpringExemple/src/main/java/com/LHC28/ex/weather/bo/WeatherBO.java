package com.LHC28.ex.weather.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LHC28.ex.weather.dao.WeatherDAO;
import com.LHC28.ex.weather.model.WeatherHistory;

@Service
public class WeatherBO {

	@Autowired
	private WeatherDAO weatherDAO;
	
	public List<WeatherHistory> getWeatherhistory(){
		return weatherDAO.selectWeatherhistory();
	}
	
	public void addWeatherhistory(String date, String weather, double temperatures, double preciptitation, String microDust, double windSpeed) {
		weatherDAO.insertWeatherhistory(date, weather, temperatures, preciptitation, microDust, windSpeed);
	}
}
