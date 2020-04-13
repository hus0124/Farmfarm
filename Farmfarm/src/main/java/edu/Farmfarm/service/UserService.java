package edu.Farmfarm.service;

import edu.Farmfarm.domain.LoginDTO;
import edu.Farmfarm.domain.UserVO;

public interface UserService {

	 // 회원가입 처리
    void register(UserVO userVO);
    
    // 로그인
    UserVO login(LoginDTO loginDTO);
}
