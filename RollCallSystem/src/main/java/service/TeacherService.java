package service;

import entity.Student;
import entity.Teacher;

public interface TeacherService {
    Teacher teacherIsExist(String tid,String pwd);

    boolean teacherUpdate(Teacher teacher);

    boolean addTeacher(Teacher teacher);

    boolean addStudent(Student student);

    boolean deleteStudent(Student student);

    Teacher findByid(Integer id);
}
