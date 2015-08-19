package com.qaproject.dao;

import com.qaproject.entity.Role;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface RoleDao {
    public Role find(Integer id);
    List<Role> findAll();
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(Role entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(Role entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(Role entity);
}
