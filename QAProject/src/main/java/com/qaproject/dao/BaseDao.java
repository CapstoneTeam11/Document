package com.qaproject.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Created by khangtnse60992 on 10/3/2014.
 */
@Repository
public abstract class BaseDao<T,ID extends Serializable> {

    @PersistenceContext
    protected EntityManager entityManager;

    private Class<T> persistentClass;

    public BaseDao() {
        this.persistentClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    public List< T > findAll(){
        return entityManager.createQuery( "from " + persistentClass.getName() ).getResultList();
    }

    public EntityManager getEntityManager() {
        return entityManager;
    }

    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public T find(ID id) {
        return entityManager.find(persistentClass, id);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(T entity) {
        entityManager.persist(entity);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(T entity) {
        entityManager.merge(entity);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(T entity) {
        T entityRemove = entity ;
        if(entityManager.contains(entity)==false) {
            entityRemove = entityManager.merge(entity);
        }
        entityManager.remove(entityRemove);
    }
}
