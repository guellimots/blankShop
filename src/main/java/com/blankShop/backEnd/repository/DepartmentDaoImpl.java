package com.blankShop.backEnd.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blankShop.model.Department;



public interface DepartmentDaoImpl extends JpaRepository<Department, Integer>{

}
