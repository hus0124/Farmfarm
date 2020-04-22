package edu.Farmfarm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import edu.Farmfarm.domain.Criteria;
import edu.Farmfarm.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);

	public ReplyVO read(Long rno);

	public int delete(Long rno);

	public int update(ReplyVO reply);

	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("ID") String ID);

	public int getCountByID(String ID);
	
}
