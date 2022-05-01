package com.campus.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/support/*")
public class supportController {
   

	@GetMapping("supportView")
   public ModelAndView supportView() {
	   ModelAndView mav = new ModelAndView();
	   mav.setViewName("support/supportView"); 
	   return mav;
   }
   
}
