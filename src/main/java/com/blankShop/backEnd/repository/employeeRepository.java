package com.blankShop.backEnd.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.blankShop.model.Employee;

public interface employeeRepository extends JpaRepository<Employee, String> {

	
	public Employee findByEmailAndPassword(String email, String password);
	public Employee findByEmail(String email);
	public Employee findByPersonID(String personID);
	
	@Query(value = "select empImg from Employee where empName = ?", nativeQuery = true)
	public byte[] findempphoto(String username);
	
}

