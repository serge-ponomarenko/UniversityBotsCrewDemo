package ua.cc.spon.universitybotscrew.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ua.cc.spon.universitybotscrew.repository.LectorRepository;
import ua.cc.spon.universitybotscrew.repository.entity.Lector;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LectorServiceImpl implements LectorService {

    private final LectorRepository lectorRepository;

    @Override
    public List<Lector> findLectorsByDepartmentsName(String departmentName) {
        return lectorRepository.findLectorsByDepartmentsName(departmentName);
    }

    @Override
    public List<Lector> findAll() {
        return lectorRepository.findAll();
    }
}
