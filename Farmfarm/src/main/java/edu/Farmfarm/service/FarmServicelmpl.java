package edu.Farmfarm.service;

import org.springframework.stereotype.Service;

import edu.Farmfarm.mapper.FarmMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FarmServicelmpl implements FarmService {

	private FarmMapper mapper;
	
	@Override
	public void insert(int num) {
		
		mapper.insert(num);
	}

}
