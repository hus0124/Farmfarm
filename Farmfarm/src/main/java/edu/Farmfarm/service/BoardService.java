package edu.Farmfarm.service;

import java.util.List;

import edu.Farmfarm.domain.BoardVO;
import edu.Farmfarm.domain.Criteria;

public interface BoardService {

	public void register(BoardVO board);

	public BoardVO get(Long bno);

	public boolean modify(BoardVO board);

	public boolean remove(Long bno);

	// public List<BoardVO> getList();

	public List<BoardVO> getList(Criteria cri);

	//추가
	public int getTotal(Criteria cri);

}
