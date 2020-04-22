package edu.Farmfarm.service;

import java.util.List;

import edu.Farmfarm.domain.AdminVO;
import edu.Farmfarm.domain.Criteria;

public interface AdminService {

	public void register(AdminVO admin);

	public AdminVO get(String ID);

	public boolean modify(AdminVO admin);

	public boolean remove(String ID);

	// public List<BoardVO> getList();

	public List<AdminVO> getList(Criteria cri);

	//추가
	public int getTotal(Criteria cri);
	
	public List<AdminVO> totaltest();
	

}
