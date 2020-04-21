package edu.Farmfarm.service;

import org.springframework.stereotype.Service;

import edu.Farmfarm.domain.LoginDTO;
import edu.Farmfarm.domain.UserVO;
import edu.Farmfarm.mapper.UserMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	private UserMapper mapper;
	
	//회원등록
	@Override
	public void register(UserVO userVO) {
		
		log.info("*** 유저 등록 : " + userVO);
		mapper.register(userVO);

	}

	//로그인처리
	@Override
	public UserVO login(LoginDTO loginDTO) {
		
		log.info("*** 로그인) : " + loginDTO);
		return mapper.login(loginDTO);
	}

	//내정보보기
	@Override
	public UserVO myInfo(Object object) {
		
		log.info("***내정보 조회 : " + object);
		return mapper.myInfo(object);
	}

	//내 정보 수정
	
	@Override
	public void changeName(UserVO userVO) {
		
		mapper.changeName(userVO);
	}

	@Override
	public void changeEmail(UserVO userVO) {
		
		mapper.changeEmail(userVO);
	}

	@Override
	public void changeSerial(UserVO userVO) {
		
		mapper.changeSerial(userVO);
	}

	@Override
	public void changePW(LoginDTO loginDTO) {
		
		mapper.changePW(loginDTO);
	}
	
	//탈퇴
	@Override
	public void leave(UserVO userVO) {
		
		mapper.leave(userVO);
	}

	//아이디중복체크
	@Override
	public int checkOverId(String ID) {
		
		return mapper.checkOverId(ID);
	}

}
