package net.lele.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.lele.domain.Notice;
import net.lele.service.AskService;
import net.lele.service.CategoryService;
import net.lele.service.NoticeService;
import net.lele.service.ProductService;
import net.lele.service.Product_imageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URLEncoder;

@Controller
public class AdminController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	AskService askService;

	@Autowired
	ProductService productService;
	@Autowired
	Product_imageService product_imageService;
	
	@RequestMapping("/admin/index")
	public String index(Model model) {
		
		return "admin/index";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("/admin/notice")
	public String notice(Model model, Notice notice) {
		model.addAttribute("category", categoryService.findAll());
		return "admin/notice";
	}
	
	@RequestMapping(value = "/admin/notice", method = RequestMethod.POST)
	public String notice(Model model, Notice notice, BindingResult bindingResult) {
		if(noticeService.hasErrors(notice, bindingResult)) {
			model.addAttribute("category", categoryService.findAll());
			return "admin/notice";
		}
		noticeService.save(notice);
		return "redirect:/shop/notice";
	}
	
	@RequestMapping("/admin/asklist")
	public String ask(Model model) {
		model.addAttribute("ask", askService.findByOrderByIdDesc());
		
		return "admin/asklist";
	}

	@RequestMapping("/admin/dir")
	public String dir(Model model) {
		
		return "admin/dir";
	}

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/admin/filecheck")
	public String downloadFile(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			String fileName = request.getParameter("fileName");
			String filePath = "C:/Users/test/Desktop/folder/Smarket/src/main/webapp/upload";
			File dFile  = new File(filePath, fileName);
			int fSize = (int) dFile.length();
			
			if (fSize > 0) {
				
				String encodedFilename = "attachment; filename*=" + "UTF-8" + "''" + URLEncoder.encode(fileName, "UTF-8");
				response.setContentType("application/octet-stream; charset=utf-8");
				response.setHeader("Content-Disposition", encodedFilename);
				response.setContentLengthLong(fSize);
	
				BufferedInputStream in = null;
				BufferedOutputStream out = null;
			
				in = new BufferedInputStream(new FileInputStream(dFile));
				out = new BufferedOutputStream(response.getOutputStream());
				
				try {
					byte[] buffer = new byte[4096];
				 	int bytesRead=0;

				 	while ((bytesRead = in.read(buffer))!=-1) {
						out.write(buffer, 0, bytesRead);
					}
					out.flush();
				}
				finally {
					in.close();
					out.close();
				}
		    } else {
		    	throw new FileNotFoundException("파일이 없습니다.");
		    }
		}
		catch (Exception e) {
			logger.info(e.getMessage());
		}

		model.addAttribute("product", productService.findAllDesc());
		model.addAttribute("product_image", product_imageService.findByProductidgroup());

		return "admin/filecheck";
	}
}

