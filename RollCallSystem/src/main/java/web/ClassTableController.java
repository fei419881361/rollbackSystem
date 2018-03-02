package web;

import com.google.gson.Gson;
import entity.Classtable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.ClassTableService;

import java.util.HashMap;
import java.util.Map;

@Controller
public class ClassTableController {

    private final ClassTableService classTableService;

    @Autowired
    public ClassTableController(ClassTableService classTableServices){
        this.classTableService = classTableServices;
    }

    @RequestMapping(value = "/classtable/lookclasstable",produces="text/html;charset=UTF-8;")
    @ResponseBody
    public String lookclasstable(Integer sclass,Integer sgrade){
        Classtable classtable = classTableService.getClassTable(sclass,sgrade);
        Map<String , Object> map = new HashMap<>();
        if (classtable.getUrl() != null) {
            map.put("url",classtable.getUrl());
            map.put("message","查询成功");
        }else {
            map.put("url","");
            map.put("message","查询失败，没有课表");
        }
        Gson gson = new Gson();
        String gs =  gson.toJson(map);
        System.out.println(gs);
        return gs;
    }
}
