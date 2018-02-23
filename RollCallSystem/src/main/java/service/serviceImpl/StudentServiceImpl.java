package service.serviceImpl;

import dao.StudentMapper;
import entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.StudentService;

import java.util.List;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {

    private final StudentMapper studentMapper;

    @Autowired
    public StudentServiceImpl(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }
    @Override
    public boolean register(Student student) {
        return studentMapper.insert(student) >0;
    }

    @Override
    public List<Student> getClassStudent(Integer sclass, Integer sgrade) {
        return null;
    }

    @Override
    public List<Student> findAllBySplit(Integer sclass, Integer sgrade, Integer currentPage, Integer lineSize) {
        currentPage = (currentPage-1)*lineSize;
        if (currentPage <= 0) {
            currentPage = 0;
        }
        return studentMapper.findAllBySplit(sclass,sgrade,currentPage,lineSize);
    }

    @Override
    public Integer getAllCount(Integer sclass, Integer sgrade) {
        return studentMapper.getAllCount(sclass,sgrade);
    }
}
