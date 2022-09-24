package ua.cc.spon.universitybotscrew;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import ua.cc.spon.universitybotscrew.service.MainService;

@SpringBootApplication
public class UniversityBotsCrewApplication {

    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(UniversityBotsCrewApplication.class, args);

        MainService.start(context);

    }

}
