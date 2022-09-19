package ua.cc.spon.universitybotscrew.command;

import org.springframework.stereotype.Component;
import ua.cc.spon.universitybotscrew.util.ConsoleHelper;

@Component(CommandName.EXIT_PATTERN)
public class ExitCommand implements Command {

    @Override
    public void execute(String argument) {
        ConsoleHelper.writeMessage("GoodBye");
    }

}
