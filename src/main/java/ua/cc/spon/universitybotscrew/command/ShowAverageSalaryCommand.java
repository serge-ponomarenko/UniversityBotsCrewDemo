package ua.cc.spon.universitybotscrew.command;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import ua.cc.spon.universitybotscrew.service.LectorService;
import ua.cc.spon.universitybotscrew.util.ConsoleHelper;

@Component(CommandName.SHOW_AVERAGE_SALARY_PATTERN)
@RequiredArgsConstructor
public class ShowAverageSalaryCommand implements Command {

    public static final String ANSWER = "The average salary of %s is %.2f";

    private final LectorService lectorService;

    @Override
    public void execute(String argument) {

        double average = lectorService.findLectorsByDepartmentsName(argument)
                .stream()
                .mapToDouble(value -> value.getSalary().doubleValue())
                .average()
                .orElse(0);

        if (average > 0) {
            ConsoleHelper.writeMessage(String.format(ANSWER, argument, average));
        }

    }

}
