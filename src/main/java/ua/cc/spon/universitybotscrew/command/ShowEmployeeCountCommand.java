package ua.cc.spon.universitybotscrew.command;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import ua.cc.spon.universitybotscrew.service.LectorService;
import ua.cc.spon.universitybotscrew.util.ConsoleHelper;

@Component(CommandName.SHOW_EMPLOYEE_COUNT_PATTERN)
@RequiredArgsConstructor
public class ShowEmployeeCountCommand implements Command {

    private final LectorService lectorService;

    @Override
    public void execute(String argument) {

        int count = lectorService.findLectorsByDepartmentsName(argument).size();

        ConsoleHelper.writeMessage(String.valueOf(count));
    }
}
