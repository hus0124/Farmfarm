package edu.Farmfarm.service;

import edu.Farmfarm.domain.UserVO;

public interface UserService {

	 // 회원가입 처리
    void register(UserVO userVO) throws Exception;
}
