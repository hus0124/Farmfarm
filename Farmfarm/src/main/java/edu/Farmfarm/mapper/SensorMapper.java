package edu.Farmfarm.mapper;

import java.util.List;

import edu.Farmfarm.domain.SensorVO;

public interface SensorMapper {
	
public List<SensorVO> weektemp();
	
	public List<SensorVO> weeklight();
	
	public List<SensorVO> weekground();
	
	public List<SensorVO> weekwater();
	
	public List<SensorVO> weektime();
 	
	public List<SensorVO> tempck();
	
	public List<SensorVO> lightck();
	
	public List<SensorVO> groundck();
	
	public List<SensorVO> waterck();
	
	public Integer maxnum();

}