package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.CategoryDao;
import com.qaproject.entity.Category;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class CategoryDaoImpl extends BaseDao<Category,Integer> implements CategoryDao{
    @Override
    public List<Category> findParent() {
        Query query = null;
        List<Category> categories = null;
        query = entityManager.createQuery("select c from Category c where c.parentId=0",Category.class);
        try {
          categories = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }
}
