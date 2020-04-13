package edu.Farmfarm.service;

import org.springframework.stereotype.Service;

import edu.Farmfarm.domain.UserVO;
import edu.Farmfarm.mapper.UserMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	private UserMapper mapper;
	
	@Override
	public void register(UserVO userVO) throws Exception {
		
		log.info("*** 유저 등록 : " + userVO);
		mapper.register(userVO);

	}

}
