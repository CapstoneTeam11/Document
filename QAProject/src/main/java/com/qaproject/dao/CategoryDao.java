package com.qaproject.dao;

import com.qaproject.entity.Category;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface CategoryDao {
    public Category find(Integer id);
    List<Category> findAll();
    public List<Category> findParent();
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(Category entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(Category entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(Category entity);
}
