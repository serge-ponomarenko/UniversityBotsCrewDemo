package ua.cc.spon.universitybotscrew.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import ua.cc.spon.universitybotscrew.repository.entity.Department;

import java.util.List;

@Repository
public interface DepartmentRepository extends JpaRepository<Department, Integer> {

    Department getByName(String name);

    @Query("SELECT d.name FROM Department d " +
            "WHERE d.name LIKE %?1%")
    List<String> findByPattern(String pattern);

}
