package ua.cc.spon.universitybotscrew.command;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import ua.cc.spon.universitybotscrew.service.DepartmentService;
import ua.cc.spon.universitybotscrew.service.LectorService;
import ua.cc.spon.universitybotscrew.util.ConsoleHelper;

import java.util.List;

@Component(CommandName.GLOBAL_SEARCH_PATTERN)
@RequiredArgsConstructor
public class GlobalSearchCommand implements Command {

    private final LectorService lectorService;
    private final DepartmentService departmentService;

    @Override
    public void execute(String argument) {

        List<String> strings = lectorService.findByPattern(argument);
        strings.addAll(departmentService.findByPattern(argument));

        String result = String.join(", ", strings);

        ConsoleHelper.writeMessage(result);

    }


}
