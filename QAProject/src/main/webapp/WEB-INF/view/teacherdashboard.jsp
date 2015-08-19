<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: Minh--%>
  <%--Date: 5/26/2015--%>
  <%--Time: 8:34 AM--%>
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

    <%--<!-- Favicons -->--%>
    <%--<link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">--%>

<%--</head>--%>

<%--<body>--%>

<%--<div class="loader"><div class="loader_html"></div></div>--%>
<%@include file="css.jsp" %>
<div id="wrap">

<div class="panel-pop" id="signup">
    <h2>Register Now<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <form>
            <div class="form-inputs clearfix">
                <p>
                    <label class="required">Username<span>*</span></label>
                    <input type="text">
                </p>
                <p>
                    <label class="required">E-Mail<span>*</span></label>
                    <input type="email">
                </p>
                <p>
                    <label class="required">Password<span>*</span></label>
                    <input type="password" value="">
                </p>
                <p>
                    <label class="required">Confirm Password<span>*</span></label>
                    <input type="password" value="">
                </p>
            </div>
            <p class="form-submit">
                <input type="submit" value="Signup" class="button color small submit">
            </p>
        </form>
    </div>
</div><!-- End signup -->

<div class="panel-pop" id="lost-password">
    <h2>Lost Password<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <p>Lost your password? Please enter your username and email address. You will receive a link to create a new password via email.</p>
        <form>
            <div class="form-inputs clearfix">
                <p>
                    <label class="required">Username<span>*</span></label>
                    <input type="text">
                </p>
                <p>
                    <label class="required">E-Mail<span>*</span></label>
                    <input type="email">
                </p>
            </div>
            <p class="form-submit">
                <input type="submit" value="Reset" class="button color small submit">
            </p>
        </form>
        <div class="clearfix"></div>
    </div>
</div><!-- End lost-password -->


<%@include file="header.jsp" %>

<div class="breadcrumbs">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>Dashboard</h3>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar">
<div class="row">
<div class="col-md-9">
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-6 col-sm-6">
        <input type="text" aria-required="true" value="Search in your dashboard" onfocus="if(this.value=='Search in your dashboard')this.value='';"
               onblur="if(this.value=='')this.value='Search in your dashboard';" style="width: 100%; display: none">
    </div>
    <div class="col-md-6 col-sm-6">
            <a href="/createClass" class="button medium green-button" style="float: right"><i class="icon-group"></i> Create class</a>
    </div>
</div>

<div class="tabs-warp question-tab">
<ul class="tabs">
    <li class="tab"><a href="#" class="current">Your Classrooms</a></li>
    <li class="tab"><a href="#">Followed Teachers</a></li>
    <li class="tab"><a href="#">Invitations</a></li>
</ul>
<div class="tab-inner-warp">
        <div class="tab-inner" id="ownedClassrooms">
            <c:if test="${not empty ownedClassrooms}">
                <c:if test="${fn:length(ownedClassrooms)>10}">
                    <c:forEach var="ownedClassroom" items="${ownedClassrooms}" end="9">
                        <div class="about-author clearfix" id="classroom${ownedClassroom.id}">
                            <div class="" style="float: left;padding-right: 20px;">
                                <a href="#" original-title="admin" class=""><img alt="" src="/resource/assets/images/classroom.png"></a>
                            </div>
                            <c:if test="${ownedClassroom.status == 1}">
                            <a id="${ownedClassroom.id}" class="closeClass" style="float: right; cursor: pointer"
                               onclick="closeClass(this); return false;">
                                Close class</a>
                            <div class="author-bio">
                                <h4><a href="/classroom/${ownedClassroom.id}">${ownedClassroom.classroomName}</a></h4>
                                <div class="closedStatus" style="display: none">This classroom is closed.</div>
                                <div class="classroomDescription">${ownedClassroom.classroomDescription}</div>
                            </div>
                            </c:if>
                            <c:if test="${ownedClassroom.status == 0}">
                                <a id="${ownedClassroom.id}" class="openClass" style="float: right; cursor: pointer"
                                   onclick="openClass(this); return false;">
                                    Open class</a>
                                <div class="author-bio">
                                    <h4><a href="/classroom/${ownedClassroom.id}">${ownedClassroom.classroomName}</a></h4>
                                    <div class="closedStatus">This classroom is closed.</div>
                                    <div class="classroomDescription"style="display:none">
                                        ${ownedClassroom.classroomDescription}
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(ownedClassrooms)<=10}">
                    <c:forEach var="ownedClassroom" items="${ownedClassrooms}">
                        <div class="about-author clearfix" id="classroom${ownedClassroom.id}">
                            <div class="" style="float: left;padding-right: 20px;">
                                <a href="#" original-title="admin" class=""><img alt="" src="/resource/assets/images/classroom.png"></a>
                            </div>
                            <c:if test="${ownedClassroom.status == 1}">
                                <a id="${ownedClassroom.id}" class="closeClass" style="float: right; cursor: pointer"
                                   onclick="closeClass(this); return false;">
                                    Close class</a>
                                <div class="author-bio">
                                    <h4><a href="/classroom/${ownedClassroom.id}">${ownedClassroom.classroomName}</a></h4>
                                    <div class="closedStatus" style="display: none">This classroom is closed.</div>
                                    <div class="classroomDescription">${ownedClassroom.classroomDescription}</div>
                                </div>
                            </c:if>
                            <c:if test="${ownedClassroom.status == 0}">
                                <a id="${ownedClassroom.id}" class="openClass" style="float: right; cursor: pointer"
                                   onclick="openClass(this); return false;">
                                    Open class</a>
                                <div class="author-bio">
                                    <h4><a href="/classroom/${ownedClassroom.id}">${ownedClassroom.classroomName}</a></h4>
                                    <div class="closedStatus">This classroom is closed.</div>
                                    <div class="classroomDescription"style="display:none">
                                            ${ownedClassroom.classroomDescription}
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${empty ownedClassrooms}">
                <div class="about-author clearfix">
                    No classroom.
                </div>
            </c:if>
        </div>
        <c:if test="${fn:length(ownedClassrooms) > 10}">
            <div id="loadingC"
                 style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
            <div><a class="post-read-more button color small" style="margin-bottom: 20px;"
                    id="loadMoreClassroom">Load more</a></div>
        </c:if>
    </div>
    <div class="tab-inner-warp">
        <div class="tab-inner" id="followedTeachers">
            <c:if test="${not empty followedTeachers}">
                <c:if test="${fn:length(followedTeachers)>10}">
                    <c:forEach var="followedTeacher" items="${followedTeachers}" end="9">
                        <div class="about-author clearfix" id="teacher${followedTeacher.teacherId}">
                            <div class="author-image">
                                <a href="/profile/view/${followedTeacher.teacherId}"
                                   original-title="${followedTeacher.teacherName}" class="tooltip-n"><img alt=""
                                   src="${followedTeacher.profileImageURL}"></a>
                            </div>
                            <a id="${followedTeacher.teacherId}" class="unFollow"
                               style="float: right; cursor: pointer" onclick="unFollow(this);return false;">Unfollow</a>

                            <div class="author-bio">
                                <h4><a href="/profile/view/${followedTeacher.teacherId}">${followedTeacher.teacherName}</a></h4>
                                <c:if test="${empty followedTeacher.aboutTeacher}">
                                    ${followedTeacher.teacherName} has not introduced about himself or herself yet.
                                </c:if>
                                ${followedTeacher.aboutTeacher}
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(followedTeachers) <= 10}">
                    <c:forEach var="followedTeacher" items="${followedTeachers}">
                        <div class="about-author clearfix" id="teacher${followedTeacher.teacherId}">
                            <div class="author-image">
                                <a href="/profile/view/${followedTeacher.teacherId}"
                                   original-title="${followedTeacher.teacherName}" class="tooltip-n"><img alt=""
                                  src="${followedTeacher.profileImageURL}"></a>
                            </div>
                            <a id="${followedTeacher.teacherId}" class="unFollow"
                               style="float: right; cursor: pointer" onclick="unFollow(this);return false;">Unfollow</a>

                            <div class="author-bio">
                                <h4><a href="/profile/view/${followedTeacher.teacherId}">${followedTeacher.teacherName}</a></h4>
                                <c:if test="${empty followedTeacher.aboutTeacher}">
                                    ${followedTeacher.teacherName} has not introduced about himself or herself yet.
                                </c:if>
                                ${followedTeacher.aboutTeacher}
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${empty followedTeachers}">
                <div class="about-author clearfix">
                    No followed teacher.
                </div>
            </c:if>
        </div>
        <c:if test="${fn:length(followedTeachers) > 10}">
            <div id="loadingT"
                 style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
            <div><a class="post-read-more button color small" style="margin-bottom: 20px;"
                    id="loadMoreTeacher">Load more</a></div>
        </c:if>
    </div>
<div class="tab-inner-warp">
        <div class="tab-inner" id="invitations">
            <c:if test="${not empty invitations}">
                <c:if test="${fn:length(invitations)>10}">
                    <c:forEach var="invitation" items="${invitations}" end="9">
                        <div class="about-author clearfix" id="invitation${invitation.id}">
                            <div class="" style="float: left;padding-right: 20px;">
                                <a href="#" original-title="admin"
                                   class=""><img alt="" src="/resource/assets/images/invitationToPost.png"></a>
                            </div>
                            <a id="${invitation.id}" class="removeInvitation" style="float: right; cursor:pointer"
                                   onclick="removeInvitation(this);return false" >Remove</a>
                            <div class="author-bio">
                                <h4><a href="/post/view/${invitation.postId}">${invitation.postTitle}</a></h4>
                                You are invited to answer this question in <a
                                    href="/classroom/${invitation.classroomId}">${invitation.classroomName}</a> by <a
                                    href="/profile/view/${invitation.teacherId}">${invitation.teacherName}</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(invitations)<=10}">
                    <c:forEach var="invitation" items="${invitations}">
                        <div class="about-author clearfix" id="invitation${invitation.id}">
                            <div class="" style="float: left;padding-right: 20px;">
                                <a href="#" original-title="admin" class=""><img alt="" src="/resource/assets/images/invitationToPost.png"></a>
                            </div>
                            <a id="${invitation.id}" class="removeInvitation" style="float: right; cursor:pointer"
                               onclick="removeInvitation(this);return false" >Remove</a>
                            <div class="author-bio">
                                <h4><a href="/post/view/${invitation.postId}">${invitation.postTitle}</a></h4>
                                You are invited to answer this question in <a
                                    href="/classroom/${invitation.classroomId}">${invitation.classroomName}</a> by <a
                                    href="/profile/view/${invitation.teacherId}">${invitation.teacherName}</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${empty invitations}">
                <div class="about-author clearfix">
                    No invitation.
                </div>
            </c:if>
        </div>
        <c:if test="${fn:length(invitations) > 10}">
            <div id="loadingI"
                 style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
            <div><a class="post-read-more button color small" style="margin-bottom: 20px;"
                    id="loadMoreInvitation">Load more</a></div>
        </c:if>
    </div>
</div><!-- End page-content -->
</div><!-- End main -->
<aside class="col-md-3 sidebar">
    <div class="widget widget_highest_points">
        <h3 class="widget_title">Hi, ${sessionScope.user.displayName}</h3>
        <ul>
            <li>
                <div class="author-img">
                    <a href="/profile/view/${sessionScope.user.id}"><img width="60" height="60"
                                     src="${sessionScope.user.profileImageURL}" alt=""></a>
                </div>
                <h6><a href="/profile/update">Edit profile</a></h6>
            </li>
        </ul>
    </div>



    <div class="widget widget_tag_cloud">
        <h3 class="widget_title">
            Your Tags
            <c:if test="${empty sessionScope.user.tagUserList}">
                <a href="/profile/update#yourtag" style="float: right;">Edit tag</a>
            </c:if>
        </h3>
        <c:if test="${not empty sessionScope.user.tagUserList}">
            <c:forEach var="tag" items="${sessionScope.user.tagUserList}">
                <a href="#">${tag.tagId.tagName}</a>
            </c:forEach>
        </c:if>
        <c:if test="${empty sessionScope.user.tagUserList}">
            Provide your favourite tags now to get more interest news.
        </c:if>
    </div>

</aside><!-- End sidebar -->
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
<script>
    /*$(document).ready(function () {*/
        var lastFollowedTeacherId = ${lastFollowedTeacherId};
        var lastOwnedClassroomId = ${lastOwnedClassroomId};
        var lastPostInvitationId = ${lastPostInvitationId};
        $('#loadMoreTeacher').click(function (e) {
            var url = "dashboard/followedTeacher/" + lastFollowedTeacherId;
            $.ajax({
                type: "GET",
                url: url,
                beforeSend: function(){
                    $('#loadMoreTeacher').hide();
                    $('#loadingT').show();

                },
                complete: function() {
                    $('#loadingT').hide();
                },
                success: function (data) {
                    var followedTeachers = new Array();
                    followedTeachers = data;
                    var length = followedTeachers.length;
                    if (length > 10) {
                        length = followedTeachers.length - 1;
                        $('#loadMoreTeacher').show();
                    } else {
                        $('#loadMoreTeacher').hide();
                    }
                    lastFollowedTeacherId = followedTeachers[length-1].id;
                    for (var i = 0; i < length; i++) {
                        var component = '<div class="about-author clearfix" id="teacher'+
                                followedTeachers[i].teacherId +
                                '"> <div class="author-image"> <a href="/profile/view/' +
                                '' + followedTeachers[i].teacherId +
                                '" original-title="' + followedTeachers[i].teacherName +
                                '" class="tooltip-n"><img alt="" ' +
                                'src="'+  followedTeachers[i].profileImageURL +'"></a> </div>' +
                                ' <a id="'+
                                followedTeachers[i].teacherId +
                                '" class="unFollow" style="float: right; cursor: pointer" ' +
                                'onclick="unFollow(this);return false;">Unfollow</a>' +
                                ' <div class="author-bio"> <h4><a href="/profile/view/' +
                                + followedTeachers[i].teacherId + '">' +
                                followedTeachers[i].teacherName +
                                '</a></h4> ' + followedTeachers[i].aboutTeacher
                        if (followedTeachers[i].aboutTeacher===undefined || followedTeachers[i].aboutTeacher===""){
                            component = component + followedTeachers[i].teacherName
                                    + ' has not introduced about himself or herself yet.'
                        }
                        component = component + ' </div> </div>';
                        $('#followedTeachers').append(component);
                        $(".tooltip-n").tipsy({fade:true,gravity:"s"});
                    }
                }
            })
        });
        $('#loadMoreClassroom').click(function (e) {
            var url = "dashboard/ownedClassroom/" + lastOwnedClassroomId;
            $.ajax({
                type: "GET",
                url: url,
                beforeSend: function(){
                    $('#loadMoreClassroom').hide();
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
                        $('#loadMoreClassroom').show();
                    } else {
                        $('#loadMoreClassroom').hide();
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
                                    '<a id="' + ownedClassrooms[i].id +
                                    '" class="closeClass" style="float: right; cursor:pointer" onclick="closeClass(this); return false;">Close class</a>'+
                                    '<div class="author-bio">'+
                                    '<h4><a href="/classroom/'+
                                    ownedClassrooms[i].id +'">'+ ownedClassrooms[i].classroomName
                                    +'</a></h4><div class="closedStatus" style="display: none">'+
                                    'This classroom is closed.' +
                                    '</div>'+
                                    '<div class="classroomDescription">'+
                                    ownedClassrooms[i].classroomDescription +
                                    '</div>'+
                                    '</div>'+
                                    '</div>';
                        } else {
                            component = component +
                                    '<a id="' + ownedClassrooms[i].id +
                                    '" class="openClass" style="float: right; cursor:pointer" onclick="openClass(this); return false;">Open class</a>'+
                                    '<div class="author-bio">'+
                                    '<h4><a href="/classroom/'+
                                    ownedClassrooms[i].id +'">'+ ownedClassrooms[i].classroomName
                                    +'</a></h4><div class="closedStatus">'+
                                    'This classroom is closed.' +
                                    '</div>'+
                                    '<div class="classroomDescription" style="display: none">'+
                                    ownedClassrooms[i].classroomDescription +
                                    '</div>'+
                                    '</div>'+
                                    '</div>';
                        }

                        $('#ownedClassrooms').append(component);
                    }
                }
            })
        });
        $('#loadMoreInvitation').click(function (e) {
            var url = "dashboard/postInvitation/" + lastPostInvitationId;
            $.ajax({
                type: "GET",
                url: url,
                beforeSend: function(){
                    $('#loadMoreInvitation').hide();
                    $('#loadingI').show();

                },
                complete: function() {
                    $('#loadingI').hide();
                },
                success: function (data) {
                    var invitations = new Array();
                    invitations = data;
                    var length = invitations.length;
                    if (length > 10) {
                        length = invitations.length - 1;
                        $('#loadMoreInvitation').show();
                    } else {
                        $('#loadMoreInvitation').hide();
                    }
                    lastPostInvitationId = invitations[length-1].id;
                    for (var i = 0; i < length; i++) {
                        $('#invitations').append('<div class="about-author clearfix" id="invitation'+ invitations[i].id +'">' +
                                '<div class="" style="float: left;padding-right: 20px;">' +
                                '<a href="#" original-title="admin" class=""><img alt="" ' +
                                ' src="/resource/assets/images/invitationToPost.png"></a>' +
                                '</div>' +
                                '<a id="'+ invitations[i].id +'" ' +
                                'class="removeInvitation" style="float: right; cursor:pointer" ' +
                                'onclick="removeInvitation(this);return false" >Remove</a>' +
                                '<div class="author-bio">' +
                                '<h4><a href="/post/view/'+ invitations[i].postId
                                +'">' + invitations[i].postTitle + '</a></h4>' +
                                'You are invited to answer this question in <a ' +
                                'href="/classroom/'+ invitations[i].classroomId
                                +'">' + invitations[i].classroomName + '</a> by <a ' +
                                'href="/profile/view/'+ invitations[i].teacherId + '">' +  invitations[i].teacherName
                                +'</a>' +
                                '</div>' +
                                '</div>');
                    }
                }
            })
        });
        var unFollow = function (e) {
            var teacherId = $(e).attr('id');
            $.ajax({
                type: "POST",
                url: "/unfollowTeacher/",
                data: "teacherId="+ teacherId,
                success: function (data){
                    if(data === "OK"){
                        var followedTeacher = $('#teacher'+teacherId);
                        var teacherName = followedTeacher.find("h4").find("a").text();
                        followedTeacher.html('You have unfollowed <a href="/profile/view/'+ teacherId +'">'+
                                teacherName+'</a>.');
                        followedTeacher.attr("style","background-color: #ffff9e")
                    }
                }
            });
        };
        var removeInvitation = function (e) {
            var invitationId = $(e).attr('id');
            $.ajax({
                type: "POST",
                url: "/removeInvitation",
                data: 'invitationId=' + invitationId,
                success: function (data){
                    if(data === "OK"){
                        var invitation = $('#invitation'+invitationId);
                        var questionHref = invitation.find("h4").find("a").attr("href");
                        var questionTitle = invitation.find("h4").find("a").text();
                        invitation.html('You have denied answering <a href="'+ questionHref +'">'+
                                questionTitle+'</a>.');
                        invitation.attr("style","background-color: #ffff9e")
                    }
                }
            });
        };
        var openClass = function (e){
            var classroomId = $(e).attr('id');
            $.ajax({
                type: "POST",
                url: "/openCloseClass",
                data: "classId="+classroomId +"&type=1",
                success: function (data){
                    if(data.status === "OK"){
                        var classroom = $('#classroom'+classroomId);
                        var classroomDescription = classroom.find("div.classroomDescription");
                        classroomDescription.removeAttr("style");
                        var closedStatus = classroom.find("div.closedStatus");
                        closedStatus.attr("style", "display:none");
                        $(e).attr("class","closeClass");
                        $(e).attr("onclick","closeClass(this); return false;");
                        $(e).html("Close class");
                    }
                }
            });
        };
    var closeClass = function (e){
        var classroomId = $(e).attr('id');
        $.ajax({
            type: "POST",
            url: "/openCloseClass",
            data: "classId="+classroomId +"&type=0",
            success: function (data){
                if(data.status === "OK"){
                    var classroom = $('#classroom'+classroomId);
                    var classroomDescription = classroom.find("div.classroomDescription");
                    classroomDescription.attr("style", "display:none");
                    var closedStatus = classroom.find("div.closedStatus");
                    closedStatus.removeAttr("style");
                    $(e).attr("class","openClass");
                    $(e).attr("onclick","openClass(this); return false;");
                    $(e).html("Open class");
                }
            }
        });
    }
   /* })*/

</script>
<!-- End js -->

</body>
</html>