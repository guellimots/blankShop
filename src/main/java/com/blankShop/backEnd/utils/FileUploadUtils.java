package com.blankShop.backEnd.utils;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUploadUtils {
	@Autowired
	ResourceLoader resourceLoader;
	
	public String FileUpload(MultipartFile file, Integer id,Integer position) throws IOException {
		
		if (file.isEmpty()) {
			System.out.println("檔案為空");
		}
		String fileName = file.getOriginalFilename(); // 檔名
		String suffixName = fileName.substring(fileName.lastIndexOf(".")); // 字尾名
		String filePath = "src/main/resources/static/img/product/"; // 上傳後的路徑
		fileName = id + "-" + position + suffixName; // 新檔名
		
		
		Resource resource = resourceLoader.getResource("classpath:static/img/product/"); 
		
        File filetools = new File(resource.getURL().getPath()+fileName);
        		
		if (!filetools.getParentFile().exists()) {
			filetools.getParentFile().mkdirs();
		}
		try {
			file.transferTo(filetools.getAbsoluteFile());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "/blankShop/"+filePath.substring(filePath.indexOf("img/"))+fileName ;

	}

}
