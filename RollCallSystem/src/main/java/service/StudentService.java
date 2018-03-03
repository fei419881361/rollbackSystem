package service;

import entity.Student;

import java.util.List;

public interface StudentService {
    boolean register(Student student);

    List<Student> getClassStudent(Integer sclass,Integer sgrade);
    List<Student> findAllBySplit(Integer sclass,Integer sgrade , Integer currentPage , Integer lineSize);

    Integer findStudentBySid(String sid);
    Integer getAllCount(Integer sclass,Integer sgrade);

    boolean removeBySid(Integer id);


    Student studentIsExist(String aUsername, String aPassword);

    boolean resetPwd(String sid, String password, String newPassword);
}
