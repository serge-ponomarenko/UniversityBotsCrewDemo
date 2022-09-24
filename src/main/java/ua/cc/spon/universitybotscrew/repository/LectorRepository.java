package ua.cc.spon.universitybotscrew.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import ua.cc.spon.universitybotscrew.repository.entity.Lector;

import java.util.List;

@Repository
public interface LectorRepository extends JpaRepository<Lector, Integer> {

    List<Lector> findLectorsByDepartmentsName(String departmentName);

    @Query("SELECT AVG(l.salary) FROM Lector l " +
            "JOIN l.departments d " +
            "WHERE d.name = ?1")
    Double findAverageSalaryByDepartment(String departmentName);

    @Query("SELECT COUNT(l.id) FROM Lector l " +
            "JOIN l.departments d " +
            "WHERE d.name = ?1")
    int findLectorsCountByDepartment(String departmentName);

    @Query("SELECT l.name FROM Lector l " +
            "WHERE l.name LIKE %?1%")
    List<String> findByPattern(String pattern);

}
