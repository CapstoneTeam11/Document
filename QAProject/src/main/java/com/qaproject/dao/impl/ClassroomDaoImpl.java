package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.ClassroomDao;
import com.qaproject.entity.Category;
import com.qaproject.entity.Classroom;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class ClassroomDaoImpl extends BaseDao<Classroom,Integer> implements ClassroomDao {
    /**
     * MinhKH
     * Using to get suggest classrooms by category
     * @param category
     * @return List<Classroom>
     */
    @Override
    public List<Classroom> findByCategory(Category category) {
        List<Classroom> classrooms = null;
        Query query = entityManager.createQuery("Select c from Classroom c where c.categoryId= :category");
        query.setParameter("category",category);
        try {
            classrooms = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classrooms;
    }
}
