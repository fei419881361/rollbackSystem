package web;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import entity.RollCall;
import entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.RollCallService;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class RollCallController {

    private final RollCallService rollCallService;

    @Autowired
    public RollCallController(RollCallService rollCallService){
        this.rollCallService = rollCallService;
    }

    @RequestMapping(value = "/rollcall/endrollcall",produces="text/html;charset=UTF-8;")
    @ResponseBody
    public String endRollCall(String rc){
        System.out.println("rc--->"+rc);
        Gson gson = new Gson();
        List<RollCall> rollCalls = new ArrayList<>();
       rollCalls =  gson.fromJson(rc,new TypeToken<List<RollCall>>(){}.getType());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String time = simpleDateFormat.format(new Date().getTime());
        boolean b = false;
        Map<String ,Object> map = new HashMap<>();
        for (int i =0;i<rollCalls.size();i++) {
            rollCalls.get(i).setRctime(time);
            b = rollCallService.addRollCall(rollCalls.get(i));
            if(!b){
                map.put("message","发生错误");
                return gson.toJson(map);
            }
        }
        map.put("message","成功！！");
        return gson.toJson(map);
    }

    @RequestMapping("/rollcall/findAllBySplit")
    @ResponseBody
    public String findAllBySplit(Integer page,Integer rows){
        List<RollCall> rollCalls = rollCallService.findAllBySplit(page,rows);
        System.out.println(rollCalls.size());
        Integer num = rollCallService.getAllCount();
        Map<String , Object> map = new HashMap<>();
        map.put("total",num);
        map.put("rows",rollCalls);
        Gson gson = new Gson();
        String gs = gson.toJson(map);
        System.out.println("--->"+gs);
        return gs;
    }
    @RequestMapping("/rollcall/findAllBySplitByStu")
    @ResponseBody
    public String findAllBySplitByStu(Integer page, Integer rows, HttpServletRequest request){
        String sid = (String) request.getSession().getAttribute("sid");
        List<RollCall> rollCalls = rollCallService.findAllBySplitBySid(sid,page,rows);
        System.out.println(rollCalls.size());
        Integer num = rollCallService.getAllCountByStu(sid);
        Map<String , Object> map = new HashMap<>();
        map.put("total",num);
        map.put("rows",rollCalls);
        Gson gson = new Gson();
        String gs = gson.toJson(map);
        System.out.println("--->"+gs);
        return gs;
    }


    @RequestMapping(value = "/rollcall/remove",produces="text/html;charset=UTF-8;")
    @ResponseBody
    public String remove(Integer id){
        boolean b = rollCallService.removeById(id);
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

    @RequestMapping(value = "/rollcall/update",produces="text/html;charset=UTF-8;")
    @ResponseBody
    public String update(RollCall rc){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String time = simpleDateFormat.format(new Date().getTime());
        rc.setRctime(time);
        boolean b = rollCallService.update(rc);
        String message = "";
        Gson gson = new Gson();
        Map<String,Object> map = new HashMap<>();
        if(b){
            message = "修改成功";

        }else message = "修改失败";
        map.put("message",message);
        String gs = gson.toJson(map);
        return gs;
    }



}
