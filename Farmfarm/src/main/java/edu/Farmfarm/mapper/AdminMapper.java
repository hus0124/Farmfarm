package edu.Farmfarm.mapper;

import java.util.List;

import edu.Farmfarm.domain.AdminVO;
import edu.Farmfarm.domain.Criteria;

public interface AdminMapper {

	public List<AdminVO> getList();

	public List<AdminVO> getListWithPaging(Criteria cri);

	public void insert(AdminVO admin);

	public Integer insertSelectKey(AdminVO admin);

	public AdminVO read(String ID);

	public int delete(String ID);

	public int update(AdminVO admin);

	public int getTotalCount(Criteria cri);
	
	public List<AdminVO> totaltest();	// 객체니까 List로 받고 리턴할게있고 줄게없으니까 파라메터 없다
}
