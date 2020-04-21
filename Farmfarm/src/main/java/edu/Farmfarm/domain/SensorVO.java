package edu.Farmfarm.domain;



import java.sql.Timestamp;

import lombok.Data;

@Data
public class SensorVO {
	private int seq;
	private int Temp;
	private int Humid;
	private int Ground;
	private String Time;
	private int Water;
	private int Light;
	private String Serialnum;

}