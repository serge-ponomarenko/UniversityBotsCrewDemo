package ua.cc.spon.universitybotscrew.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ua.cc.spon.universitybotscrew.repository.DepartmentRepository;
import ua.cc.spon.universitybotscrew.repository.entity.Department;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DepartmentServiceImpl implements DepartmentService {

    private final DepartmentRepository departmentRepository;

    @Override
    public Department getByName(String name) {
        return departmentRepository.getByName(name);
    }

    @Override
    public List<String> findByPattern(String pattern) {
        return departmentRepository.findByPattern(pattern);
    }
}
