package dao;

import entity.RollCall;
import entity.RollCallExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RollCallMapper {
    long countByExample(RollCallExample example);

    int deleteByExample(RollCallExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(RollCall record);

    int insertSelective(RollCall record);

    List<RollCall> selectByExample(RollCallExample example);

    RollCall selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") RollCall record, @Param("example") RollCallExample example);

    int updateByExample(@Param("record") RollCall record, @Param("example") RollCallExample example);

    int updateByPrimaryKeySelective(RollCall record);

    int updateByPrimaryKey(RollCall record);
}