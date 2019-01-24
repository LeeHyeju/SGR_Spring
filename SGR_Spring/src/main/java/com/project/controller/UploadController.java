package com.project.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.common.util.UploadFileUtils;

@Controller
public class UploadController {

	@Resource(name ="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public void uploadForm() throws Exception{
		System.out.println("파일 업로드-get");
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception{
		System.out.println("파일 업로드-post");
		System.out.println("originalName:  " + file.getOriginalFilename());
		System.out.println("size :   " +file.getSize());
		System.out.println("contentType :  " + file.getContentType());
		
		String savedName = uploadFile (file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);
		
		return "uploadResult";
	}
	
	public String uploadFile(String originalName, byte[] fileData) throws Exception{
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	@RequestMapping(value="/uploadAjax", method=RequestMethod.GET)
	public void uploadAjax(){
		System.out.println("아작스로 업로드 - get");
	}
	
	 @ResponseBody
	  @RequestMapping(value ="/uploadAjax", method=RequestMethod.POST, 
	                  produces = "text/plain;charset=UTF-8")
	  public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{
	    
		 System.out.println("originalName: " + file.getOriginalFilename());
	    
	    return 
	      new ResponseEntity<>(
	    		  UploadFileUtils.uploadFile(uploadPath, 
	    	                file.getOriginalFilename(), 
	    	                file.getBytes()), 
	    		  HttpStatus.CREATED);
	  }
	  
}
