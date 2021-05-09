package com.blankShop.backEnd.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blankShop.model.Employee;

public interface checkempRepository extends JpaRepository<Employee, Integer> {

}
