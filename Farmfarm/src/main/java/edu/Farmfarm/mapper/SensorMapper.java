package edu.Farmfarm.mapper;

import java.util.List;

import edu.Farmfarm.domain.Criteria;
import edu.Farmfarm.domain.SensorVO;

public interface SensorMapper {
	
	public List<SensorVO> weektemp();
	
	public List<SensorVO> weektempcri(Criteria cri);
	
	public List<SensorVO> weekhumid();
	
	public List<SensorVO> weektime();
 	
	public int maxnum();
	
	public List<SensorVO> testChart();

}