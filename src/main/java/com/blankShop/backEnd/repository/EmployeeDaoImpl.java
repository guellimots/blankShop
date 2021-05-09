package com.blankShop.backEnd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.blankShop.model.Employee;


public interface EmployeeDaoImpl extends JpaRepository<Employee, Integer> {

	List<Employee> findAllByEmpNameLike(String name);
	
		

}
