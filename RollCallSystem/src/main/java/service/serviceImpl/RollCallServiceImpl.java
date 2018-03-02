package service.serviceImpl;

import dao.RollCallMapper;
import entity.RollCall;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.RollCallService;

import java.util.List;

@Service
@Transactional
public class RollCallServiceImpl  implements RollCallService{

    private final RollCallMapper rollCallMapper;

    @Autowired
    public RollCallServiceImpl(RollCallMapper rollCallMapper){
        this.rollCallMapper = rollCallMapper;
    }
    @Override
    public boolean addRollCall(RollCall rollCall) {
        return rollCallMapper.insert(rollCall)>0;
    }

    @Override
    public List<RollCall> findAllBySplit(Integer currentPage, Integer lineSize) {
        currentPage = (currentPage-1)*lineSize;
        if (currentPage <= 0) {
            currentPage = 0;
        }
        return rollCallMapper.findAllBySplit(currentPage,lineSize);
    }

    @Override
    public Integer getAllCount() {
        return rollCallMapper.getAllCount();
    }

    @Override
    public boolean removeById(Integer id) {
        return rollCallMapper.deleteByPrimaryKey(id)>0;
    }

    @Override
    public RollCall getRollCall(Integer sid, Integer sgrade) {
        return rollCallMapper.selectBySidAndSgrade(sid,sgrade);
    }

    @Override
    public List<RollCall> findAllBySplitBySid(String sid, Integer currentPage, Integer lineSize) {
        currentPage = (currentPage-1)*lineSize;
        if (currentPage <= 0) {
            currentPage = 0;
        }
        return rollCallMapper.findAllBySplitBySid(sid,currentPage,lineSize);
    }

    @Override
    public Integer getAllCountByStu(String sid) {
        return rollCallMapper.getAllCountByStu(sid);
    }
}
