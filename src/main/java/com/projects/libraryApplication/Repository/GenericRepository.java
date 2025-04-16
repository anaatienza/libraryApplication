package com.projects.libraryApplication.Repository;

import java.util.List;

public interface GenericRepository <T,ID> {

    void save (T entity);
    void updateAll (T entity);
    void delete (ID id);
    void getById (ID id);
    List <T> listAll();

}
