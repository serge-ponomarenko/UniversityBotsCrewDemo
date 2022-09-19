package ua.cc.spon.universitybotscrew;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import ua.cc.spon.universitybotscrew.command.Command;
import ua.cc.spon.universitybotscrew.command.CommandContainer;
import ua.cc.spon.universitybotscrew.util.ConsoleHelper;

@SpringBootApplication
public class UniversityBotsCrewApplication {

    public static void main(String[] args) {
        ConfigurableApplicationContext context = SpringApplication.run(UniversityBotsCrewApplication.class, args);

        CommandContainer commandContainer = context.getBean(CommandContainer.class);

        commandContainer.retrieveCommand("HELP").execute("");

        String commandQuery;

        while (!(commandQuery = ConsoleHelper.readString()).equalsIgnoreCase("EXIT")) {
            Command command = commandContainer.retrieveCommand(commandQuery);
            String argument = commandContainer.retrieveArgument(commandQuery);

            command.execute(argument);
        }
    }

}
