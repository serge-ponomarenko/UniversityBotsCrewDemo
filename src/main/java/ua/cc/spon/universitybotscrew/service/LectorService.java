package ua.cc.spon.universitybotscrew.service;

import ua.cc.spon.universitybotscrew.repository.entity.Lector;

import java.util.List;

public interface LectorService {
    List<Lector> findLectorsByDepartmentsName(String departmentName);

    List<String> findByPattern(String pattern);

    Double findAverageSalaryByDepartment(String departmentName);

    int findLectorsCountByDepartment(String departmentName);

}
