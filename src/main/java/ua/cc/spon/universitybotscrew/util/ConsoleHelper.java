package ua.cc.spon.universitybotscrew.util;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ConsoleHelper {

    private ConsoleHelper() {
    }

    public static void writeMessage(String message) {
        System.out.println(message);
    }

    public static String readString() {
        Scanner scanner = new Scanner(System.in);
        String result;
        result = scanner.nextLine();
        return result;
    }

    public static String parseArgument(String commandQuery, String pattern) {
        String argument = "";
        Pattern p = Pattern.compile(pattern);
        Matcher m = p.matcher(commandQuery);
        if (m.find() && m.groupCount() > 0) {
            argument = m.group(1);
        }
        return argument;
    }
}
