package edu.Farmfarm.mapper;

import edu.Farmfarm.domain.LoginDTO;
import edu.Farmfarm.domain.UserVO;

public interface UserMapper {

	void register(UserVO userVO);
	
	UserVO login(LoginDTO loginDTO);
	
	UserVO myInfo(Object object);
	
	void changeName(UserVO userVO);
	
	void changeEmail(UserVO userVO);
	
	void changeSerial(UserVO userVO);
	
	void changePW(LoginDTO loginDTO);
	
	void leave(UserVO userVO);
	
	int checkOverId(String ID);
}
