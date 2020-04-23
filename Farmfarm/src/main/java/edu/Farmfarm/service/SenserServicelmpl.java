package edu.Farmfarm.service;



import java.util.List;

import org.springframework.stereotype.Service;


import edu.Farmfarm.domain.SensorVO;
import edu.Farmfarm.mapper.SensorMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SenserServicelmpl implements SensorService {
	private SensorMapper smapper;
	@Override
	public List<SensorVO> weektemp() {
		log.info("read" );
		return smapper.weektemp();
	}
	
	@Override
	public List<SensorVO> weeklight() {
		log.info("read");
		return smapper.weeklight();
	}
	
	@Override
	public List<SensorVO> weekground() {
		log.info("read");
		return smapper.weekground();
	}
	
	@Override
	public List<SensorVO> weekwater() {
		log.info("read");
		return smapper.weekwater();
	}
	
	@Override
	public List<SensorVO> tempck() {
		log.info("read" );
		return smapper.tempck();
	}
	
	@Override
	public List<SensorVO> lightck() {
		log.info("read");
		return smapper.lightck();
	}
	
	@Override
	public List<SensorVO> groundck() {
		log.info("read");
		return smapper.groundck();
	}
	
	@Override
	public List<SensorVO> waterck() {
		log.info("read");
		return smapper.waterck();
	}

	@Override
	public Integer maxnum() {
		log.info("maxnum" );
		return smapper.maxnum();
	}
	
	@Override
	public List<SensorVO> weektime() {
		log.info("read");
		return smapper.weektime();
	}
}
