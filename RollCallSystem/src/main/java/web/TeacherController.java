package web;

import com.google.gson.Gson;
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
import service.StudentService;
import service.TeacherService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller
public class TeacherController {

    private final TeacherService teacherService;
    private final ClassTableService classTableService;
    private final StudentService studentService;

    @Autowired
    public TeacherController(TeacherService teacherService,ClassTableService classTableService,StudentService studentService) {
        this.teacherService = teacherService;
        this.classTableService = classTableService;
        this.studentService = studentService;

    }

    @RequestMapping("/teacher/updateInfo")
    @ResponseBody
    public String updateInfo(Teacher teacher){
        boolean flag = teacherService.teacherUpdate(teacher);
        System.out.println(flag);
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<>();
        map.put("message",flag);

        return gson.toJson(map);
    }

    @RequestMapping(value = "/teacher/info",produces="text/html;charset=UTF-8;")
    public String info(HttpServletRequest request){
        Integer id = (Integer) request.getSession().getAttribute("id");
        Teacher teacher = teacherService.findByid(id);
        System.out.println(teacher.toString());
        request.setAttribute("teacher",teacher);
        return "info";
    }

    @RequestMapping(value = "/teacher/addTeacher",produces="text/html;charset=UTF-8;")
    @ResponseBody
    public String addTeacher(Teacher teacher){
        System.out.println(teacher);
        Map<String,Object> map = new HashMap<>();
        boolean flag = teacherService.addTeacher(teacher);
        System.out.println(flag);
       if(flag){
           map.put("message","添加教师成功");
       }else map.put("message","教师职工id重复");
        Gson gson = new Gson();
        return gson.toJson(map);
    }
    @RequestMapping(value = "/teacher/addStudent",produces="text/html;charset=UTF-8;")
    @ResponseBody
    public String addStudent(Student student){
        System.out.println(student.getSname());
        System.out.println(student.getSid());


        Integer num = studentService.findStudentBySid(student.getSid());
        System.out.println("num"+num);

        Map<String , Object> map = new HashMap<>();
        if (num == 0) {
            boolean flag = teacherService.addStudent(student);
            if (flag) {
                map.put("success", true);
                map.put("message", "添加学生成功！");
            }
        }else {
            map.put("success", false);

            map.put("message","添加失败，该学号已经没注册了");
        }
        Gson gson = new Gson();
        System.out.println(gson.toJson(map));
        return gson.toJson(map);
    }

    @RequestMapping("/teacher/deleteStudent")
    public String deleteStudent(Student student){
        System.out.println(student);
        boolean flag = teacherService.deleteStudent(student);
        System.out.println(flag);
        return null;
    }

    @RequestMapping(value = "/teacher/upClassTable",method = RequestMethod.POST,produces="text/html;charset=UTF-8;")
    @ResponseBody
    public String upClassTable(MultipartFile file,HttpServletRequest request,String sclass,String sgrade) throws IOException {
//        String path = request.getSession().getServletContext().getRealPath("/images");
        String path = "C:\\Users\\41988\\Desktop\\课堂点名系统\\RollCallSystem\\web\\png\\classtable";

        String fileName = file.getOriginalFilename();
        System.out.println("fileName>>"+fileName);

        File dir = new File(path, fileName);
        System.out.println("dir.exists()>>"+dir.exists());
        if(!dir.exists()){
            System.out.println("chuang jian wenjian jia");
            dir.mkdirs();
        }
        file.transferTo(dir);
        Classtable classtable = new Classtable();
        classtable.setSclass(Integer.valueOf(sclass));
        classtable.setSgrade(Integer.valueOf(sgrade));
        classtable.setUrl(fileName);
        boolean b = classTableService.insert(classtable);
        System.out.println("--->"+b);
        Map<String,Object> map = new HashMap<>();
        if (b)
            map.put("message","上传成功");
        else map.put("message","上传失败");
        return new Gson().toJson(map);
    }


}
