package com.qaproject.dao;

import com.qaproject.dto.TagDto;
import com.qaproject.entity.Tag;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface TagDao {
    public Tag find(Integer id);
    List<Tag> findAll();
    public List<Tag> tagsByName(String name);
    public List<TagDto> tagDtosByName(String name);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(Tag entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(Tag entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(Tag entity);
}
