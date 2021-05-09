package com.blankShop.backEnd.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blankShop.model.Member;

public interface AdvertMailRepository extends JpaRepository<Member, Integer> {

}
