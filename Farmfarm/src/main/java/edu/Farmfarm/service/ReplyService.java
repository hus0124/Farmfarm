package edu.Farmfarm.service;

import java.util.List;

import edu.Farmfarm.domain.Criteria;
import edu.Farmfarm.domain.ReplyPageDTO;
import edu.Farmfarm.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);

	public ReplyVO get(Long rno);

	public int modify(ReplyVO vo);

	public int remove(Long rno);

	public List<ReplyVO> getList(Criteria cri, String ID);
	
	public ReplyPageDTO getListPage(Criteria cri, String ID);

}
