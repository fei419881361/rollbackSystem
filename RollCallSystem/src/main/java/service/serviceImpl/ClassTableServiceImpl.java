package service.serviceImpl;

import dao.ClasstableMapper;
import entity.Classtable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.ClassTableService;

@Service
@Transactional
public class ClassTableServiceImpl implements ClassTableService {

    private final ClasstableMapper classtableMapper;

    @Autowired
    public ClassTableServiceImpl(ClasstableMapper classtableMapper){
        this.classtableMapper = classtableMapper;

    }
    @Override
    public boolean insert(Classtable classtable) {
        return classtableMapper.insert(classtable) > 0 ;
    }
}
