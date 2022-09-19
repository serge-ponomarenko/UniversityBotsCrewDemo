package ua.cc.spon.universitybotscrew.command;

import ua.cc.spon.universitybotscrew.util.ConsoleHelper;

public class HelpCommand implements Command {

    @Override
    public void execute(String argument) {

        ConsoleHelper.writeMessage("Available commands:");

        for (CommandName cn : CommandName.values()) {
            ConsoleHelper.writeMessage(" - " + cn.getCommandHint());
        }

        ConsoleHelper.writeMessage("Please type your query:");
    }

}
