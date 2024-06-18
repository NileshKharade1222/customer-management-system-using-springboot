package com.example.demo.Customer.repository;

import com.example.demo.Customer.model.Customer;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, String> {
    Optional<Customer> findByPhoneAndEmail(String phone, String email);
}