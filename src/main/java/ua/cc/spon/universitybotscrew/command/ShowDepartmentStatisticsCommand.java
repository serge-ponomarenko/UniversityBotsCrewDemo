package ua.cc.spon.universitybotscrew.command;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import ua.cc.spon.universitybotscrew.service.LectorService;
import ua.cc.spon.universitybotscrew.util.ConsoleHelper;

import java.util.Map;
import java.util.stream.Collectors;

@Component(CommandName.SHOW_DEPARTMENT_STATISTICS_PATTERN)
@RequiredArgsConstructor
public class ShowDepartmentStatisticsCommand implements Command {

    private final LectorService lectorService;

    @Override
    public void execute(String argument) {
        Map<String, Long> collect = lectorService.findLectorsByDepartmentsName(argument)
                .stream()
                .collect(Collectors.groupingBy(lector -> lector.getDegree().getPluralName(), Collectors.counting()));

        StringBuilder result = new StringBuilder();

        for (Map.Entry<String, Long> entry : collect.entrySet()) {
            result.append(entry.getKey()).append(" - ").append(entry.getValue()).append("\n");
        }

        ConsoleHelper.writeMessage(result.toString());
    }
}
