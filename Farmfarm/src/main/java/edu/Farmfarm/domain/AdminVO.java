package edu.Farmfarm.domain;


import lombok.Data;

@Data
public class AdminVO {

	private int seq;
  private String ID;
  private String Username;
  private String content;
  private String Email;
  private String Serialnum;
  private int totaltest;
  // private Date updateDate;
}
