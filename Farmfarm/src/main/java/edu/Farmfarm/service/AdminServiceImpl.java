package edu.Farmfarm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.Farmfarm.domain.AdminVO;
import edu.Farmfarm.domain.Criteria;
import edu.Farmfarm.mapper.AdminMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

	private AdminMapper mapper;

	@Override
	public void register(AdminVO admin) {

		log.info("register......" + admin);

		mapper.insertSelectKey(admin);
	}

	@Override
	public AdminVO get(String ID) {

		log.info("get......" + ID);

		return mapper.read(ID);

	}

	@Override
	public boolean modify(AdminVO admin) {
		log.info("modify......" + admin);
		return mapper.update(admin) == 1;
	}

	@Override
	public boolean remove(String ID) {
		log.info("remove...." + ID);
		return mapper.delete(ID) == 1;
	}

	// @Override
	// public List<BoardVO> getList() {
	// log.info("getList..........");
	// return mapper.getList();
	// }

	@Override
	public List<AdminVO> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	@Override
	public List<AdminVO> totaltest() {
		log.info("get total count");
		return mapper.totaltest();
	}
}
