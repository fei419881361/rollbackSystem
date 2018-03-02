package service;

import entity.RollCall;

import java.util.List;

public interface RollCallService {

    boolean addRollCall(RollCall rollCall);

    List<RollCall> findAllBySplit(Integer currentPage , Integer lineSize);

    Integer getAllCount();

    boolean removeById(Integer id);

    RollCall getRollCall(Integer sid, Integer sgrade);

    List<RollCall> findAllBySplitBySid(String sid, Integer page, Integer rows);
    Integer getAllCountByStu(String sid);
}
