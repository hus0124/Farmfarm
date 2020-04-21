package edu.Farmfarm.service;



import java.util.List;

import edu.Farmfarm.domain.Criteria;
import edu.Farmfarm.domain.SensorVO;

public interface SensorService {
	
	public List<SensorVO> weektemp();
	
	public List<SensorVO> weektemp1(Criteria criS);
	
	public List<SensorVO> weekhumid();
	
	public List<SensorVO> weektime();
	
	public int maxnum();
	
	public List<SensorVO> testChart();
	
}