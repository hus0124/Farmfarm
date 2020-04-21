package edu.Farmfarm.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int first;
	private int last;
	
	public Criteria(int first,int last) {
		this.first=first;
		this.last=last;
	
	}
	
	public Criteria() {
		this(1,7);
	}
}
