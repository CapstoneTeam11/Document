package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.ClassroomUserDao;
import com.qaproject.dto.ClassroomDto;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.ClassroomUser;
import com.qaproject.entity.User;
import com.qaproject.util.Constant;
import com.qaproject.util.ConvertEntityDto;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class ClassroomUserDaoImpl extends BaseDao<ClassroomUser,Integer> implements ClassroomUserDao{
    @Override
    public List<ClassroomUser> findRequestsByClassroomLikeStudentName(Integer classroomId, String searchKey, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.classroomId.id=:classroomId and "+
                    "cu.approval=0 and cu.type=1 and cu.userId.displayName like :searchKey order by cu.id desc");
        }else {
            query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.classroomId.id=:classroomId and "+
                    "cu.approval=0 and cu.type=1 and cu.userId.displayName like :searchKey and cu.id<:lastId order by cu.id desc");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("searchKey",'%' + searchKey + '%');
        query.setParameter("classroomId",classroomId);
        query.setMaxResults(11);
        List<ClassroomUser> requests = null;
        try {
            requests = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return requests;
    }

    @Override
    public Integer countRequestsByClassroomLikeStudentName(Integer classroomId, String searchKey) {
        Query query = entityManager.createQuery("Select count(cu.id) from ClassroomUser cu " +
                "where cu.classroomId.id=:classroomId " +
                "and cu.approval=0 and cu.type=1 and cu.userId.displayName like :searchKey");
        query.setParameter("searchKey",'%' + searchKey + '%');
        query.setParameter("classroomId",classroomId);
        Integer count = 0;
        try {
            count = ((Long) query.getSingleResult()).intValue();
        } catch (NoResultException e){

        }
        return count;
    }

    @Override
    public List<ClassroomUser> findByClassroom(Classroom classroom) {
        List<ClassroomUser> classroomUsers = null;
        Query query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.classroomId=:classroom and cu.approval=1 ");
        query.setParameter("classroom",classroom);
        try {
            classroomUsers = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classroomUsers;
    }

    @Override
    public List<ClassroomUser> findByUser(User user) {
        List<ClassroomUser> classroomUsers = null;
        Query query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId=:user ");
        query.setParameter("user",user);
        try {
            classroomUsers = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classroomUsers;
    }

    @Override
    public List<ClassroomUser> findByUserWithApproved(User user) {
        List<ClassroomUser> classroomUsers = null;
        Query query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId=:user and cu.approval=1");
        query.setParameter("user",user);
        try {
            classroomUsers = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classroomUsers;
    }

    @Override
    public List<ClassroomUser> findJoinedClassroomUserForDashboard (Integer studentId, Integer lastId){
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId.id=:studentId and "+
                    "cu.approval=1 order by cu.id desc");
        } else {
            query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId.id=:studentId and "+
                    "cu.approval=1 and cu.id<:lastId order by cu.id desc");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("studentId",studentId);
        query.setMaxResults(11);
        List<ClassroomUser> classroomUsers = null;
        try {
            classroomUsers = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classroomUsers;
    }

    @Override
    public List<ClassroomUser> findInvitationClassroomUserForDashboard(Integer studentId, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId.id=:studentId and "+
                    "cu.approval=0 and cu.type=2 order by cu.id desc");
        }else {
            query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId.id=:studentId and "+
                    "cu.approval=0 and cu.type=2 and cu.id<:lastId order by cu.id desc");
            query.setParameter("lastId",lastId);
        }

        query.setParameter("studentId",studentId);
        query.setMaxResults(11);
        List<ClassroomUser> classroomUsers = null;
        try {
            classroomUsers = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classroomUsers;
    }

    @Override
    public List<ClassroomUser> findRequestsByClassroom(Integer classroomId, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.classroomId.id=:classroomId and "+
                    "cu.approval=0 and cu.type=1 order by cu.id desc");
        }else {
            query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.classroomId.id=:classroomId and "+
                    "cu.approval=0 and cu.type=1 and cu.id<:lastId order by cu.id desc");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("classroomId",classroomId);
        query.setMaxResults(11);
        List<ClassroomUser> requests = null;
        try {
            requests = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return requests;
    }

    @Override
    public List<ClassroomUser> findStudentsByClassroom(Integer classroomId, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.classroomId.id=:classroomId and "+
                    "cu.approval=1 order by cu.id desc");
        }else {
            query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.classroomId.id=:classroomId and "+
                    "cu.approval=1 and cu.id<:lastId order by cu.id desc");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("classroomId",classroomId);
        query.setMaxResults(11);
        List<ClassroomUser> students = null;
        try {
            students = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public List<ClassroomUser> findStudentsByClassroomLikeStudentName(Integer classroomId, String searchKey, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.classroomId.id=:classroomId and "+
                    "cu.approval=1 and cu.userId.displayName like :searchKey order by cu.id desc");
        }else {
            query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.classroomId.id=:classroomId and "+
                    "cu.approval=1 and cu.userId.displayName like :searchKey and cu.id<:lastId order by cu.id desc");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("searchKey",'%' + searchKey + '%');
        query.setParameter("classroomId",classroomId);
        query.setMaxResults(11);
        List<ClassroomUser> students = null;
        try {
            students = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public Integer countStudentsByClassroomLikeStudentName(Integer classroomId, String searchKey) {
        Query query = entityManager.createQuery("Select count(cu.id) from ClassroomUser cu " +
                "where cu.classroomId.id=:classroomId and cu.approval=1 and cu.userId.displayName like :searchKey");
        query.setParameter("searchKey",'%' + searchKey + '%');
        query.setParameter("classroomId",classroomId);
        Integer count = 0;
        try {
            count = ((Long) query.getSingleResult()).intValue();
        } catch (NoResultException e){

        }
        return count;
    }

    @Override
    public List<ClassroomUser> findByUserClassroomWithApprove(int userId, int classId) {
        List<ClassroomUser> classroomUsers = null;
        Query query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId.id=:userId and cu.classroomId.id = :classId and cu.approval = 1");
        query.setParameter("userId",userId);
        query.setParameter("classId",classId);
        try {
            classroomUsers = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classroomUsers;
    }

    @Override
    public List<ClassroomUser> findByUserClassroom(int userId, int classId) {
        List<ClassroomUser> classroomUsers = null;
        Query query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId.id=:userId and cu.classroomId.id = :classId");
        query.setParameter("userId",userId);
        query.setParameter("classId",classId);
        try {
            classroomUsers = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return classroomUsers;
    }

    @Override
    public ClassroomUser findLastRequestByStudent(User student) {
        Query query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId=:student and cu.type=1 " +
                "order by cu.id desc");
        query.setParameter("student",student);
        query.setMaxResults(1);
        ClassroomUser classroomUser = null;
        try {
             classroomUser =(ClassroomUser) query.getResultList().get(0);
        } catch (NoResultException e){

        }
        return  classroomUser;
    }

    @Override
    public ClassroomUser findClassroomByClassroomAndUser(Integer studentId, Integer classroomId) {
        Query query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId.id=:studentId and " +
                "cu.classroomId.id=:classroomId");
        query.setParameter("studentId",studentId);
        query.setParameter("classroomId",classroomId);
        query.setMaxResults(1);
        ClassroomUser classroomUser = null;
        try {
            List<ClassroomUser> classroomUsers = query.getResultList();
            if (classroomUsers!=null){
                if (classroomUsers.size()>0){
                    classroomUser =classroomUsers.get(0);
                }
            }
        } catch (NoResultException e){

        }
        return  classroomUser;
    }

    @Override
    public List<ClassroomUser> findLastInvitationsByStudents(List<Integer> studentIds) {
        Query query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId.id in :studentIds");
        query.setParameter("studentIds",studentIds);
        List<ClassroomUser> classroomUsers = null;
        try {
            classroomUsers = query.getResultList();
        } catch (NoResultException e){

        }
        return  classroomUsers;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void delete(ClassroomUser entity) {
        ClassroomUser classroomUser = entityManager.getReference(ClassroomUser.class, entity.getId());
        entityManager.remove(classroomUser);
    }
}
