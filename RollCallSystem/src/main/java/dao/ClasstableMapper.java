package dao;

import entity.Classtable;
import entity.ClasstableExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ClasstableMapper {
    long countByExample(ClasstableExample example);

    int deleteByExample(ClasstableExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Classtable record);

    int insertSelective(Classtable record);

    List<Classtable> selectByExample(ClasstableExample example);

    Classtable selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Classtable record, @Param("example") ClasstableExample example);

    int updateByExample(@Param("record") Classtable record, @Param("example") ClasstableExample example);

    int updateByPrimaryKeySelective(Classtable record);

    int updateByPrimaryKey(Classtable record);

    Classtable selectBySidAndSgrade(@Param("sclass") Integer sclass, @Param("sgrade") Integer sgrade);
}