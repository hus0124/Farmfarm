package edu.Farmfarm.controller;






import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.web.bind.annotation.RestController;


import edu.Farmfarm.service.SensorService;
import lombok.AllArgsConstructor;

import lombok.extern.log4j.Log4j;
@Log4j
@RestController
@RequestMapping("/ajax/*")
@AllArgsConstructor
public class AjaxController {
	
	private SensorService ss;
	
	

	//온도 간략
	@GetMapping("/tempcheck")
	public String tempcheck() {
		int a;
		String temp = String.valueOf(ss.tempck().get(0).getTemp());
		log.info(temp);
		a = Integer.parseInt(temp);
		String ck = null;
		if(a>18 && a<30) {
			ck="GOOD";
		}else if(a<18){
			ck="COLD";
		}else if(a>=30){
			ck="HOT";
		}
		log.info(ck);
		return ck;
	}
	
	//조도간략
	@GetMapping("/lightcheck")
	public String lightcheck() {
		int a;
		String light = String.valueOf(ss.lightck().get(0).getLight());
		log.info(light);
		a = Integer.parseInt(light);
		String ck = null;
		if(a<=180) {
			ck="GOOD";
		}else if(a>180){
			ck="DARK";
		}
		log.info(ck);
		return ck;		
	}
	
	//땅간략
	@GetMapping("/groundcheck")
	public String groundcheck() {
		int a;
		String ground = String.valueOf(ss.groundck().get(0).getGround());
		log.info(ground);
		a = Integer.parseInt(ground);
		String ck = null;
		if(a>60 && a<70) {
			ck="GOOD";
		}else if(a<=60){
			ck="DRY";
		}else if(a>=70){
			ck="WET";
		}
		log.info(ck);
		return ck;		
	}
	
	//수위간략
	@GetMapping("/watercheck")
	public String watercheck() {
		int a;
		String water = String.valueOf(ss.waterck().get(0).getWater());
		log.info(water);
		a = Integer.parseInt(water);
		String ck = null;
		if(a>=50) {
			ck="GOOD";
		}else if(a<50){
			ck="LOW";
		}
		log.info(ck);
		return ck;		
	}
	
}
	

