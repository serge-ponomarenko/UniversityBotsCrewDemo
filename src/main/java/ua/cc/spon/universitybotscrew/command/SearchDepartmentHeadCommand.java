package ua.cc.spon.universitybotscrew.command;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import ua.cc.spon.universitybotscrew.repository.entity.Department;
import ua.cc.spon.universitybotscrew.service.DepartmentService;
import ua.cc.spon.universitybotscrew.util.ConsoleHelper;

@Component(CommandName.SEARCH_DEPARTMENT_HEAD_PATTERN)
@RequiredArgsConstructor
public class SearchDepartmentHeadCommand implements Command {

    public static final String ANSWER = "Head of %s department is %s";

    private final DepartmentService departmentService;

    @Override
    public void execute(String argument) {

        Department department = departmentService.getByName(argument);

        if (department != null) {
            ConsoleHelper.writeMessage(String.format(ANSWER, argument, department.getHead().getName()));
        }

    }

}
