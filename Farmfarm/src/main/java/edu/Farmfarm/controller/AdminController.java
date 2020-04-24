package edu.Farmfarm.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.Farmfarm.domain.AdminVO;
import edu.Farmfarm.domain.Criteria;
import edu.Farmfarm.domain.PageDTO;
import edu.Farmfarm.domain.SensorVO;
import edu.Farmfarm.service.AdminService;
import edu.Farmfarm.service.SensorService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {

	private AdminService service;
	private SensorService sservice;

	@GetMapping("/register")
	public void register() {

	}

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("totaltest", service.totaltest().get(0).getTotaltest());
		// model.addAttribute("pageMaker", new PageDTO(cri, 123));

		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	@PostMapping("/register")
	public String register(AdminVO admin, RedirectAttributes rttr) {

		log.info("register: " + admin);

		service.register(admin);

		rttr.addFlashAttribute("result", admin.getID());

		return "redirect:/admin/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("id") String id, @ModelAttribute("cri") Criteria cri, Model model) {
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
		log.info("/get or modify 그리고 id 값" + id);
		model.addAttribute("admin", service.get(id));
	}
	
	@PostMapping("/modify")
	public String modify(AdminVO admin, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + admin);

		if (service.modify(admin)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/admin/list";
	}

	@GetMapping("/remove")
	public String remove(@RequestParam("ID") String ID, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + ID);
		if (service.remove(ID)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/admin/list";
	}

}
