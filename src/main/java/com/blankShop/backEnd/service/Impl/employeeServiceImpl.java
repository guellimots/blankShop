package com.blankShop.backEnd.service.Impl;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blankShop.model.Employee;
import com.blankShop.backEnd.repository.EmployeeDaoImpl;
import com.blankShop.backEnd.repository.employeeRepository;
import com.blankShop.backEnd.service.employeeService;


@Service
public class employeeServiceImpl implements employeeService{

	@Autowired
	employeeRepository employeerepository;

	@Autowired
	EmployeeDaoImpl employeeDao;
	
	@Override
	public boolean checkemail(String email, String password) {
		 try {
			 Employee checkResult = employeerepository.findByEmailAndPassword(email,password);
			 if(checkResult != null) 
			 {
				 return true;
			 }	
		 }catch(Exception e) {
			 e.printStackTrace();
		 }		 	 		
		 return false;
	}

	@Override
	public Employee findemployee(String email) {
		Employee findResult = employeerepository.findByEmail(email);
		return findResult;
	}
	
	@Override
	public Employee save(Employee employee) {
		return employeeDao.save(employee);
	}
	
	@Override
	public void delete(Integer empid) {
		employeeDao.deleteById(empid);
	}
	
	@Override
	public void update(Employee employee) {
		employeeDao.save(employee);
	}
	


	
	@Override
	public Employee get(Integer empid) {
		Optional<Employee> optional = employeeDao.findById(empid);
		Employee employee = null;
		if (optional.isPresent()) {
			employee = optional.get();
		} else {
			throw new RuntimeException("Employee(id=" + empid + ")不存在");
		}
		return employee;
	}
	@Override
	public List<Employee> searchEmps(String name){
        //记得加 %  %
        return employeeDao.findAllByEmpNameLike("%"+name+"%");
	
	}


	@Override
	public List<Employee> getAllEmployee() {
		return employeeDao.findAll();
	}
	
	//用身分證找員工
	@Override
	public Boolean findByPersonID(String personID) {
		Employee findResult = employeerepository.findByPersonID(personID);
		if (findResult!=null) 
		return false;
		else 
		return true;
	}

	@Override
	public byte[] findByphoto(String username) {
		return employeerepository.findempphoto(username);
	}
	
		
}
