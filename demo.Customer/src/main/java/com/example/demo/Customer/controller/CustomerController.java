package com.example.demo.Customer.controller;

import com.example.demo.Customer.customer_crud.dto.LoginRequest;
import com.example.demo.Customer.model.Customer;
import com.example.demo.Customer.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@RestController
public class CustomerController {

    @Autowired
    CustomerRepository customerRepository;

    @PostMapping("/create")
    public String createCustomer(@RequestBody Customer customer) {
        customerRepository.save(customer);
        return "Customer added";
    }

    @PutMapping("/update/{phone}")
    public String updateCustomerByPhoneNumber(@PathVariable String phone, @RequestBody Customer customer) {
        if (customerRepository.existsById(phone)) {
            customer.setPhone(phone);
            customerRepository.save(customer);
            return "Customer updated successfully";
        } else {
            return "Customer not found";
        }
    }

    @GetMapping("/get")
    public Iterable<Customer> getAllCustomer() {
        return customerRepository.findAll();
    }

    @GetMapping("/get/{phone}")
    public Customer getCustomerByPhoneNumber(@PathVariable String phone) {
        return customerRepository.findById(phone).orElse(null);
    }

    @DeleteMapping("/delete/{phone}")
    public String deleteCustomerByPhoneNumber(@PathVariable String phone) {
        customerRepository.deleteById(phone);
        return "Customer deleted successfully";
    }

    @PostMapping("/login")
    public ModelAndView loginCustomer(@RequestBody LoginRequest loginRequest) {
        Optional<Customer> customer = customerRepository.findByPhoneAndEmail(loginRequest.getPhone(), loginRequest.getEmail());
        if (customer.isPresent()) {
            return new ModelAndView("redirect:/customer");
        } else {
            ModelAndView modelAndView = new ModelAndView("login");
            modelAndView.addObject("message", "Invalid phone number or email");
            return modelAndView;
        }
    }

    }