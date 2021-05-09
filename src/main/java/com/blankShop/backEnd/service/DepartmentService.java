package com.blankShop.backEnd.service;

import java.util.List;

import com.blankShop.model.Department;


public interface DepartmentService {
	List<Department> getAllDepartments();
	Department getDepartment(Integer id);

}
