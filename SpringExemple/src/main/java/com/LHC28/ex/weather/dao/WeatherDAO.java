package com.LHC28.ex.weather.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.LHC28.ex.weather.model.WeatherHistory;

@Repository
public interface WeatherDAO {

	public List<WeatherHistory> selectWeatherhistory();
	
	public void insertWeatherhistory(
			@Param("date") String date
			,@Param("weather") String weather
			,@Param("temperatures") double temperatures
			,@Param("preciptitation") double preciptitation
			,@Param("microDust") String microDust
			,@Param("windSpeed") double windSpeed);
}
