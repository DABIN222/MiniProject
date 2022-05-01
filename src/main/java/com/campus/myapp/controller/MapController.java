package com.campus.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/map/*")
public class MapController {

	@GetMapping("mapView")
	public ModelAndView supportView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("map/mapView");
		return mav;
	}

	@GetMapping("mapList")
	public ModelAndView mapList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("map/mapList");
		return mav;
	}

}
