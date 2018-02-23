package web;

import com.google.gson.Gson;
import entity.Student;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.StudentService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StudentController {

    private final StudentService studentService;


    @Autowired
    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @RequestMapping("/student/register")
    public String register(Student student){
        boolean b = studentService.register(student);
        System.out.println(b);
        return null;
    }

    @RequestMapping("/student/findAllBySplit")
    public String findAllBySplit(Integer sclass ,Integer sgrade,Integer currentPage,Integer lineSize){
        System.out.println("------>>>");
        List<Student> students = studentService.findAllBySplit(sclass,sgrade,currentPage,lineSize);
        System.out.println(students.size());
        Integer num = studentService.getAllCount(sclass,sgrade);
        Map<String , Object> map = new HashMap<>();
        map.put("total",num);
        map.put("rows",students);
        Gson gson = new Gson();
        String gs = gson.toJson(map);
        return gs;
    }





}


