package ua.cc.spon.universitybotscrew.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.cc.spon.universitybotscrew.repository.entity.Department;

@Repository
public interface DepartmentRepository extends JpaRepository<Department, Integer> {

    Department getByName(String name);

}
