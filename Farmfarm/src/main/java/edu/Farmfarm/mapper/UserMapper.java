package edu.Farmfarm.mapper;

import edu.Farmfarm.domain.LoginDTO;
import edu.Farmfarm.domain.UserVO;

public interface UserMapper {

	void register(UserVO userVO);
	
	UserVO login(LoginDTO loginDTO);
}
