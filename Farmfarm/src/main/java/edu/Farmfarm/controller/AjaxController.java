package edu.Farmfarm.controller;

import java.sql.Array;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ListModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import edu.Farmfarm.domain.Criteria;
import edu.Farmfarm.domain.SensorVO;
import edu.Farmfarm.mapper.SensorMapper;
import edu.Farmfarm.service.SensorService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.var;
import lombok.extern.log4j.Log4j;
@Log4j
@RestController
@RequestMapping("/ajax/*")
@AllArgsConstructor
public class AjaxController {

	private SensorService ss;

	@GetMapping("/humid")
	public String humid() {
		
		String humid = String.valueOf(ss.weekhumid().get(0).getHumid());
		log.info("그냥 humid 정보" + humid);
		return humid;
	}
	
	@GetMapping("/wkhumid")
	@ResponseBody
	public List<String> wkhumid(Local local, Model model) {
		List<String> humidlist =new ArrayList<String>();
		for(int i=0;i<7;i++) {
			String humid=String.valueOf(ss.weekhumid().get(i).getHumid());
			humidlist.add(humid);
		}
		log.info("*****리스트 값 나옴???" + humidlist);
		return humidlist;
	}

	
}
	

