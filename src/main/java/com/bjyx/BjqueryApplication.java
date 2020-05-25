package com.bjyx;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.File;

@SpringBootApplication
public class BjqueryApplication {

    public static void main(String[] args) {
        File file = new File(System.getProperty("user.dir") + File.separatorChar + "logs");
        System.out.println(System.getProperty("user.dir") + File.separatorChar);
        if(!file.exists()) {
            new File(System.getProperty("user.dir") + File.separatorChar + "logs").mkdir();
        }
        SpringApplication.run(BjqueryApplication.class, args);
    }

}
