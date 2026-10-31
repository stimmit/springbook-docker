
package com.example.microservice;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() {
       return "Hello, This is My Project - Version 1.0.2!";
    }
}  
