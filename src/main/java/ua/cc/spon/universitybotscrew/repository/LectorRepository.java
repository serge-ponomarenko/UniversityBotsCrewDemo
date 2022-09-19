package ua.cc.spon.universitybotscrew.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.cc.spon.universitybotscrew.repository.entity.Lector;

import java.util.List;

@Repository
public interface LectorRepository extends JpaRepository<Lector, Integer> {

    List<Lector> findLectorsByDepartmentsName(String departmentName);

}
