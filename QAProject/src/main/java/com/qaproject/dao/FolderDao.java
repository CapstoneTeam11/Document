package com.qaproject.dao;

import com.qaproject.entity.Folder;
import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface FolderDao {
    public Folder find(Integer id);
    List<Folder> findAll();
    List<Folder> findByUser(User user);
    public boolean checkFolderExists(String name,User user);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(Folder entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(Folder entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(Folder entity);
}
