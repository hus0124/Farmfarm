package edu.Farmfarm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.Farmfarm.domain.LoginDTO;
import edu.Farmfarm.domain.UserVO;
import edu.Farmfarm.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@Log4j
@AllArgsConstructor
public class UserController {

	private UserService service;
	
	//로그인 페이지
	@GetMapping("/login")
	public void loginPage() {
		
	}
	
	// 회원가입 페이지
    @GetMapping("/register")
    public void registerGET() throws Exception {
        
    }
    
    // 회원가입 처리
    @PostMapping("/register")
    public String registerPOST(UserVO userVO, RedirectAttributes redirectAttributes) throws Exception {

        String hashedPw = BCrypt.hashpw(userVO.getPW(), BCrypt.gensalt());
        userVO.setPW(hashedPw);
        service.register(userVO);
        redirectAttributes.addFlashAttribute("msg", "REGISTERED");
        log.info("register controller 작동");
        return "redirect:/user/login";
    }
    
    // 로그인 확인 처리
    @PostMapping("/loginpost")
    public void loginPost(LoginDTO loginDTO, HttpSession httpsession, Model model) {
    	
    	UserVO userVO = service.login(loginDTO);

        if (userVO == null || !BCrypt.checkpw(loginDTO.getPW(), userVO.getPW())) {
            return;
        }

        model.addAttribute("user", userVO);
    	
    }
    
    // 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) {

		Object object = httpSession.getAttribute("login"); // login 이라는 객체가 존재하면...
		
		if (object != null) {
		
		httpSession.removeAttribute("login");
		httpSession.invalidate();
		
		}
		
		return "/user/logout";
    }
}
