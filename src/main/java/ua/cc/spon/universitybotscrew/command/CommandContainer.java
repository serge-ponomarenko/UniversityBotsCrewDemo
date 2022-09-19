package ua.cc.spon.universitybotscrew.command;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import ua.cc.spon.universitybotscrew.util.ConsoleHelper;

import java.util.Map;

@Component
@RequiredArgsConstructor
public class CommandContainer {

    private final Map<String, Command> commandMap;
    private final Command helpCommand = new HelpCommand();

    public Command retrieveCommand(String commandQuery) {
        return commandMap.getOrDefault(getPattern(commandQuery), helpCommand);
    }

    public String retrieveArgument(String commandQuery) {
        return ConsoleHelper.parseArgument(commandQuery, getPattern(commandQuery));
    }

    private String getPattern(String commandQuery) {
        return commandMap.keySet()
                .stream()
                .filter(commandQuery::matches)
                .findFirst()
                .orElse(commandQuery);
    }

}
