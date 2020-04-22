package edu.Farmfarm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.Farmfarm.domain.Criteria;
import edu.Farmfarm.domain.ReplyPageDTO;
import edu.Farmfarm.domain.ReplyVO;
import edu.Farmfarm.mapper.ReplyMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

  
  private ReplyMapper mapper;

  
  
  @Override
  public int register(ReplyVO vo) {

    log.info("register......" + vo);

    return mapper.insert(vo);

  }

  @Override
  public ReplyVO get(Long rno) {

    log.info("get......" + rno);

    return mapper.read(rno);

  }

  @Override
  public int modify(ReplyVO vo) {

    log.info("modify......" + vo);

    return mapper.update(vo);

  }

  @Override
  public int remove(Long rno) {

    log.info("remove...." + rno);

    return mapper.delete(rno);

  }

  @Override
  public List<ReplyVO> getList(Criteria cri, String ID) {

    log.info("get Reply List of a Board " + ID);

    return mapper.getListWithPaging(cri, ID);

  }
  
  @Override
  public ReplyPageDTO getListPage(Criteria cri, String ID) {
    
	  
    return new ReplyPageDTO(
        mapper.getCountByID(ID), 
        mapper.getListWithPaging(cri, ID));
  }

}

