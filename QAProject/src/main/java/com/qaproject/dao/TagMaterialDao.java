package com.qaproject.dao;

import com.qaproject.entity.TagMaterial;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 6/30/2015.
 */
@Repository
public interface TagMaterialDao {
    public TagMaterial find(Integer id);
    List<TagMaterial> findAll();
    public List<Integer> findRelatedMaterialIds (List<Integer> tagIds, Integer maxResult);
    public List<Integer> findMaterialIdsInTags(List<Integer> tagIds);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(TagMaterial entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(TagMaterial entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(TagMaterial entity);
}
