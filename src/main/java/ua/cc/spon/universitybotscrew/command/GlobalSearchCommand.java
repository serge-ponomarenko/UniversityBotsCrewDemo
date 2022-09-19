package ua.cc.spon.universitybotscrew.command;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import ua.cc.spon.universitybotscrew.repository.entity.Department;
import ua.cc.spon.universitybotscrew.repository.entity.Lector;
import ua.cc.spon.universitybotscrew.service.DepartmentService;
import ua.cc.spon.universitybotscrew.service.LectorService;
import ua.cc.spon.universitybotscrew.util.ConsoleHelper;

import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Component(CommandName.GLOBAL_SEARCH_PATTERN)
@RequiredArgsConstructor
public class GlobalSearchCommand implements Command {

    private final LectorService lectorService;
    private final DepartmentService departmentService;

    @Override
    public void execute(String argument) {

        Stream<String> departmentNamesStream = departmentService.findAll()
                .stream()
                .map(Department::getName);

        Stream<String> lectorNamesStream = lectorService.findAll()
                .stream()
                .map(Lector::getName);

        String result = Stream.of(departmentNamesStream, lectorNamesStream)
                .flatMap(Function.identity())
                .filter(s -> s.contains(argument))
                .collect(Collectors.joining(", "));

        ConsoleHelper.writeMessage(result);

    }


}
