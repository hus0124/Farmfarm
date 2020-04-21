package edu.Farmfarm.controller;



import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public void test2(@RequestParam("Temp") int temp) {
		log.info("ok : " + temp);
		service.insert(temp);
	}
	@GetMapping("/chart")
		public void chart() {
		log.info(sservice.weekhumid().get(0));
	
		}
	
	@GetMapping("/tchart")
	public void testchart(Model model) {
		List<SensorVO> testList = sservice.testChart();
			
		log.info("테스트 리스트 원본" + testList);
		
		model.addAttribute("testList", testList);
	}
	
	}

