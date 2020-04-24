package edu.Farmfarm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.Farmfarm.domain.LoginDTO;
import edu.Farmfarm.domain.SensorVO;
import edu.Farmfarm.domain.UserVO;
import edu.Farmfarm.service.SensorService;
import edu.Farmfarm.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@Log4j
@AllArgsConstructor
public class UserController {

	private SensorService sservice;
	private UserService service;
	
	//index 화면처리
	@GetMapping("/index")
	public void index() {
				
	}
		
	//로그인 해서 들어오는 main 화면처리
	@PostMapping("/mainPotal")
	public String mainPotal(LoginDTO loginDTO, HttpSession httpsession, Model model) {
			
		UserVO userVO = service.login(loginDTO);
    	
    	log.info("***********loginDTO 제대로 들어오냐?:"+loginDTO);
    	log.info("***********userVO 제대로 들어오냐?:"+userVO);
    	
    	List<SensorVO> tempList = sservice.weektemp();
		List<SensorVO> timeList = sservice.weektime();
		log.info("테스트 리스트 원본" + tempList);
		log.info("테스트 리스트 원본" + timeList);
		model.addAttribute("tempList", tempList);
		model.addAttribute("timeList", timeList);
		
		List<SensorVO> lightList = sservice.weeklight();
		log.info("테스트 리스트 원본" + lightList);
		model.addAttribute("lightList", lightList);
		
		List<SensorVO> groundList = sservice.weekground();
		log.info("테스트 리스트 원본" + groundList);
		model.addAttribute("groundList", groundList);

		
		List<SensorVO> waterList = sservice.weekwater();
		log.info("테스트 리스트 원본" + waterList);
		model.addAttribute("waterList", waterList);
		
		if (userVO == null) { 
			return "/user/mainPotal"; 
		} 
		
		else if (BCrypt.checkpw(loginDTO.getPW(), userVO.getPW()) == false) { 
			return "/user/mainPotal"; 
		}
		
		else if (userVO.getID().equals("admin")) {
			httpsession.setAttribute("adminuser", "admin"); // 관리자 세션 부여
			httpsession.setAttribute("nowuser",	userVO.getID()); // 사용자 세션 부여
			log.info("****admin 아이디가 잘 뜨는가");
			return "redirect:/admin/list";
		}
		 
		else {
        	model.addAttribute("msg", "loginOK"); 
        	model.addAttribute("user1", userVO);
        	httpsession.setAttribute("nowuser",	userVO.getID()); // 사용자 세션 부여
        	return "/user/mainPotal";
       }
		
	}
	
	//로그인 이후에 mainPotal 버튼 링크
	@GetMapping("/mainPotal")
	public String getmainPotal(HttpSession httpSession, Model model) {
		List<SensorVO> tempList = sservice.weektemp();
		List<SensorVO> timeList = sservice.weektime();
		log.info("테스트 리스트 원본" + tempList);
		log.info("테스트 리스트 원본" + timeList);
		model.addAttribute("tempList", tempList);
		model.addAttribute("timeList", timeList);
		
		List<SensorVO> lightList = sservice.weeklight();
		log.info("테스트 리스트 원본" + lightList);
		model.addAttribute("lightList", lightList);
		
		List<SensorVO> groundList = sservice.weekground();
		log.info("테스트 리스트 원본" + groundList);
		model.addAttribute("groundList", groundList);

		
		List<SensorVO> waterList = sservice.weekwater();
		log.info("테스트 리스트 원본" + waterList);
		model.addAttribute("waterList", waterList);
		
		Object object = httpSession.getAttribute("nowuser");
		if(object!=null) {
			model.addAttribute("msg", "loginOK");
			return "/user/mainPotal";
		}
		else
			return "/user/mainPotal";
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
        return "redirect:/user/index";
    }
            
    // 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpSession httpSession) {

		Object object = httpSession.getAttribute("nowuser"); // nowuser 세션 받은 객체가 존재하면...
		log.info("*****로그아웃 세션 확인 : " + object);
		if (object != null) {
		
		httpSession.removeAttribute("nowuser");
		httpSession.invalidate();
		
		}
		
		return "/user/logout";
    }
    
    //내 정보보기
    @GetMapping("/myinfo")
    public String myinfo(HttpSession httpSession, Model model) {
    	Object object = httpSession.getAttribute("nowuser"); // nowuser는 UserVO.getID()
    	log.info("****내정보보기 세션 확인" + object);
    	
    	UserVO userVO = service.myInfo(object);
    	log.info("****정보 가져온 것 확인 : " + userVO);
    	model.addAttribute("info", userVO);
    	return "/user/myinfo";    	
    }
    
    // 내 정보 수정 Get 
    @GetMapping("/infochange1")
    public String infochange(@RequestParam("choice") int choice, Model model, HttpSession httpSession) {
    	Object object = httpSession.getAttribute("nowuser");
    	UserVO userVO = service.myInfo(object);
    	model.addAttribute("UserVO", userVO);
    	model.addAttribute("choice", choice);
    	return "/user/infochange";    	
    }
    
    //내 정보 수정 Post
    @PostMapping("/infochange")
    public String infochange(@RequestParam("choice") int choice, HttpSession httpSession, UserVO userVO, LoginDTO loginDTO, Model model) {
    	
    	Object object = httpSession.getAttribute("nowuser");
    	UserVO userVOtemp = service.myInfo(object); // 비번 확인 위한 임시 객체
    	log.info("***세션 사용자 temp정보 : " + userVOtemp);
    	
    	if(BCrypt.checkpw(loginDTO.getPW(), userVOtemp.getPW()) == false ) {
    		model.addAttribute("msg", "wrongPW");
    		model.addAttribute("choice", 1); // error 막기 위해 대충 숫자 입력.
    		return "/user/infochange";
    	}
    	
    	userVO.setID((String)httpSession.getAttribute("nowuser")); //쿼리 구문 ID 입력 위한 처리
    	log.info("****세션 ID 읽어들이기 : " + userVO.getID());
    	
    	switch(choice) {
	    	case 1:
	    		service.changeName(userVO);
	    		log.info("****이름 수정 : " + userVO.getUsername());
	    		break;
	    	case 2:
	    		service.changeEmail(userVO);
	    		log.info("****이메일 수정 : " + userVO.getEmail());
	    		break;
	    	case 3:
	    		service.changeSerial(userVO);
	    		log.info("****시리얼 수정 : " + userVO.getSerialnum());
	    		break;
    	
    	}
    	
    	model.addAttribute("msg", "changeOK");    	
    	return "/user/myinfo";
    	   	
    	}
    
    //비밀번호 변경
    @PostMapping("/pwchange")
	public String pwchange(@RequestParam("afterPW") String afterPW, HttpSession httpSession, UserVO userVO, LoginDTO loginDTO, Model model) {
    	
    	// 기존 입력 비번은 userVO에 맵핑 되고 새로 입력하는 비번은 loginDTO에
    	
    	Object object = httpSession.getAttribute("nowuser");
    	UserVO userVOtemp = service.myInfo(object); // 비번 확인 위한 임시 객체
    	log.info("***세션 사용자 temp정보 : " + userVOtemp);
    	
    	if(BCrypt.checkpw(userVO.getPW(), userVOtemp.getPW()) == false ) {
    		model.addAttribute("msg", "wrongPW");
    		model.addAttribute("choice", 1); // error 막기 위해 대충 숫자 입력.
    		return "/user/infochange";
    	}
    	
    	userVO.setID((String)httpSession.getAttribute("nowuser")); //쿼리 구문 ID 입력 위한 처리
    	log.info("****세션 ID 읽어들이기 : " + userVO.getID());
    	loginDTO.setID(userVO.getID());
		loginDTO.setPW(BCrypt.hashpw(afterPW, BCrypt.gensalt()));	// 아이디는 세션 아이디 그대로. 비번만 새로 입력한 afterPW 로 설정.
		
		service.changePW(loginDTO);
		log.info("****비밀번호 수정 : " + loginDTO);
    	model.addAttribute("msg", "changeOK");
		return "/user/myinfo";
    }
    
    @GetMapping("/leave")
    public void leaveget() {
    	
    }
    
    //탈퇴
    @PostMapping("/leave")
    public String leave(HttpSession httpSession, UserVO userVO, Model model, RedirectAttributes rttr) {
    	
    	Object object = httpSession.getAttribute("nowuser");
    	UserVO userVOtemp = service.myInfo(object); // 비번 확인 위한 임시 객체
    	log.info("***세션 사용자 temp정보 : " + userVOtemp);
    	
    	if(BCrypt.checkpw(userVO.getPW(), userVOtemp.getPW()) == false ) {
    		model.addAttribute("msg", "wrongPW");
    		model.addAttribute("choice", 1); // error 막기 위해 대충 숫자 입력.
    		return "/user/infochange";
    	}
    	userVO.setID(userVOtemp.getID());
    	service.leave(userVO);
    	log.info("***회원 정보 삭제 완료");
    	
    	rttr.addFlashAttribute("msg", "leaveOK");
    	return "redirect:/user/leave"; 
    }
    
    // 아이디 중복 처리
    @GetMapping("/idCheck")
    @ResponseBody
    public String idCheck(@RequestParam("ID") String ID) {
    	
    	return String.valueOf(service.checkOverId(ID));
    }
    
}
