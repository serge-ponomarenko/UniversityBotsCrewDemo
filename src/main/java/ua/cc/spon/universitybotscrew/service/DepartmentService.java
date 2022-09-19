package ua.cc.spon.universitybotscrew.service;

import ua.cc.spon.universitybotscrew.repository.entity.Department;

import java.util.List;

public interface DepartmentService {
    Department getByName(String name);
    List<Department> findAll();
}
