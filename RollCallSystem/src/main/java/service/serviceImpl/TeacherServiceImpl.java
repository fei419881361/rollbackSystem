package service.serviceImpl;

import dao.StudentMapper;
import dao.TeacherMapper;
import entity.Student;
import entity.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.TeacherService;

@Service
@Transactional
public class TeacherServiceImpl implements TeacherService {

    private final TeacherMapper teacherMapper;
    private final StudentMapper studentMapper;

    @Autowired
    public TeacherServiceImpl(TeacherMapper teacherMapper,StudentMapper studentMapper) {
        this.teacherMapper = teacherMapper;
        this.studentMapper = studentMapper;
    }

    @Override
    public Teacher teacherIsExist(String tid, String pwd) {
        Teacher teacher = teacherMapper.selectByTidAndPwd(tid,pwd);
        return teacher;
    }

    @Override
    public boolean teacherUpdate(Teacher teacher) {

        return teacherMapper.updateByPrimaryKey(teacher) > 0;
    }

    @Override
    public boolean addTeacher(Teacher teacher) {
        return teacherMapper.insert(teacher) > 0;
    }

    @Override
    public boolean addStudent(Student student) {
        return studentMapper.insert(student)>0;
    }

    @Override
    public boolean deleteStudent(Student student) {
        return studentMapper.deleteByPrimaryKey(student.getId())>0;
    }

}
