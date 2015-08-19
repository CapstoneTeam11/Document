<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: Minh--%>
  <%--Date: 5/26/2015--%>
  <%--Time: 10:07 AM--%>
  <%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>

    <%--<!-- Basic Page Needs -->--%>
    <%--<meta charset="utf-8">--%>
    <%--<title>Ask me – Responsive Questions and Answers Template</title>--%>
    <%--<meta name="description" content="Ask me Responsive Questions and Answers Template">--%>
    <%--<meta name="author" content="2code.info">--%>



    <%--<!-- Mobile Specific Metas -->--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">--%>

    <%--<!-- Main Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/style.css">--%>

    <%--<!-- Skins -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/skins/skins.css">--%>

    <%--<!-- Responsive Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/responsive.css">--%>

    <%--<!-- Boostrap Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/bootstrap.min.css">--%>

    <%--<!-- Boostrap Theme Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/bootstrap-theme.min.css">--%>

    <%--<!-- Notification Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/notification.css">--%>

    <%--<!-- Left Notification style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/jquery.growl.css"/>--%>

    <%--<!-- Favicons -->--%>
    <%--<link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">--%>
    <%--<!-- Toast message Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/jquery.toastmessage.css">--%>

<%--</head>--%>

<%--<body>--%>

<%--<div class="loader"><div class="loader_html"></div></div>--%>
<%@include file="css.jsp" %>
<div id="wrap">


<%@include file="header.jsp" %>
<div class="breadcrumbs" style="margin-top: 86px">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>Profile</h3>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar">
<div class="row">
<div class="col-md-10 col-md-offset-1">
    <div class="row">
        <div class="user-profile">
            <div class="col-md-12">
                <div class="page-content">
                    <h2>About ${userProfile.displayName}</h2>
                    <c:if test="${sessionScope.user.id==userProfile.id}">
                        <a class="comment-reply" href="/profile/update" style="margin-right: 10px;">
                            <i class="icon-pencil"></i>Edit profile
                        </a>
                    </c:if>
                    <c:if test="${userProfile.roleId.id==2 and sessionScope.user.id!=userProfile.id and !isFollow
                    and userProfile.status==0}">
                        <div id="follow"><a class="question-report" href="javascript:followTeacher(${userProfile.id});" style="margin-right: 20px;">Follow</a></div>
                    </c:if>
                    <c:if test="${isFollow}">
                        <div id="follow"><a class="question-report" href="javascript:unfollowTeacher(${userProfile.id});" style="margin-right: 20px;">Unfollow</a></div>
                    </c:if>
                    <div class="user-profile-img"><img src="${userProfile.profileImageURL}"
                                                       style="width: 80px;height: 80px"alt="admin"></div>
                    <div class="ul_list ul_list-icon-ok about-user">
                        <ul>
                            <li><i class="icon-user"></i>Type : ${userProfile.roleId.roleName}</li>
                            <li><i class="icon-book"></i>Specialty : <span>${userProfile.categoryId.categoryName}</span></li>
                            <li><i class="icon-plus"></i>Registered : <span>${userProfile.creationDate}</span></li>
                        </ul>
                    </div>
                    <p>
                        <c:if test="${not empty userProfile.aboutMe}">
                            ${userProfile.aboutMe}
                        </c:if>
                        <c:if test="${empty userProfile.aboutMe}">
                            ${userProfile.displayName} have not introduced about him or her yet.
                        </c:if>
                    </p>
                    <div class="clearfix"></div>
                </div><!-- End page-content -->
            </div><!-- End col-md-12 -->
        </div><!-- End user-profile -->
    </div><!-- End row -->
    <div class="clearfix"></div>
    <div class="tabs-warp question-tab">
        <ul class="tabs">
            <li class="tab"><a href="#" class="current">Questions</a></li>
            <li class="tab"><a href="#">Articles</a></li>
            <c:if test="${userProfile.roleId.id==1}">
                <li class="tab"><a href="#">Joined Classrooms</a></li>
            </c:if>
            <c:if test="${userProfile.roleId.id==2}">
                <li class="tab"><a href="#">Owned Classrooms</a></li>
            </c:if>

        </ul>
        <div class="tab-inner-warp">
            <div class="tab-inner" id="questions">
                <c:if test="${not empty questions}">
                    <c:if test="${fn:length(questions)>10}">
                        <c:forEach var="question" items="${questions}" end="9">
                            <article class="question question-type-normal">
                                <h2>
                                    <a href="/post/view/${question.id}">${question.title}</a>
                                </h2>
                                <div class="question-author">
                                    <a href="/profile/view/${question.ownerId}"
                                       original-title="${question.ownerName}"
                                       class="tooltip-n"><span></span><img alt=""
                                                                           src="${question.ownerProfileImageURL}"></a>
                                </div>
                                <div class="question-inner">
                                    <div class="clearfix"></div>
                                    <div class="question-desc short-text">${question.body}</div>
                                    <div class="question-details">
                                                    <span class="question-answered question-answered-done">
                                                        <c:if test="${question.acceptedAnswerId == 1}">
                                                            <i class="icon-ok"></i>Resolved
                                                        </c:if>
                                                    </span>
                                    </div>
                                                <span class="question-date"><i
                                                        class="icon-time"></i>${question.lastEditedDate}</span>
                                                <span class="question-category"><a
                                                        href="/classroom/${question.classId}"><i
                                                        class="icon-group"></i>Class: ${question.className}</a></span>
                                                <span class="question-comment"><a href="#"><i
                                                        class="icon-comment"></i>${question.answerCount} Answer(s)</a></span>
                                                <span class="question-view"><i
                                                        class="icon-eye-open"></i>${question.viewer} view(s)</span>
                                    <div class="clearfix"></div>
                                </div>
                            </article>
                        </c:forEach>
                    </c:if>
                    <c:if test="${fn:length(questions)<=10}">
                        <c:forEach var="question" items="${questions}">
                            <article class="question question-type-normal">
                                <h2>
                                    <a href="/post/view/${question.id}">${question.title}</a>
                                </h2>
                                <div class="question-author">
                                    <a href="/profile/view/${question.ownerId}"
                                       original-title="${question.ownerName}"
                                       class="tooltip-n"><span></span><img alt=""
                                                                           src="${question.ownerProfileImageURL}"></a>
                                </div>
                                <div class="question-inner">
                                    <div class="clearfix"></div>
                                    <div class="question-desc short-text">${question.body}</div>
                                    <div class="question-details">
                                                    <span class="question-answered question-answered-done">
                                                        <c:if test="${question.acceptedAnswerId==1}">
                                                            <i class="icon-ok"></i>Resolved
                                                        </c:if>
                                                    </span>
                                    </div>
                                                <span class="question-date"><i
                                                        class="icon-time"></i>${question.lastEditedDate}</span>
                                                <span class="question-category"><a
                                                        href="/classroom/${question.classId}"><i
                                                        class="icon-group"></i>Class: ${question.className}</a></span>
                                                <span class="question-comment"><a href="#"><i
                                                        class="icon-comment"></i>${question.answerCount} Answer(s)</a></span>
                                                 <span class="question-view"><i
                                                         class="icon-eye-open"></i>${question.viewer} view(s)</span>
                                    <div class="clearfix"></div>
                                </div>
                            </article>
                        </c:forEach>
                    </c:if>
                </c:if>
                <c:if test="${empty questions}">
                    <div class="about-author clearfix">
                        No question.
                    </div>
                </c:if>
            </div>
            <c:if test="${fn:length(questions)>10}">
                <div id="loadingQ"
                     style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
                <a class="post-read-more button color small"
                   style="margin-bottom: 5px;" id="loadMoreQuestion">Load more</a>
            </c:if>
        </div>
        <div class="tab-inner-warp">
            <div class="tab-inner" id="articles">
                <c:if test="${not empty articles}">
                    <c:if test="${fn:length(articles)>10}">
                        <c:forEach var="article" items="${articles}" end="9">
                            <article class="post clearfix">
                                <div class="post-inner">
                                    <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a
                                            href="/post/view/${article.id}">${article.title}</a></h2>
                                    <div class="post-meta">
                                        <span class="meta-author"><i class="icon-user"></i><a href="#">Author: ${article.ownerName}</a></span>
                                        <span class="meta-date"><i class="icon-time"></i>${article.lastEditedDate}</span>
                                <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">${article.answerCount}
                                    comment(s)</a></span>
                                <span class="question-category"><a href="/classroom/${article.classId}"><i
                                        class="icon-group"></i>Class: ${article.className}</a></span>
                                    </div>
                                    <div class="post-content short-text">
                                        <p>${article.body}</p>
                                    </div><!-- End post-content -->
                                </div><!-- End post-inner -->
                            </article>
                        </c:forEach>
                    </c:if>
                    <c:if test="${fn:length(articles)<=10}">
                        <c:forEach var="article" items="${articles}">
                            <article class="post clearfix">
                                <div class="post-inner">
                                    <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a
                                            href="/post/view/${article.id}">${article.title}</a></h2>
                                    <div class="post-meta">
                                        <span class="meta-author"><i class="icon-user"></i><a href="#">Author: ${article.ownerName}</a></span>
                                        <span class="meta-date"><i class="icon-time"></i>${article.lastEditedDate}</span>
                                <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">${article.answerCount}
                                    comment(s)</a></span>
                                <span class="question-category"><a href="/classroom/${article.classId}"><i
                                        class="icon-group"></i>Class: ${article.className}</a></span>
                                    </div>
                                    <div class="post-content short-text">
                                        <p>${article.body}</p>
                                    </div><!-- End post-content -->
                                </div><!-- End post-inner -->
                            </article>
                        </c:forEach>
                    </c:if>
                </c:if>
                <c:if test="${empty articles}">
                    <div class="about-author clearfix">
                        No article.
                    </div>
                </c:if>
            </div>
            <c:if test="${fn:length(articles)>10}">
                <div id="loadingA"
                     style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
                <a class="post-read-more button color small"
                   style="margin-bottom: 5px;" id="loadMoreArticle">Load more</a>
            </c:if>
        </div>
        <div class="tab-inner-warp">
            <div class="tab-inner" id="classrooms">
                <c:if test="${not empty classrooms}">
                    <c:if test="${fn:length(classrooms)>10}">
                        <c:forEach var="classroom" items="${classrooms}" end="9">
                            <div class="about-author clearfix" id="classroom${classroom.id}">
                                <div class="" style="float: left;padding-right: 20px;">
                                    <a href="#" original-title="admin" class=""><img alt=""
                                                                                     src="/resource/assets/images/classroom.png"></a>
                                </div>
                                <div class="author-bio">
                                    <h4><a href="/classroom/${classroom.id}">
                                            ${classroom.classroomName}
                                    </a>
                                    </h4>
                                    <c:if test="${classroom.status==0}">
                                        <div class="closedStatus">This classroom is closed.</div>
                                    </c:if>
                                    <c:if test="${classroom.status==1}">
                                        ${classroom.classroomDescription}
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${fn:length(classrooms)<=10}">
                        <c:forEach var="classroom" items="${classrooms}">
                            <div class="about-author clearfix" id="classroom${classroom.id}">
                                <div class="" style="float: left;padding-right: 20px;">
                                    <a href="#" original-title="admin" class=""><img alt=""
                                                                                     src="/resource/assets/images/classroom.png"></a>
                                </div>
                                <div class="author-bio">
                                    <h4><a href="/classroom/${classroom.id}">
                                            ${classroom.classroomName}
                                    </a>
                                    </h4>
                                    <c:if test="${classroom.status==0}">
                                        <div class="closedStatus">This classroom is closed.</div>
                                    </c:if>
                                    <c:if test="${classroom.status==1}">
                                        ${classroom.classroomDescription}
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </c:if>
                <c:if test="${empty classrooms}">
                    <div class="about-author clearfix">
                        No classroom
                    </div>
                </c:if>
            </div>
            <c:if test="${fn:length(classrooms) > 10}">
                <div id="loadingC"
                     style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
                <c:if test="${userProfile.roleId.id==1}">
                <div><a class="post-read-more button color small" style="margin-bottom: 20px;"
                        id="loadMoreJoinedClassroom">Load more</a></div>
                </c:if>
                <c:if test="${userProfile.roleId.id==2}">
                    <div><a class="post-read-more button color small" style="margin-bottom: 20px;"
                            id="loadMoreOwnedClassroom">Load more</a></div>
                </c:if>
            </c:if>
        </div>
    </div><!-- End page-content -->
</div><!-- End main -->

</div><!-- End row -->
</section><!-- End container -->

<%@include file="footer.jsp" %>
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<%@include file="js.jsp" %>
<c:if test="${sessionScope.user!=null}">
    <script src="/resource/assets/js/notification.js"></script>
</c:if>

<!-- End js -->
<script>
$(document).ready(function(){
    /*short test for list of posts - MinhKH*/
    $(".short-text").each(function () {
        text = $(this).html();
        if (text.length > 400) {
            $(this).html(text.substr(0, 400) + '.......');
        }
    });
});
    function followTeacher(id){
        var url = "/followTeacher/";
        $.ajax({
            type: "POST",
            url: url,
            data: "teacherId="+id,
            success: function(data){
                if(data == "OK"){
//                    $().toastmessage('showSuccessToast', 'Follow teachcer!');
                    $("#follow").html("<a class='question-report' href='javascript:unfollowTeacher(${userProfile.id});' style='margin-right: 20px;'>Unfollow</a>");

                }else{
                    $.growl.notice({
                        message: '<div class="activity-item"> <i class="fa fa-heart text-success"></i> <div class="activity"> Error! Please try again late! </div> </div>',
                        location: "tr"
                    });
//                    $().toastmessage('showErrorToast', "");
                }

            }
        });
    }
    function unfollowTeacher(id){
        var url = "/unfollowTeacher/";
        $.ajax({
            type: "POST",
            url: url,
            data: "teacherId="+id,
            success: function(data){
                if(data == "OK"){
//                    $().toastmessage('showSuccessToast', 'Unfollow teacher!');
//                    $("#follow").html("<a href='javascript:followTeacher(1);'>Follow</a>");
                    $("#follow").html("<a class='question-report' href='javascript:followTeacher(${userProfile.id});' style='margin-right: 20px;'>Follow</a>");
                }else{
                    $.growl.notice({
                        message: '<div class="activity-item"> <i class="fa fa-heart text-success"></i> <div class="activity"> Error! Please try again late! </div> </div>',
                        location: "tr"
                    });
                }

            }
        });
    }

    //Load more - MinhKH
    var lastJoinedClassroomId = ${lastClassroomId};
    var lastOwnedClassroomId = ${lastClassroomId};
    var lastQuestionId = ${lastQuestionId};
    var lastArticleId = ${lastArticleId};
    $('#loadMoreQuestion').click(function (e) {
        var url = "/profile/question";
        var userProfileId = ${userProfile.id};
        $.ajax({
            type: "POST",
            url: url,
            data: {userProfileId: userProfileId, lastId: lastQuestionId},
            beforeSend: function(){
                $('#loadMoreQuestion').hide();
                $('#loadingQ').show();

            },
            complete: function() {
                $('#loadingQ').hide();
            },
            success: function (data) {
                var questions = new Array();
                questions = data;
                var length = questions.length;
                if (length > 10) {
                    length = questions.length - 1;
                    $('#loadMoreQuestion').show();
                } else {
                    $('#loadMoreQuestion').hide();
                }
                lastQuestionId = questions[length-1].id;
                for (var i = 0; i < length; i++) {
                    var component = '<article class="question question-type-normal">' +
                            '<h2>' +
                            '<a href="/post/view/'+ questions[i].id + '">'+ questions[i].title
                            +'</a>' +
                            '</h2>' +
                            '<div class="question-author">' +
                            '<a href="/profile/view/'+ questions[i].ownerId + '"' +
                            'original-title="'+ questions[i].ownerName +
                            '" class="tooltip-n">' +
                            '<span></span><img alt="" src="' + questions[i].ownerProfileImageURL + '"></a>' +
                            '</div>' +
                            '<div class="question-inner">' +
                            '<div class="clearfix"></div>' +
                            '<div class="question-desc short-text">'+ questions[i].body + '</div>' +
                            '<div class="question-details">' +
                            '<span class="question-answered question-answered-done">';
                    if (questions[i].acceptedAnswerId===1) {
                        component = component + '<i class="icon-ok"></i>Resolved';
                    }
                    component = component + '</span>' +
                            '</div>' +
                            '<span class="question-date"><i ' +
                            'class="icon-time"></i>' + questions[i].lastEditedDate + '</span>' +
                            '<span class="question-category"><a ' +
                            'href="/classroom/' + questions[i].classId + '"><i ' +
                            'class="icon-group"></i>Class: ' + questions[i].className + '</a></span>' +
                            '<span class="question-comment"><a href="#"><i ' +
                            'class="icon-comment"></i>' + questions[i].answerCount +
                            ' Answer(s)</a></span>' +
                            '<span class="question-view"><i class="icon-eye-open"></i>' + questions[i].viewer +
                            ' view(s)</span>' +
                            '<div class="clearfix"></div>' +
                            '</div>' +
                            '</article>';
                    $('#questions').append(component);
                }
                $(".tooltip-n").tipsy({fade:true,gravity:"s"});
                $(".short-text").each(function () {
                    text = $(this).html();
                    if (text.length > 400) {
                        $(this).html(text.substr(0, 400) + '.......');
                    }
                });
            }
        })
    });
    $('#loadMoreArticle').click(function (e) {
        var url = "/profile/article";
        var userProfileId = ${userProfile.id};
        $.ajax({
            type: "POST",
            url: url,
            data: {userProfileId: userProfileId, lastId: lastArticleId},
            beforeSend: function(){
                $('#loadMoreArticle').hide();
                $('#loadingA').show();

            },
            complete: function() {
                $('#loadingA').hide();
            },
            success: function (data) {
                var articles = new Array();
                articles = data;
                var length = articles.length;
                if (length > 10) {
                    length = articles.length - 1;
                    $('#loadMoreArticle').show();
                } else {
                    $('#loadMoreArticle').hide();
                }
                lastArticleId = articles[length-1].id;
                for (var i = 0; i < length; i++) {
                    var component = '<article class="post clearfix">'+
                            '<div class="post-inner">'+
                            '<h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a '+
                            'href="/post/view/'+ articles[i].id +'">'+ articles[i].title +'</a></h2>'+
                            '<div class="post-meta">'+
                            '<span class="meta-author"><i class="icon-user"></i><a href="#">Author: ' +
                            articles[i].ownerName + '</a></span>'+
                            '<span class="meta-date"><i class="icon-time"></i>'+ articles[i].lastEditedDate +'</span>'+
                            '<span class="meta-comment"><i class="icon-comments-alt"></i><a' +
                            ' href="#">' + articles[i].answerCount +
                            ' comment(s)</a></span>'+
                            '<span class="question-category"><a href="/classroom/' + articles[i].classId + '"><i '+
                            'class="icon-group"></i>Class: '+ articles[i].className +'</a></span>'+
                            '</div>'+
                            '<div class="post-content short-text">'+
                            '<p>'+ articles[i].body +'</p>'+
                            '</div>'+
                            '</div>'+
                            '</article>';
                    $('#articles').append(component);
                }
                $(".short-text").each(function () {
                    text = $(this).html();
                    if (text.length > 400) {
                        $(this).html(text.substr(0, 400) + '.......');
                    }
                });
            }
        })
    });
    $('#loadMoreOwnedClassroom').click(function (e) {
        var url = "/profile/ownedClassroom";
        var userProfileId = ${userProfile.id};
        $.ajax({
            type: "POST",
            url: url,
            data: {userProfileId: userProfileId, lastId: lastOwnedClassroomId},
            beforeSend: function(){
                $('#loadMoreOwnedClassroom').hide();
                $('#loadingC').show();

            },
            complete: function() {
                $('#loadingC').hide();
            },
            success: function (data) {
                var ownedClassrooms = new Array();
                ownedClassrooms = data;
                var length = ownedClassrooms.length;
                if (length > 10) {
                    length = ownedClassrooms.length - 1;
                    $('#loadMoreOwnedClassroom').show();
                } else {
                    $('#loadMoreOwnedClassroom').hide();
                }
                lastOwnedClassroomId = ownedClassrooms[length-1].id;
                for (var i = 0; i < length; i++) {
                    var component = '<div class="about-author clearfix" id="classroom'+ ownedClassrooms[i].id +'">'+
                            '<div class="" style="float: left;padding-right: 20px;">'+
                            '<a href="#" original-title="admin" class=""><img alt=""' +
                            ' src="/resource/assets/images/classroom.png"></a>'+
                            '</div>';
                    if (ownedClassrooms[i].status === 1) {
                        component = component +
                                '<div class="author-bio">'+
                                '<h4><a href="/classroom/'+
                                ownedClassrooms[i].id +'">'+ ownedClassrooms[i].classroomName
                                +'</a></h4>'+
                                '<div class="classroomDescription">'+
                                ownedClassrooms[i].classroomDescription +
                                '</div>'+
                                '</div>'+
                                '</div>';
                    } else {
                        component = component +
                                '<div class="author-bio">'+
                                '<h4><a href="/classroom/'+
                                ownedClassrooms[i].id +'">'+ ownedClassrooms[i].classroomName
                                +'</a></h4><div class="closedStatus">'+
                                'This classroom is closed.' +
                                '</div>'+
                                '</div>'+
                                '</div>';
                    }

                    $('#classrooms').append(component);
                }
            }
        })
    });
    $('#loadMoreJoinedClassroom').click(function (e) {
        var url = "/profile/joinedClassroom";
        var userProfileId = ${userProfile.id};
        $.ajax({
            type: "POST",
            url: url,
            data: {userProfileId: userProfileId, lastId: lastJoinedClassroomId},
            beforeSend: function(){
                $('#loadMoreJoinedClassroom').hide();
                $('#loadingC').show();

            },
            complete: function() {
                $('#loadingC').hide();
            },
            success: function (data) {
                var joinedClassrooms = new Array();
                joinedClassrooms = data;
                var length = joinedClassrooms.length;
                if (length > 10) {
                    length = joinedClassrooms.length - 1;
                    $('#loadMoreJoinedClassroom').show();
                } else {
                    $('#loadMoreJoinedClassroom').hide();
                }
                lastJoinedClassroomId = joinedClassrooms[length-1].joinedId;
                for (var i = 0; i < length; i++) {
                    var component = '<div class="about-author clearfix" id="classroom'+ joinedClassrooms[i].id +'">'+
                            '<div class="" style="float: left;padding-right: 20px;">'+
                            '<a href="#" original-title="admin" class=""><img alt=""' +
                            ' src="/resource/assets/images/classroom.png"></a>'+
                            '</div>';
                    if (joinedClassrooms[i].status === 1) {
                        component = component +
                                '<div class="author-bio">'+
                                '<h4><a href="/classroom/'+
                                joinedClassrooms[i].id +'">'+ joinedClassrooms[i].classroomName
                                +'</a></h4>' +
                                '<div class="classroomDescription">'+
                                joinedClassrooms[i].classroomDescription +
                                '</div>'+
                                '</div>'+
                                '</div>';
                    } else {
                        component = component +
                                '<div class="author-bio">'+
                                '<h4><a href="/classroom/'+
                                joinedClassrooms[i].id +'">'+ joinedClassrooms[i].classroomName
                                +'</a></h4><div class="closedStatus">'+
                                'This classroom is closed.' +
                                '</div>'+
                                '</div>'+
                                '</div>';
                    }

                    $('#classrooms').append(component);
                }
            }
        })
    });
</script>

</body>
</html>
