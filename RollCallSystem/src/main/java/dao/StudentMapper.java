package dao;

import entity.Student;
import entity.StudentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StudentMapper {
    long countByExample(StudentExample example);

    int deleteByExample(StudentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectByExample(StudentExample example);

    Student selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByExample(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);

    List<Student> findAllBySplit(@Param("sclass") Integer sclass, @Param("sgrade")Integer sgrade, @Param("currentPage") Integer currentPage, @Param("lineSize") Integer lineSize);

    Integer getAllCount(@Param("sclass") Integer sclass, @Param("sgrade")Integer sgrade);

    Integer findBySid(String sid);

    List<Student> getClassStudent(@Param("sclass") Integer sclass, @Param("sgrade")Integer sgrade);

    Student selectByaccountANDpwd(@Param("sid") String aUsername, @Param("pwd") String aPassword);

    Integer resetPwd(@Param("sid") String sid, @Param("pwd") String password, @Param("npwd") String newPassword);
}