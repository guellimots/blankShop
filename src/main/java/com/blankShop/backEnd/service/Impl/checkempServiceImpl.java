package com.blankShop.backEnd.service.Impl;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.blankShop.backEnd.repository.checkempRepository;
import com.blankShop.backEnd.service.checkempService;
import com.blankShop.model.Employee;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

@Service
public class checkempServiceImpl implements checkempService {

	@Autowired
	checkempRepository checkemprepository;
	
	Logger logger = LogManager.getLogger(getClass());
	
	
	//權限判斷
	@Override
	public boolean checkempid(Integer empId) {
		try {
			logger.info("開始執行"+empId.toString()+"權限判斷");
			Optional<Employee> checkresult =  checkemprepository.findById(empId);
			if(checkresult.get().getRankTitle().equals("主管")) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
			logger.error("執行"+empId.toString()+"權限判斷發生錯誤:"+e);
		}finally {
			logger.info("執行"+empId.toString()+"權限判斷完畢");
		}
		return false;
	}

	//個別員工更新資料查詢
	@Override
	public String getempname(Integer empid) {
		Optional<Employee> empname = null;		
		try {
			logger.info("開始查詢"+empid.toString()+"員工姓名");
			empname = checkemprepository.findById(empid);
			return empname.get().getEmpName();
		}catch(Exception e) {
			logger.error("開始查詢"+empid.toString()+"員工姓名發生錯誤:"+e);
		}finally {
			logger.info("開始查詢"+empid.toString()+"員工姓名完畢");
		}
		return empname.get().getEmpName();
	}

}
