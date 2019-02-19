package com.project.common.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class UploadFileUtils {

//  public static String uploadFile(String uploadPath, 
//      String originalName, 
//      byte[] fileData)throws Exception{
//    
//    return null;
//  }
  

//  public static String uploadFile(String uploadPath, 
//      String originalName, 
//      byte[] fileData)throws Exception{
//    
//    return null;
//  }
//  


	 //파일을 폴더에 업로드 하는 메서드
	  //uploadFile(저장위치,원래 파일명,byte 단위로 파일을 읽어올 수 있는 데이터 객체)
	  // --> uploadFile(저장 위치, MultipartFile)	
  public static String uploadFile(String uploadPath, 
//                              String originalName,  byte[] fileData
		  MultipartFile mfile )throws Exception{
	  
	//파일명의 중복을 배제시키기 위해 파일 앞에 붙이는 uid
    UUID uid = UUID.randomUUID();
    
    //업로드한 사람의 컴퓨터에 저장되어 있던 파일명
    String originalName = mfile.getOriginalFilename();
    //서버 컴퓨터에 저장되는 파일명
    String savedName = uid.toString() +"_"+originalName;
    
  //  String savedPath = calcPath(uploadPath);
    //new file(경로가 포함된 파일명) / new file(경로. 파일명)
    File target = new File(uploadPath,savedName);
//  FileCopyUtils.copy(fileData, target);
 //경로에 맞춰서 저장한다.
    FileCopyUtils.copy(mfile.getBytes(), target);
    //이미지 파일인지 확인하기 위해 확장자를 가져온다. 
    String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
    //저장한 파일명 선언 
    String uploadedFileName = null;
    //이미지 파일인지 확인한다. 
    if(MediaUtils.getMediaType(formatName) != null){
    	 //이미지 파일인 경우, 높이 사이지를 100px로 만들어서 저장한 후에 파일명을 리턴한다.	
      uploadedFileName = makeThumbnail(uploadPath,  savedName);
    }else{
      uploadedFileName = makeIcon(uploadPath,  savedName);
    }
    //이미지 파일인 경우, 썸네일 이미지 파일 이름이 넘어가고 아니면 원본 파일 이름이 넘어간다. 
    return uploadedFileName;
    
  }
  
  private static  String makeIcon(String uploadPath, 
//      String path, 
      String fileName)throws Exception{

    String iconName = 
        uploadPath + File.separator+ fileName;
    
    return iconName.substring(
        uploadPath.length()).replace(File.separatorChar, '/');
  }
  
  //이미지의 사이즈를 고쳐서 다시 저장해준다.
  //사용법 
  //makeThumbnail (저장위치, 파일명) -- > 파일에 대한 높이를 지정한다.
  private static  String makeThumbnail(
              String uploadPath, 
//              String path, 
              String fileName)throws Exception{
	  //이미지를 바이트 단위로 읽어올 수 있도록 먼저 파일객체로 만들고   bufferedImage(임시 저장소)에 담아둔다.         
    BufferedImage sourceImg = 
        ImageIO.read(new File(uploadPath, fileName));
    //임시 저장소에 담아둔 이미지 파일을 높이 100px로 조정한 후 다른 임시 저장소(destImg)에 담아둔다. 
    BufferedImage destImg = 
        Scalr.resize(sourceImg, 
            Scalr.Method.AUTOMATIC, 
            Scalr.Mode.FIT_TO_HEIGHT,100); //높이
    //실제적으로 저장해야 하는 파일명 작성(문자열)
    //폴더 (위치) + 파일 구분자(보통 \ 사용) + "S_"(small) + 파일명   
    String thumbnailName = 
        uploadPath  + File.separator +"s_"+ fileName;
    //작은 이미지 이름으로 파일 객체를 만든다.
    File newFile = new File(thumbnailName);
    //확장자를 알아낸다.
    String formatName = 
        fileName.substring(fileName.lastIndexOf(".")+1);
    
  //ImageIO.write(이미지 데이터 / 이미지 타입(gif,jpg,png) / 새로 저장해야 할  파일 객체)
    ImageIO.write(destImg, formatName.toUpperCase(), newFile);
    //DB에 파일명을 저장해야 하므로 썸네일 파일명을 리턴해준다.
    return thumbnailName.substring( //길이 먼저 구함
        uploadPath.length()).replace(File.separatorChar, '/');
  //substring( //길이를 먼저 계산한다.
	//uploadPath.length())파일의 길이를 구하고
	//separatorChar(\)가 문자열 처리되는 경우 특수문자 인식이 될 수 있으므로 (/)로 바꿔준다.
	//()는 안쪽부터, .은 앞에서 순서대로 실행된다. 
  } 
  
 // 년/월/일 폴더를 작성해서 만드는 메서드 
//  private static String calcPath(String uploadPath){
//    
//    Calendar cal = Calendar.getInstance();
//    
//    String yearPath = File.separator+cal.get(Calendar.YEAR);
//    
//    String monthPath = yearPath + 
//        File.separator + 
//        new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
//
//    String datePath = monthPath + 
//        File.separator + 
//        new DecimalFormat("00").format(cal.get(Calendar.DATE));
//    
//    makeDir(uploadPath, yearPath,monthPath,datePath);
//        
//    return datePath;
//  }
//  
//  업로드 날짜 폴더 존재하지 않으면 만드는 메서드
//  private static void makeDir(String uploadPath, String... paths){
//    
//    if(new File(paths[paths.length-1]).exists()){
//      return;
//    }
//    
//    for (String path : paths) {
//      
//      File dirPath = new File(uploadPath + path);
//      
//      if(! dirPath.exists() ){
//        dirPath.mkdir();
//      } 
//    }
//  }

  
}
