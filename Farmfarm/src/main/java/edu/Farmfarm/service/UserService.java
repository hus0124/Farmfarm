package edu.Farmfarm.service;

import edu.Farmfarm.domain.LoginDTO;
import edu.Farmfarm.domain.UserVO;

public interface UserService {

	 // 회원가입 처리
    void register(UserVO userVO);
    
    // 로그인
    UserVO login(LoginDTO loginDTO);
    
    // 내정보보기
    UserVO myInfo(Object object);
    
    // 정보 수정. 이름, 이메일, 시리얼넘버, 비밀번호.
    void changeName(UserVO userVO);
	
	void changeEmail(UserVO userVO);
	
	void changeSerial(UserVO userVO);
	
	void changePW(LoginDTO loginDTO);
	
	//탈퇴
	void leave(UserVO userVO);
	
	//아이디 중복 체크
	int checkOverId(String ID);
}
