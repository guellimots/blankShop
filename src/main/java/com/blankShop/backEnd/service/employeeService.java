package com.blankShop.backEnd.service;


import java.util.List;

import com.blankShop.model.Employee;

public interface employeeService {
		
	public boolean checkemail(String email, String password);
	public Employee findemployee(String email);
	public Employee save(Employee personID);
	public void delete(Integer empid);
	public void update(Employee employee);
	public List<Employee> getAllEmployee();
	public Employee get(Integer empid);
	public List<Employee> searchEmps(String name);
	public Boolean findByPersonID(String personID);
	public byte[] findByphoto(String username);
}
