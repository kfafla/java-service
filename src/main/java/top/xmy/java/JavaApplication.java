package top.xmy.java;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@SpringBootApplication
public class JavaApplication {

    public static void main(String[] args) {
        SpringApplication.run(JavaApplication.class, args);
    }
    @GetMapping("/list")
    public List<String> getList() {
        return List.of("java" ,"JavaScript","Python");
    }
}
