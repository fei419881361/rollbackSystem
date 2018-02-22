package web;

import entity.Classtable;
import entity.Student;
import entity.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import service.ClassTableService;
import service.TeacherService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

@Controller
public class TeacherController {

    private final TeacherService teacherService;
    private final ClassTableService classTableService;

    @Autowired
    public TeacherController(TeacherService teacherService,ClassTableService classTableService) {
        this.teacherService = teacherService;
        this.classTableService = classTableService;

    }

    @RequestMapping("/teacher/updateInfo")
    public String updateInfo(Teacher teacher){
        boolean flag = teacherService.teacherUpdate(teacher);
        System.out.println(flag);
        System.out.println(teacher.toString());
        return null;
    }

    @RequestMapping("/teacher/addTeacher")
    public String addTeacher(Teacher teacher){
        System.out.println(teacher);
        boolean flag = teacherService.addTeacher(teacher);
        System.out.println(flag);
        return null;
    }
    @RequestMapping("/teacher/addStudent")
    public String addStudent(Student student){
        System.out.println(student);
        boolean flag = teacherService.addStudent(student);
        System.out.println(flag);
        return null;
    }

    @RequestMapping("/teacher/deleteStudent")
    public String deleteStudent(Student student){
        System.out.println(student);
        boolean flag = teacherService.deleteStudent(student);
        System.out.println(flag);
        return null;
    }

    @RequestMapping(value = "/teacher/upClassTable",method = RequestMethod.POST)
    @ResponseBody
    public String upClassTable(MultipartFile file,HttpServletRequest request,String sclass,String sgrade) throws IOException {
        System.out.println("comming!");
//        String path = request.getSession().getServletContext().getRealPath("/images");
        String path = "C:\\Users\\41988\\Desktop\\课堂点名系统\\RollCallSystem\\web\\png\\classtable";
        System.out.println("path>>"+path);

        String fileName = file.getOriginalFilename();
        System.out.println("fileName>>"+fileName);

        File dir = new File(path, fileName);
        System.out.println("dir.exists()>>"+dir.exists());
        if(!dir.exists()){
            System.out.println("chuang jian wenjian jia");
            dir.mkdirs();
        }
        System.out.println("dir.exists()>>"+dir.exists());
//      MultipartFile自带的解析方法
        file.transferTo(dir);
        Classtable classtable = new Classtable();
        classtable.setSclass(Integer.valueOf(sclass));
        classtable.setSgrade(Integer.valueOf(sgrade));
        classtable.setUrl(path);
        return classTableService.insert(classtable)?"ok":"fail";

    }


}
