package edu.Farmfarm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.Farmfarm.service.FarmService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/test/*")
@Log4j
@AllArgsConstructor
public class HWDBtestController {
	
	private FarmService service;
	
	@GetMapping("/dht11")
	public void test1() {
		
	}
	
	@GetMapping("/dht11db")
	public void test2(@RequestParam("Temp") int temp) {
		log.info("ok : " + temp);
		service.insert(temp);
	}
}
