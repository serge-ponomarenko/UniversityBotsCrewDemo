package ua.cc.spon.universitybotscrew.service;

import org.springframework.context.ApplicationContext;
import ua.cc.spon.universitybotscrew.command.Command;
import ua.cc.spon.universitybotscrew.command.CommandContainer;
import ua.cc.spon.universitybotscrew.util.ConsoleHelper;

public class MainService {

    private MainService() {
    }

    public static void start(ApplicationContext context) {
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
