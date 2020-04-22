package edu.Farmfarm.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

  private Long rno;
  private String ID;
  private String reply;
  private String replyer;
  private Date replyDate;
  private Date updateDate;

}
