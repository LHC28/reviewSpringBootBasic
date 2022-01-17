package com.LHC28.ex;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
// DB연결 전 설정 에러 방지용
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class SpringExempleApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringExempleApplication.class, args);
	}

}
