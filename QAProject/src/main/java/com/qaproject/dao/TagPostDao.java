package com.qaproject.dao;

import com.qaproject.dto.TagDto;
import com.qaproject.entity.Post;
import com.qaproject.entity.TagPost;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface TagPostDao {
    public TagPost find(Integer id);
    List<TagPost> findAll();
    public List<Integer> findRelatedQuestionIds(List<Integer> tagIds, Integer maxResult);
    public List<Integer> findRelatedArticlesIds(List<Integer> tagIds, Integer maxResult);
    public List<Integer> findArticlesIdsInTags(List<Integer> tagIds);
    public List<TagDto> findTagInQuestions(List<Post> questions);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(TagPost entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(TagPost entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(TagPost entity);
}
