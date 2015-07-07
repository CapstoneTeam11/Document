package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.MaterialDao;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.Material;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class MaterialDaoImpl extends BaseDao<Material,Integer> implements MaterialDao {
    @Override
    public List<Material> findMaterialByClassroom(Integer classroomId, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select m from Material m where m.ownerClassId.id=:classroomId " +
                    "order by m.id desc ");
        } else {
            query = entityManager.createQuery("Select m from Material m where m.ownerClassId.id=:classroomId " +
                    "and m.id<:lastId order by m.id desc ");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("classroomId",classroomId);
        query.setMaxResults(11);
        List<Material> materials = null;
        try{
            materials = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return materials;
    }

    @Override
    public List<Material> findMaterialByClassroomLikeName(Integer classroomId, String searchKey, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select m from Material m where m.ownerClassId.id=:classroomId " +
                    "and m.name like :searchKey order by m.id desc ");
        } else {
            query = entityManager.createQuery("Select m from Material m where m.ownerClassId.id=:classroomId " +
                    "and m.name like :searchKey and m.id<:lastId order by m.id desc ");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("searchKey",'%' + searchKey + '%');
        query.setParameter("classroomId",classroomId);
        query.setMaxResults(11);
        List<Material> materials = null;
        try{
            materials = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return materials;
    }

    @Override
    public List<Material> findMaterialByCategory(Integer categoryId, Integer nextFrom) {
        Query query = entityManager.createQuery("Select m from Material m where m.ownerClassId.categoryId.id=:categoryId " +
                "order by m.id desc ");
        query.setParameter("categoryId",categoryId);
        if (nextFrom < 0) {
            nextFrom = 0;
        }
        query.setFirstResult(nextFrom);
        query.setMaxResults(11);
        List<Material> materials = null;
        try{
            materials = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return materials;
    }

    @Override
    public List<Material> findMaterialByOwnerClassroom(Classroom classroom) {
        Query query = entityManager.createQuery("Select m from Material m where m.ownerClassId=:classroom order by m.id");
        query.setParameter("classroom",classroom);
        List<Material> materials = null;
        try{
            materials = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return materials;
    }

    @Override
    public List<Material> findMaterialLikeName(String searchKey, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select m from Material m where m.name like :searchKey " +
                    "order by m.id desc ");
        } else {
            query = entityManager.createQuery("Select m from Material m where m.name like :searchKey " +
                    "and m.id<:lastId order by m.id desc ");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("searchKey",'%' + searchKey + '%');
        query.setMaxResults(11);
        List<Material> materials = null;
        try{
            materials = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return materials;
    }
}
