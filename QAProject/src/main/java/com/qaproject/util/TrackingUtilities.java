package com.qaproject.util;

import com.qaproject.dao.ClassroomDao;
import com.qaproject.dao.PostDao;
import com.qaproject.dao.TagPostDao;
import com.qaproject.dto.TagDto;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Minh on 6/30/2015.
 */
@Component
public class TrackingUtilities {
    @Autowired
    ClassroomDao classroomDao;
    @Autowired
    PostDao postDao;
    @Autowired
    TagPostDao tagPostDao;

    public List<TagDto> loadTracking (Integer teacherId) {
        List<Classroom> classrooms = classroomDao.findByOwnerUser(teacherId);
        List<TagDto> tagDtos = new ArrayList<TagDto>();
        if (classrooms!=null) {
            List<Post> questions = new ArrayList<Post>();
            for (Classroom classroom : classrooms) {
                List<Post> currentQuestions = postDao.findQuestionByOwnerClassroom(classroom);
                if (currentQuestions==null || currentQuestions.size()==0) {
                    continue;
                }
                questions.addAll(currentQuestions);
            }
            if (questions.size()>0){
                tagDtos = tagPostDao.findTagInQuestions(questions);
            }
        }
        return tagDtos;
    }
}
