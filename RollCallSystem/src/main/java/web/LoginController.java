package web;

import entity.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.TeacherService;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    private final TeacherService teacherService;

    @Autowired
    public LoginController(TeacherService teacherService){
        this.teacherService = teacherService;
    }
    @RequestMapping("/login")
    public String login(String tid, String pwd, HttpSession httpSession){
        System.out.println(tid+pwd);
        Teacher teacher = teacherService.teacherIsExist(tid,pwd);
        System.out.println(teacher.toString());
        return null;
    }
}
