package edu.Farmfarm.service;



import java.util.List;

import org.springframework.stereotype.Service;

import edu.Farmfarm.domain.Criteria;
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
	public List<SensorVO> weektemp1(Criteria cri) {
		log.info("read" );
		return smapper.weektemp();
	}

	@Override
	public List<SensorVO> weekhumid() {
		log.info("read");
		return smapper.weekhumid();
	}

	@Override
	public int maxnum() {
		log.info("maxnum" );
		return smapper.maxnum();
	}
	
	@Override
	public List<SensorVO> weektime() {
		log.info("read");
		return smapper.weekhumid();
	}

	@Override
	public List<SensorVO> testChart() {
		// TODO Auto-generated method stub
		log.info("테스트 차트 VO 읽어들이기");
		return smapper.testChart();
	}
}
