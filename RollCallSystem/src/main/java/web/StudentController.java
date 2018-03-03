package web;

import com.google.gson.Gson;
import entity.Student;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.StudentService;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/student/register",produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String register(Student student){
        Integer i = studentService.findStudentBySid(student.getSid());
        Map<String,Object> map = new HashMap<>();
        if(i == 0){
            boolean b = studentService.register(student);
            System.out.println("register::"+b);
            map.put("message","注册成功！！");
        }else {
            map.put("message","注册失败，该学号已被注册");
        }
        Gson gson = new Gson();
        String gs = gson.toJson(map);
        System.out.println(gs);
        return gs;
    }

    @RequestMapping("/student/findAllBySplit")
    @ResponseBody
    public String findAllBySplit(Integer sclass ,Integer sgrade,Integer page,Integer rows){
        List<Student> students = studentService.findAllBySplit(sclass,sgrade,page,rows);
        System.out.println(students.size());
        Integer num = studentService.getAllCount(sclass,sgrade);
        Map<String , Object> map = new HashMap<>();
        map.put("total",num);
        map.put("rows",students);
        Gson gson = new Gson();
        String gs = gson.toJson(map);
        return gs;
    }

    @RequestMapping(value = "/student/remove",produces="text/html;charset=UTF-8;")
    @ResponseBody
    public String remove(Integer id){
        boolean b = studentService.removeBySid(id);
        String message = "";
        Gson gson = new Gson();
        Map<String,Object> map = new HashMap<>();
        if(b){
            message = "删除成功";

        }else message = "删除失败";
        map.put("message",message);
        String gs = gson.toJson(map);
        return gs;
    }

    @RequestMapping(value = "/student/getclassstudent",produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String getClassStudent(Integer sclass,Integer sgrade){
        List<Student> students = studentService.getClassStudent(sclass,sgrade);
        Map<String, Object> map = new HashMap<>();
        map.put("total",students.size());
        map.put("students",students);
        Gson gson = new Gson();
        String gs = gson.toJson(map);
        System.out.println(gs);
        return gs;
    }

    @RequestMapping(value = "/student/submitResetPwd",produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String resetPwd(String password, String newPassword, HttpServletRequest request){
        String sid = (String) request.getSession().getAttribute("sid");
        Map<String,Object> map = new HashMap<>();
        Gson gson = new Gson();
        if(password.equals(newPassword)){
            map.put("message","输入的新密码和原密码相同");
            return gson.toJson(map);
        }else {
            boolean b = studentService.resetPwd(sid,password,newPassword);
            if (b){
                map.put("message","修改成功");
                return gson.toJson(map);
            }
            map.put("message","原来的密码输入错误");
            return gson.toJson(map);
        }

    }



}


