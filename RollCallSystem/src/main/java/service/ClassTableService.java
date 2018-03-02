package service;

import entity.Classtable;

public interface ClassTableService {
    boolean insert(Classtable classtable);

    Classtable getClassTable(Integer sclass, Integer sgrade);
}
