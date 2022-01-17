package com.LHC28.ex;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication // 스프링 구동을 위한 필수 어노테이션
@ComponentScan(basePackages = "com.LHC28") // com.LHC28 패키지 아래에 있는 스프링빈을 검색
public class SpringExempleApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringExempleApplication.class, args);
	}

}
