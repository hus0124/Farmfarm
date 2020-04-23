package edu.Farmfarm.controller;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.Farmfarm.domain.SensorVO;
import edu.Farmfarm.service.FarmService;
import edu.Farmfarm.service.SensorService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/test/*")
@Log4j
@AllArgsConstructor
public class HWDBtestController {
	@Setter (onMethod_= @Autowired)
	private SensorService sservice;
	private FarmService service;
	
	@GetMapping("/dht11")
	public void test1() {
		
	}
	
	@GetMapping("/dht11db")
	public void test2(SensorVO sensorVO) {
		log.info("온도 ok : " + sensorVO.getTemp());
		log.info("수위 ok : " + sensorVO.getWater());
		log.info("조도 ok : " + sensorVO.getLight());
		log.info("토양 ok : " + sensorVO.getGround());
		service.insert(sensorVO);
	}
		
	@GetMapping("/testWeb")
	public String testWeb(HttpSession httpSession) {
		Object object = httpSession.getAttribute("nowuser");
		if (object!=null) {
			return "/test/testWeb";
		}
		else
			return "/user/index";
	}
	
	@GetMapping("/WebServLED")
	public String WebservLED(@RequestParam("LED") int LED, RedirectAttributes rttr) throws IOException {
		log.info(LED);
		String address = "http://bigmit.iptime.org:3380/LED=";
		//BufferedReader br;
		URL url;
		HttpURLConnection conn;
		String protocol = "GET";
		
		url = new URL(address+LED);
		log.info(address+LED);
		conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod(protocol);
		conn.getInputStream();
		//br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		conn.disconnect();
		return "/test/testWeb";
	}

}

