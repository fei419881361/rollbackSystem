package web;

import entity.Student;
import entity.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.StudentService;
import service.TeacherService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    private final TeacherService teacherService;
    private final StudentService studentService;

    @Autowired
    public LoginController(TeacherService teacherService, StudentService studentService){
        this.teacherService = teacherService;
        this.studentService = studentService;
    }

    @RequestMapping("/login")
    public String login(String aUsername, String aPassword,String type, HttpServletRequest httpServletRequest){
        System.out.println(aUsername+aPassword);
        Teacher teacher = teacherService.teacherIsExist(aUsername,aPassword);
        System.out.println(type);
        if(teacher!=null&&type.equals("1")){
            String tname = teacher.getTname();
            httpServletRequest.setAttribute("tname",tname);
            httpServletRequest.getSession().setAttribute("id",teacher.getId());
            return "index2";
        }else {
            Student student = studentService.studentIsExist(aUsername,aPassword);
            if(student != null){
                httpServletRequest.setAttribute("student",student);
                httpServletRequest.getSession().setAttribute("sid",student.getSid());
                return "index3";
            }
        }
        return "error";
    }
}
