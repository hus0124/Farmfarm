package edu.Farmfarm.service;

import org.springframework.stereotype.Service;

import edu.Farmfarm.domain.SensorVO;
import edu.Farmfarm.mapper.FarmMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FarmServicelmpl implements FarmService {

	private FarmMapper mapper;
	
	@Override
	public void insert(SensorVO sensorVO) {
		
		mapper.insert(sensorVO);
	}

}
