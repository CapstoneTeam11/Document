package com.qaproject.util;

import com.qaproject.dao.ClassroomDao;
import com.qaproject.dao.MaterialDao;
import com.qaproject.dao.PostDao;
import com.qaproject.dao.UserDao;
import com.qaproject.dto.ClassroomDto;
import com.qaproject.dto.MaterialDto;
import com.qaproject.dto.PostDto;
import com.qaproject.dto.UserDto;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.Material;
import com.qaproject.entity.Post;
import com.qaproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Minh on 7/6/2015.
 */
@Component
public class SearchUtilities {
    @Autowired
    PostDao postDao;
    @Autowired
    MaterialDao materialDao;
    @Autowired
    UserDao userDao;
    @Autowired
    ClassroomDao classroomDao;

    public Integer countQuestion(String searchKey){
        return postDao.countQuestionLikeTitle(searchKey);
    }

    public Integer countArticle(String searchKey){
        return postDao.countArticleLikeTitle(searchKey);
    }

    public Integer countMaterial(String searchKey){
        return materialDao.countMaterialLikeName(searchKey);
    }

    public Integer countClassroom(String searchKey){
        return classroomDao.countClassroomLikeClassroomName(searchKey);
    }

    public Integer countUser(String searchKey){
        return userDao.countUserLikeDisplayName(searchKey);
    }


    public List<PostDto> getTopThreeQuestions (String searchKey) {
        List<Post> questions = postDao.findQuestionLikeTitle(searchKey,0);
        List<PostDto> questionDtos = new ArrayList<PostDto>();
        if (questions!=null) {
            for (Post question: questions){
                PostDto questionDto = ConvertEntityDto.convertPostEntityToDto(question,0);
                if (questionDtos.size()==3){
                    break;
                }
                questionDtos.add(questionDto);
            }
        }
        return questionDtos;
    }



    public List<PostDto> getTopThreeArticles (String searchKey) {
        List<Post> articles = postDao.findArticleLikeTitle(searchKey, 0);
        List<PostDto> articleDtos = new ArrayList<PostDto>();
        if (articles!=null) {
            for (Post article: articles){
                PostDto articleDto = ConvertEntityDto.convertPostEntityToDto(article,0);
                if (articleDtos.size()==3){
                    break;
                }
                articleDtos.add(articleDto);
            }
        }
        return articleDtos;
    }

    public List<MaterialDto> getTopThreeMaterials (String searchKey) {
        List<Material> materials = materialDao.findMaterialLikeName(searchKey, 0);
        List<MaterialDto> materialDtos = new ArrayList<MaterialDto>();
        if (materials!=null) {
            for (Material material: materials){
                MaterialDto materialDto = ConvertEntityDto.convertMaterialEntityToDto(material);
                if (materialDtos.size()==3){
                    break;
                }
                materialDtos.add(materialDto);
            }
        }
        return materialDtos;
    }

    public List<ClassroomDto> getTopThreeClassrooms (String searchKey) {
        List<Classroom> classrooms = classroomDao.findClassroomLikeClassroomName(searchKey, 0);
        List<ClassroomDto> classroomDtos = new ArrayList<ClassroomDto>();
        if (classrooms!=null) {
            for (Classroom classroom: classrooms){
                ClassroomDto classroomDto = ConvertEntityDto.convertClassroomEntityToDto(classroom);
                if (classroomDtos.size()==3){
                    break;
                }
                classroomDtos.add(classroomDto);
            }
        }
        return classroomDtos;
    }

    public List<UserDto> getTopThreeUsers (String searchKey) {
        List<User> users = userDao.findUserLikeDisplayName(searchKey, 0);
        List<UserDto> userDtos = new ArrayList<UserDto>();
        if (users!=null) {
            for (User user: users){
                UserDto userDto = ConvertEntityDto.convertUserEntityToDto(user);
                if (userDtos.size()==3){
                    break;
                }
                userDtos.add(userDto);
            }
        }
        return userDtos;
    }

    public List<PostDto> getQuestions (String searchKey, Integer lastId) {
        List<Post> questions = postDao.findQuestionLikeTitle(searchKey,lastId);
        List<PostDto> questionDtos = new ArrayList<PostDto>();
        if (questions!=null) {
            for (Post question: questions){
                PostDto questionDto = ConvertEntityDto.convertPostEntityToDto(question,0);
                questionDtos.add(questionDto);
            }
        }
        return questionDtos;
    }

    public List<PostDto> getArticles (String searchKey, Integer lastId) {
        List<Post> articles = postDao.findArticleLikeTitle(searchKey, lastId);
        List<PostDto> articleDtos = new ArrayList<PostDto>();
        if (articles!=null) {
            for (Post article: articles){
                PostDto articleDto = ConvertEntityDto.convertPostEntityToDto(article,0);
                articleDtos.add(articleDto);
            }
        }
        return articleDtos;
    }

    public List<MaterialDto> getMaterials (String searchKey, Integer lastId) {
        List<Material> materials = materialDao.findMaterialLikeName(searchKey, lastId);
        List<MaterialDto> materialDtos = new ArrayList<MaterialDto>();
        if (materials!=null) {
            for (Material material: materials){
                MaterialDto materialDto = ConvertEntityDto.convertMaterialEntityToDto(material);
                materialDtos.add(materialDto);
            }
        }
        return materialDtos;
    }

    public List<ClassroomDto> getClassrooms (String searchKey, Integer lastId) {
        List<Classroom> classrooms = classroomDao.findClassroomLikeClassroomName(searchKey, lastId);
        List<ClassroomDto> classroomDtos = new ArrayList<ClassroomDto>();
        if (classrooms!=null) {
            for (Classroom classroom: classrooms){
                ClassroomDto classroomDto = ConvertEntityDto.convertClassroomEntityToDto(classroom);
                classroomDtos.add(classroomDto);
            }
        }
        return classroomDtos;
    }

    public List<UserDto> getUsers (String searchKey, Integer lastId) {
        List<User> users = userDao.findUserLikeDisplayName(searchKey, lastId);
        List<UserDto> userDtos = new ArrayList<UserDto>();
        if (users!=null) {
            for (User user: users){
                UserDto userDto = ConvertEntityDto.convertUserEntityToDto(user);
                userDtos.add(userDto);
            }
        }
        return userDtos;
    }
}
