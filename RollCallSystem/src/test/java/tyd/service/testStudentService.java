package tyd.service;

import com.google.gson.Gson;
import entity.Student;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import service.StudentService;
import service.TeacherService;
import tyd.BaseTest;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class testStudentService extends BaseTest {
    @Autowired
    StudentService studentService;

    @Autowired
    TeacherService teacherService;


    public testStudentService(){

    }

    @Test
    public void test4(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(simpleDateFormat.format(new Date().getTime()));

    }
    @Test
    public void test(){
        Student student = new Student();
        student.setAccount("123");
        student.setPwd("123");
        student.setSclass(1);
        student.setSgrade(1);
        student.setSid("500");
        student.setSex(1);
        student.setSname("num");
        String num = "500";
        for (int i = 0; i < 20; i++) {
            studentService.register(student);
            Integer buf = Integer.parseInt(num) + 1;
            num = String.valueOf(buf);
            student.setSid(num);
            student.setSname(num);
        }
    }

    @Test
    public void test2(){
        List<Student> students = studentService.findAllBySplit(1,1,0,5);
        System.out.println(students.size());
        Gson gson = new Gson();
        String gs = gson.toJson(students);
        System.out.println(gs);
    }

    @Test
    public void test3(){
        List<Student> students = studentService.findAllBySplit(1,1,1,10);
        System.out.println(students.size());
        Integer num = studentService.getAllCount(1,1);
        Map<String , Object> map = new HashMap<>();
        map.put("total",num);
        map.put("rows",students);
        Gson gson = new Gson();
        String gs = gson.toJson(map);

        System.out.println(gs);
    }
}
