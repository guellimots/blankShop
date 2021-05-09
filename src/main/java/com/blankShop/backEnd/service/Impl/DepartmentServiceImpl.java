package com.blankShop.backEnd.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blankShop.model.Department;
import com.blankShop.backEnd.repository.DepartmentDaoImpl;
import com.blankShop.backEnd.service.DepartmentService;



@Service
public class DepartmentServiceImpl implements DepartmentService{

	@Autowired
	DepartmentDaoImpl departmentDao;
	
	@Override
	public List<Department> getAllDepartments() {
		return (List<Department>) departmentDao.findAll();
	}

	@Override
	public Department getDepartment(Integer id) {
		Optional<Department> optional = departmentDao.findById(id); 
		Department department = null;
		if (optional.isPresent()) {
			department = optional.get();
		} else {
			throw new RuntimeException("Department(id=" + id + ")不存在");
		}
		return department;
	
	}
	



}
