package com.saw.good.index.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.index.model.service.IndexService;

@Controller
public class IndexAjaxController {
	
	@Autowired
	private IndexService service;
	
	

}
