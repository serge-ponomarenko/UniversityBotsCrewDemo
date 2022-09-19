package ua.cc.spon.universitybotscrew.command;

public enum CommandName {

    SEARCH_DEPARTMENT_HEAD(     CommandName.SEARCH_DEPARTMENT_HEAD_PATTERN,       CommandName.SEARCH_DEPARTMENT_HEAD_H),
    SHOW_DEPARTMENT_STATISTICS( CommandName.SHOW_DEPARTMENT_STATISTICS_PATTERN,   CommandName.SHOW_DEPARTMENT_STATISTICS_HINT),
    SHOW_AVERAGE_SALARY(        CommandName.SHOW_AVERAGE_SALARY_PATTERN,          CommandName.SHOW_AVERAGE_SALARY_HINT),
    SHOW_EMPLOYEE_COUNT(        CommandName.SHOW_EMPLOYEE_COUNT_PATTERN,          CommandName.SHOW_EMPLOYEE_COUNT_HINT),
    GLOBAL_SEARCH(              CommandName.GLOBAL_SEARCH_PATTERN,                CommandName.GLOBAL_SEARCH_HINT),
    EXIT(                       CommandName.EXIT_PATTERN,                         CommandName.EXIT_HINT);

    public static final String SEARCH_DEPARTMENT_HEAD_PATTERN = "Who is head of department (.*)";
    public static final String SEARCH_DEPARTMENT_HEAD_H = "Who is head of department {department_name}";
    public static final String SHOW_DEPARTMENT_STATISTICS_PATTERN = "Show (.*) statistics";
    public static final String SHOW_DEPARTMENT_STATISTICS_HINT = "Show {department_name} statistics";
    public static final String SHOW_AVERAGE_SALARY_PATTERN = "Show the average salary for the department (.*)";
    public static final String SHOW_AVERAGE_SALARY_HINT = "Show the average salary for the department {department_name}";
    public static final String SHOW_EMPLOYEE_COUNT_PATTERN = "Show count of employee for (.*)";
    public static final String SHOW_EMPLOYEE_COUNT_HINT = "Show count of employee for {department_name}";
    public static final String GLOBAL_SEARCH_PATTERN = "Global search by (.*)";
    public static final String GLOBAL_SEARCH_HINT = "Global search by {template}";
    public static final String EXIT_PATTERN = "EXIT";
    public static final String EXIT_HINT = "EXIT";

    private final String commandString;
    private final String commandHint;

    CommandName(String commandString, String commandHint) {
        this.commandString = commandString;
        this.commandHint = commandHint;
    }

    public String getCommandString() {
        return commandString;
    }

    public String getCommandHint() {
        return commandHint;
    }
}
