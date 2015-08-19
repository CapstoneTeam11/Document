package com.qaproject.util;

import com.qaproject.dao.ClassroomUserDao;
import com.qaproject.dao.MaterialDao;
import com.qaproject.dao.PostDao;
import com.qaproject.dto.MaterialDto;
import com.qaproject.dto.PostDto;
import com.qaproject.dto.RequestDto;
import com.qaproject.dto.StudentDto;
import com.qaproject.entity.ClassroomUser;
import com.qaproject.entity.Material;
import com.qaproject.entity.Post;
import com.qaproject.util.ConvertEntityDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Minh on 6/28/2015.
 */
@Component
public class ClassroomUtilities {
    @Autowired
    PostDao postDao;
    @Autowired
    MaterialDao materialDao;
    @Autowired
    ClassroomUserDao classroomUserDao;

    public List<PostDto> loadQuestions(Integer classroomId, Integer lastId,Integer role){
        List<Post> questions = postDao.findQuestionByOwnerClassroom(classroomId,lastId);
        List<PostDto> questionDtos = new ArrayList<PostDto>();
        if (questions!=null) {
            for(Post question: questions){
                if (question !=null) {
                    List<Post> answers = postDao.findRepliesByParentId(question.getId());
                    if(role==Constant.TEACHER) {
                        if(question.getStatus()==1 && question.getAcceptedAnswerId()==0  ) {
                        Integer numSimilar = postDao.countSimilar(question.getTitle(),question.getOwnerClassId().getId());
                        question.setSimilar(numSimilar);
                        }
                    }
                    if (answers!=null) {
                        Integer answerCount = answers.size();
                        PostDto questionDto = ConvertEntityDto.convertPostEntityToDto(question,answerCount);
                        questionDtos.add(questionDto);
                    }
                }

            }
        }
        return questionDtos;
    }

    public List<PostDto> loadArticles(Integer classroomId, Integer lastId){
        List<Post> articles = postDao.findArticleByOwnerClassroom(classroomId, lastId);
        List<PostDto> articleDtos = new ArrayList<PostDto>();
        if (articles!=null) {
            for(Post article: articles){
                if (article !=null) {
                    List<Post> answers = postDao.findRepliesByParentId(article.getId());
                    if (answers!=null) {
                        Integer answerCount = answers.size();
                        PostDto articleDto = ConvertEntityDto.convertPostEntityToDto(article,answerCount);
                        articleDtos.add(articleDto);
                    }

                }

            }
        }
        return articleDtos;
    }

    public List<MaterialDto> loadMaterials(Integer classroomId, Integer lastId) {
        List<MaterialDto> materialDtos = new ArrayList<MaterialDto>();
        List<Material> materials = materialDao.findMaterialByClassroom(classroomId,lastId);
        if (materials!=null) {
            for (Material material:materials){
                MaterialDto materialDto = ConvertEntityDto.convertMaterialEntityToDto(material);
                materialDtos.add(materialDto);
            }
        }
        return materialDtos;
    }

    public List<RequestDto> loadRequests(Integer classroomId, Integer lastId) {
        List<RequestDto> requestDtos = new ArrayList<RequestDto>();
        List<ClassroomUser> requests = classroomUserDao.findRequestsByClassroom(classroomId,lastId);
        if (requests!=null){
            for (ClassroomUser request :requests){
                if (request!=null) {
                    RequestDto requestDto = ConvertEntityDto.convertClassroomUserEntityToRequestDto(request);
                    requestDtos.add(requestDto);
                }
            }
        }
        return requestDtos;
    }

    public List<StudentDto> loadStudents(Integer classroomId, Integer lastId) {
        List<StudentDto> studentDtos = new ArrayList<StudentDto>();
        List<ClassroomUser> students = classroomUserDao.findStudentsByClassroom(classroomId, lastId);
        if (students!=null){
            for (ClassroomUser student :students){
                if (student!=null) {
                    StudentDto studentDto = ConvertEntityDto.convertClassroomUserEntityToStudentDto(student);
                    studentDtos.add(studentDto);
                }
            }
        }
        return studentDtos;
    }

    public List<PostDto> findQuestions(Integer classroomId, String searchKey, Integer lastId){
        List<Post> questions = postDao.findQuestionByOwnerClassroomLikeTitle(classroomId, searchKey, lastId);
        List<PostDto> questionDtos = new ArrayList<PostDto>();
        if (questions!=null) {
            for(Post question: questions){
                if (question !=null) {
                    List<Post> answers = postDao.findRepliesByParentId(question.getId());
                    if (answers!=null) {
                        Integer answerCount = answers.size();
                        PostDto questionDto = ConvertEntityDto.convertPostEntityToDto(question,answerCount);
                        questionDtos.add(questionDto);
                    }
                }

            }
        }
        return questionDtos;
    }

    public List<PostDto> findArticles(Integer classroomId, String searchKey, Integer lastId){
        List<Post> articles = postDao.findArticleByOwnerClassroomLikeTitle(classroomId, searchKey, lastId);
        List<PostDto> articleDtos = new ArrayList<PostDto>();
        if (articles!=null) {
            for(Post article: articles){
                if (article !=null) {
                    List<Post> answers = postDao.findRepliesByParentId(article.getId());
                    if (answers!=null) {
                        Integer answerCount = answers.size();
                        PostDto articleDto = ConvertEntityDto.convertPostEntityToDto(article,answerCount);
                        articleDtos.add(articleDto);
                    }

                }

            }
        }
        return articleDtos;
    }

    public List<MaterialDto> findMaterials(Integer classroomId, String searchKey, Integer lastId) {
        List<MaterialDto> materialDtos = new ArrayList<MaterialDto>();
        List<Material> materials = materialDao.findMaterialByClassroomLikeName(classroomId,searchKey,lastId);
        if (materials!=null) {
            for (Material material:materials){
                MaterialDto materialDto = ConvertEntityDto.convertMaterialEntityToDto(material);
                materialDtos.add(materialDto);
            }
        }
        return materialDtos;
    }

    public List<RequestDto> findRequests(Integer classroomId, String searchKey, Integer lastId) {
        List<RequestDto> requestDtos = new ArrayList<RequestDto>();
        List<ClassroomUser> requests = classroomUserDao.findRequestsByClassroomLikeStudentName(classroomId,searchKey,
                lastId);
        if (requests!=null){
            for (ClassroomUser request :requests){
                if (request!=null) {
                    RequestDto requestDto = ConvertEntityDto.convertClassroomUserEntityToRequestDto(request);
                    requestDtos.add(requestDto);
                }
            }
        }
        return requestDtos;
    }

    public List<StudentDto> findStudents(Integer classroomId, String searchKey, Integer lastId) {
        List<StudentDto> studentDtos = new ArrayList<StudentDto>();
        List<ClassroomUser> students = classroomUserDao.findStudentsByClassroomLikeStudentName(classroomId,
                searchKey, lastId);
        if (students!=null){
            for (ClassroomUser student :students){
                if (student!=null) {
                    StudentDto studentDto = ConvertEntityDto.convertClassroomUserEntityToStudentDto(student);
                    studentDtos.add(studentDto);
                }
            }
        }
        return studentDtos;
    }

    public Integer countQuestion(Integer classroomId, String searchKey){
        return postDao.countQuestionByOwnerClassroomLikeTitle(classroomId,searchKey);
    }
    public Integer countArticle(Integer classroomId, String searchKey){
        return postDao.countArticleByOwnerClassroomLikeTitle(classroomId,searchKey);
    }
    public Integer countMaterial(Integer classroomId, String searchKey){
        return materialDao.countMaterialByClassroomLikeName(classroomId,searchKey);
    }
    public Integer countRequest(Integer classroomId, String searchKey){
        return classroomUserDao.countRequestsByClassroomLikeStudentName(classroomId,searchKey);
    }
    public Integer countStudent(Integer classroomId, String seachKey){
        return classroomUserDao.countStudentsByClassroomLikeStudentName(classroomId,seachKey);
    }
}
