package com.qaproject.util;

import com.qaproject.dao.PostDao;
import com.qaproject.dto.ClassroomDto;
import com.qaproject.dto.PostDto;
import com.qaproject.entity.ClassroomUser;
import com.qaproject.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Minh on 6/29/2015.
 */
@Component
public class ProfileUtilities {
    @Autowired
    PostDao postDao;
    @Autowired
    DashboardUtilities dashboardUtilities;

    public List<PostDto> loadProfileArticles(Integer ownerUserId, Integer lastId) {
        List<Post> articles = postDao.findArticlesByOwnerUser(ownerUserId, lastId);
        List<PostDto> articleDtos = new ArrayList<PostDto>();
        if (articles != null) {
            for (Post article : articles) {
                if (article != null) {
                    List<Post> answers = postDao.findRepliesByParentId(article.getId());
                    if (answers != null) {
                        Integer answerCount = answers.size();
                        PostDto articleDto = ConvertEntityDto.convertPostEntityToDto(article, answerCount);
                        articleDtos.add(articleDto);
                    }

                }

            }
        }
        return articleDtos;
    }

    public List<PostDto> loadProfileQuestions(Integer ownerUserId, Integer lastId) {
        List<Post> questions = postDao.findQuestionsByOwnerUser(ownerUserId, lastId);
        List<PostDto> questionDtos = new ArrayList<PostDto>();
        if (questions != null) {
            for (Post question : questions) {
                if (question != null) {
                    List<Post> answers = postDao.findRepliesByParentId(question.getId());
                    if (answers != null) {
                        Integer answerCount = answers.size();
                        PostDto questionDto = ConvertEntityDto.convertPostEntityToDto(question, answerCount);
                        questionDtos.add(questionDto);
                    }

                }

            }
        }
        return questionDtos;
    }

    public List<ClassroomDto> loadJoinedClassrooms(Integer studentId, Integer lastId) {
        return dashboardUtilities.loadJoinedClassrooms(studentId,lastId);
    }

    public List<ClassroomDto> loadOwnedClassrooms(Integer ownerUserId, Integer lastId) {
        return dashboardUtilities.loadOwnedClassrooms(ownerUserId,lastId);
    }
}
