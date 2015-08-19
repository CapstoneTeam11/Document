package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.TagPostDao;
import com.qaproject.dto.TagDto;
import com.qaproject.entity.Post;
import com.qaproject.entity.TagPost;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class TagPostDaoImpl extends BaseDao<TagPost,Integer> implements TagPostDao {
    @Override
    public List<Integer> findRelatedQuestionIds(List<Integer> tagIds, Integer maxResult) {
        List<Integer> relatedQuestionIds = null;
        Query query = entityManager.createQuery("Select tp.postId.id from TagPost tp WHERE tp.tagId.id in :tagIds " +
                "and tp.postId.postType=1 " +
                "group by tp.postId " +
                "order by count(tp.tagId) DESC");
        query.setParameter("tagIds",tagIds);
        if (maxResult<0) {
            maxResult = 10;
        }
        query.setMaxResults(maxResult);
        try {
            relatedQuestionIds = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return relatedQuestionIds;
    }

    @Override
    public List<Integer> findRelatedArticlesIds(List<Integer> tagIds, Integer maxResult) {
        List<Integer> relatedArticleIds = null;
        Query query = entityManager.createQuery("Select tp.postId.id from TagPost tp WHERE tp.tagId.id in :tagIds " +
                "and tp.postId.postType=2 " +
                "group by tp.postId " +
                "order by count(tp.tagId) DESC");
        query.setParameter("tagIds",tagIds);
        if (maxResult<0) {
            maxResult = 10;
        }
        query.setMaxResults(maxResult);
        try {
            relatedArticleIds = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return relatedArticleIds;
    }

    @Override
    public List<Integer> findArticlesIdsInTags(List<Integer> tagIds) {
        List<Integer> articleIds = null;
        Query query = entityManager.createQuery("Select tp.postId.id from TagPost tp WHERE tp.tagId.id in :tagIds " +
                "and tp.postId.postType=2 " +
                "group by tp.postId " +
                "order by count(tp.tagId)");
        query.setParameter("tagIds",tagIds);
        try {
            articleIds = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return articleIds;
    }

    @Override
    public List<TagDto> findTagInQuestions(List<Post> questions) {
        Query query = entityManager.createQuery("Select tp.tagId.id, tp.tagId.tagName, " +
                "count(tp.postId) as tagCount from TagPost tp where tp.postId" +
                " in :questions group by tp.tagId order by tagCount");
        query.setParameter("questions", questions);
        List<TagDto> tagDtos = new ArrayList<TagDto>();
        try {
            List<Object[]> results = query.getResultList();

            if (results==null) {
                return null;
            }
            for (Object[] result : results){
                if (result==null){
                    continue;
                }
                Integer tagId = Integer.valueOf(result[0].toString());
                String tagName = String.valueOf(result[1]);
                Integer tagCount = Integer.valueOf(result[2].toString());
                if (tagId!=null && tagName!=null && tagCount!=null) {
                    TagDto tagDto = new TagDto();
                    tagDto.setId(tagId);
                    tagDto.setName(tagName);
                    tagDto.setCount(tagCount);
                    tagDtos.add(tagDto);
                }
            }
        } catch (NoResultException e){

        }
        return tagDtos;
    }
}
