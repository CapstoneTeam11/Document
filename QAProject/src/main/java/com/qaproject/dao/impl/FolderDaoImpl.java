package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.FolderDao;
import com.qaproject.entity.Folder;
import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class FolderDaoImpl extends BaseDao<Folder,Integer> implements FolderDao {
    /**
     * find library by User
     * @param user
     * @return List<Folder>
     */
    @Override
    public List<Folder> findByUser(User user) {
        Query query = null;
        query = entityManager.createQuery("select l from Folder l where l.managerId =:user");
        query.setParameter("user",user);
        List<Folder> folders = null;
        try {
            folders = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return folders;
    }

    @Override
    public boolean checkFolderExists(String name,User user) {
        Query query = null;
        query = entityManager.createQuery("select l from Folder l where l.name=:name and l.managerId=:user");
        query.setParameter("name",name);
        query.setParameter("user",user);
        List<Folder> folders = null;
        try {
            folders = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(folders.size()>0) {
            return true;
        }
        return false;
    }
}
