<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: Minh--%>
  <%--Date: 5/26/2015--%>
  <%--Time: 8:06 AM--%>
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

<%--<div class="loader">--%>
    <%--<div class="loader_html"></div>--%>
<%--</div>--%>
<%@include file="css.jsp" %>
<div id="wrap">

<div class="panel-Confirm" id="leave-classroom">
    <h2>Leave classroom</h2>
    <div>
        <p class="panelMessage">Do you want to leave this classroom?</p>
        <p>
            <input type="submit" value="Cancel"  class="button color small cancel panelButton" >
            <input type="submit" value="OK"  class="button color small OK panelButton" style="margin-left: 3%;">
        </p>
        <div class="clearfix"></div>
    </div>
</div>

<%@include file="header.jsp" %>

<div class="breadcrumbs">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>Dashboard</h3>
            </div>
        </div>
        <!-- End row -->
    </section>
    <!-- End container -->
</div>
<!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar">
    <div class="row">
        <div class="col-md-9">
            <div class="clearfix"></div>
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <input type="text" aria-required="true" value="Search in your dashboard"
                           onfocus="if(this.value=='Search in your dashboard')this.value='';"
                           onblur="if(this.value=='')this.value='Search in your dashboard';"
                           style="width: 100%; display: none">
                </div>
                <div class="col-md-3 col-sm-1"></div>
                <div class="col-md-3 col-sm-5" style="padding-left: 65px">
                </div>
            </div>

            <div class="tabs-warp question-tab">
                <ul class="tabs">
                    <li class="tab"><a href="#" class="current">Joined Classrooms</a></li>
                    <li class="tab"><a href="#">Followed Teachers</a></li>
                    <li class="tab"><a href="#">Invitations</a></li>
                </ul>
                <div class="tab-inner-warp">
                    <div class="tab-inner" id="joinedClassrooms">
                        <c:if test="${not empty joinedClassrooms}">
                            <c:if test="${fn:length(joinedClassrooms)>10}">
                                <c:forEach var="joinedClassroom" items="${joinedClassrooms}" end="9">
                                    <div class="about-author clearfix" id="classroom${joinedClassroom.id}">
                                        <div class="" style="float: left;padding-right: 20px;">
                                            <a href="#" original-title="admin" class=""><img alt=""
                                                                                             src="/resource/assets/images/classroom.png"></a>
                                        </div>
                                        <a class="leaveClassroom" onclick="leaveClassroom(this); return false;"
                                           style="float: right; cursor:pointer" id="${joinedClassroom.id}">Leave</a>

                                        <div class="author-bio">
                                            <h4><a href="/classroom/${joinedClassroom.id}">
                                                    ${joinedClassroom.classroomName}
                                            </a>
                                            </h4>
                                            <c:if test="${joinedClassroom.status==0}">
                                                <div class="closedStatus">This classroom is closed.</div>
                                            </c:if>
                                            <c:if test="${joinedClassroom.status==1}">
                                                ${joinedClassroom.classroomDescription}
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${fn:length(joinedClassrooms)<=10}">
                                <c:forEach var="joinedClassroom" items="${joinedClassrooms}">
                                    <div class="about-author clearfix" id="classroom${joinedClassroom.id}">
                                        <div class="" style="float: left;padding-right: 20px;">
                                            <a href="#" original-title="admin" class=""><img alt=""
                                                                                             src="/resource/assets/images/classroom.png"></a>
                                        </div>
                                        <a class="leaveClassroom" onclick="leaveClassroom(this); return false;"
                                           style="float: right; cursor:pointer" id="${joinedClassroom.id}">Leave</a>

                                        <div class="author-bio">
                                            <h4><a href="/classroom/${joinedClassroom.id}">
                                                    ${joinedClassroom.classroomName}
                                                </a>
                                            </h4>
                                            <c:if test="${joinedClassroom.status==0}">
                                                <div class="closedStatus">This classroom is closed.</div>
                                            </c:if>
                                            <c:if test="${joinedClassroom.status==1}">
                                                ${joinedClassroom.classroomDescription}
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:if>
                        <c:if test="${empty joinedClassrooms}">
                            <div class="about-author clearfix" id="noJoinedClassroom">
                                No joined classroom
                            </div>
                        </c:if>
                    </div>
                    <c:if test="${fn:length(joinedClassrooms) > 10}">
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
                                            <a href="#" original-title="admin" class=""><img alt=""
                                                                                             src="/resource/assets/images/invitationToClass.png"></a>
                                        </div>
                                        <a class="ignoreInvitation" style="float: right; cursor:pointer"
                                           onclick="ignoreInvitation(this); return false;"
                                           id="${invitation.id}">Ignore</a>
                                        <a class="confirmInvitation"
                                           style="float: right; margin-right: 15px; cursor: pointer"
                                           onclick="confirmInvitation(this); return false;"
                                           id="${invitation.id}">Confirm</a>
                                        <div class="author-bio">
                                            <h4>
                                                <a href="/classroom/${invitation.classroomId}">${invitation.classroomName}</a>
                                            </h4>
                                            You are invited to join this class by <a
                                                href="/profile/view/${invitation.teacherId}">${invitation.teacherName}</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${fn:length(invitations)<=10}">
                                <c:forEach var="invitation" items="${invitations}" end="9">
                                    <div class="about-author clearfix" id="invitation${invitation.id}">
                                        <div class="" style="float: left;padding-right: 20px;">
                                            <a href="#" original-title="admin" class=""><img alt=""
                                                                                             src="/resource/assets/images/invitationToClass.png"></a>
                                        </div>
                                        <a class="ignoreInvitation" style="float: right; cursor:pointer"
                                           onclick="ignoreInvitation(this); return false;"
                                            id="${invitation.id}">Ignore</a>
                                        <a class="confirmInvitation"
                                           style="float: right; margin-right: 15px; cursor: pointer"
                                           onclick="confirmInvitation(this); return false;"
                                           id="${invitation.id}">Confirm</a>
                                        <div class="author-bio">
                                            <h4>
                                                <a href="/classroom/${invitation.classroomId}">${invitation.classroomName}</a>
                                            </h4>
                                            You are invited to join this class by <a
                                                href="/profile/view/${invitation.teacherId}">${invitation.teacherName}</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:if>
                        <c:if test="${empty invitations}">
                            <div class="about-author clearfix">
                                No invitation
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
            </div>
            <!-- End page-content -->
        </div>
        <!-- End main -->
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
        </aside>
        <!-- End sidebar -->
    </div>
    <!-- End row -->
</section>
<!-- End container -->

<%@include file="footer.jsp" %>
</div>
<!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<%@include file="js.jsp" %>
<c:if test="${sessionScope.user!=null}">
    <script src="/resource/assets/js/notification.js"></script>
</c:if>

<script>
    /*$(document).ready(function () {*/
        var lastFollowedTeacherId = ${lastFollowedTeacherId};
        var lastJoinedClassroomId = ${lastJoinedClassroomId};
        var lastClassroomInvitationId = ${lastClassroomInvitationId};
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
            var url = "dashboard/joinedClassroom/" + lastJoinedClassroomId;
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
                    var joinedClassrooms = new Array();
                    joinedClassrooms = data;
                    if (joinedClassrooms===null || joinedClassrooms===undefined) {
                        window.location.href="/";
                    }
                    var length = joinedClassrooms.length;
                    if (length > 10) {
                        length = joinedClassrooms.length - 1;
                        $('#loadMoreClassroom').show();
                    } else {
                        $('#loadMoreClassroom').hide();
                    }
                    lastJoinedClassroomId = joinedClassrooms[length-1].joinedId;
                    for (var i = 0; i < length; i++) {
                        var component = '<div class="about-author clearfix" id="classroom'+
                                joinedClassrooms[i].id +'">' +
                                '<div class="" style="float: left;padding-right: 20px;">' +
                                '<a href="#" original-title="admin" class=""><img alt="" ' +
                                'src="/resource/assets/images/classroom.png"></a>' +
                                '</div>' +
                                '<a class="leaveClassroom" onclick="leaveClassroom(this); return false;" ' +
                                'style="float: right; cursor:pointer" id="'+ joinedClassrooms[i].id +'">Leave</a>' +
                                '<div class="author-bio">' +
                                '<h4><a href="/classroom/'+ joinedClassrooms[i].id +'">' +
                                joinedClassrooms[i].classroomName +
                                '</a>' +
                                '</h4>';
                                if (joinedClassrooms[i].status == 1) {
                                    component = component +
                                            joinedClassrooms[i].classroomDescription +
                                            '</div>' +
                                            '</div>';
                                } else {
                                    component = component +
                                            '<div class="closedStatus">'+
                                            'This classroom is closed.' +
                                            '</div>'+
                                            '</div>' +
                                            '</div>';
                                }
                        $('#joinedClassrooms').append(component);
                    }
                }
            })
        });
        $('#loadMoreInvitation').click(function (e) {
            var url = "dashboard/classroomInvitation/" + lastClassroomInvitationId;
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
                    lastClassroomInvitationId = invitations[length-1].id;
                    for (var i = 0; i < length; i++) {
                        $('#invitations').append('<div class="about-author clearfix" id=invitation' +
                                invitations[i].id + '>' +
                                '<div class="" style="float: left;padding-right: 20px;">' +
                                '<a href="#" original-title="admin" class=""><img alt="" ' +
                                'src="/resource/assets/images/invitationToClass.png"></a>' +
                                '</div>' +
                                '<a class="ignoreInvitation" style="float: right; cursor:pointer" '+
                                'onclick="ignoreInvitation(this); return false;" id="'+ invitations[i].id +'">Ignore</a>'+
                                '<a class="confirmInvitation" '+
                                'style="float: right; margin-right: 15px; cursor: pointer" '+
                                'onclick="confirmInvitation(this); return false;" id="'+ invitations[i].id
                                +'">Confirm</a>'+
                                '<div class="author-bio">' +
                                '<h4>' +
                                '<a href="/classroom/'+ invitations[i].classroomId +
                                '">' +  invitations[i].classroomName +'</a>' +
                                '</h4>' +
                                'You are invited to join this class by ' +
                                '<a href="/profile/view/'+ invitations[i].teacherId +'">'+ invitations[i].teacherName
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
        var ignoreInvitation = function (e){
            var invitationId = $(e).attr('id');
            $.ajax({
                type: "POST",
                url: "/ignoreInvitation",
                data: "invitationId="+ invitationId,
                success: function (data){
                    if(data === "OK"){
                        var invitation = $('#invitation'+invitationId);
                        var classroomName = invitation.find("h4").find("a").text();
                        var classroomHref = invitation.find("h4").find("a").attr("href");
                        invitation.html('You have ignored the invitation to join <a href="'+
                                classroomHref +'">'+
                                classroomName+'</a>.');
                        invitation.attr("style","background-color: #ffff9e")
                    }
                }
            });
        };
        var confirmInvitation = function (e){
            var invitationId = $(e).attr('id');
            $.ajax({
                type: "POST",
                url: "/confirmInvitation",
                data: "invitationId="+ invitationId,
                success: function (data){
                    if(data !== ""){
                        var invitation = $('#invitation'+invitationId);
                        var classroomName = invitation.find("h4").find("a").text();
                        var classroomHref = invitation.find("h4").find("a").attr("href");
                        var classroomId = classroomHref.split("/")[2];
                        var classroomDescription = data;
                        invitation.html('You have joined <a href="'+
                                classroomHref +'">'+
                                classroomName+'</a>.');
                        invitation.attr("style","background-color: #99ff99")
                        var newJoinedClassroom = '<div class="about-author clearfix" id="classroom'+
                                classroomId +'">' +
                                '<div class="" style="float: left;padding-right: 20px;">' +
                                '<a href="#" original-title="admin" class=""><img alt="" ' +
                                'src="/resource/assets/images/classroom.png"></a>' +
                                '</div>' +
                                '<a class="leaveClassroom" onclick="leaveClassroom(this); return false;" ' +
                                'style="float: right; cursor:pointer" id="'+ classroomId +'">Leave</a>' +
                                '<div class="author-bio">' +
                                '<h4><a href="/classroom/'+ classroomId +'">' +
                                classroomName +
                                '</a>' +
                                '</h4>' +
                                classroomDescription +
                                '</div>' +
                                '</div>';
                        $('#noJoinedClassroom').remove();
                        $('#joinedClassrooms').prepend(newJoinedClassroom);
                    }
                }
            });
        };
        var leaveClassroom = function(e) {
            var classroomId = $(e).attr('id');
            $(".panel-Confirm").animate({"top":"-100%"},10).hide();
            $(".panel-Confirm").show().animate({"top":"34%"},500);
            $(".panel-Confirm").attr("id",classroomId);
            $("body").prepend("<div class='wrap-pop'></div>");
            wrap_pop();

        };
        $('.panelButton').click(function(e) {
            var classroomId = $(".panel-Confirm").attr("id");
            if ($(e.currentTarget).hasClass('OK')) {
                $.ajax({
                    type: "POST",
                    url: "/leaveClassroom",
                    data: 'classroomId=' + classroomId,
                    success: function (data) {
                        if(data != "NG" ){
                            var classroom = $('#classroom'+classroomId);
                            var classroomName = classroom.find("h4").find("a").text();
                            var classroomHref = classroom.find("h4").find("a").attr("href");
                            classroom.html('You have left classroom <a href="'+
                                    classroomHref +'">'+
                                    classroomName+'</a>.');
                            classroom.attr("style","background-color: #ffff9e")
                        } else {
                            console.log("Error");
                        }
                    }
                });
                $(".panel-Confirm").animate({"top":"-100%"},500);
                $(".wrap-pop").remove();
            } else {
                $(".panel-Confirm").animate({"top":"-100%"},500);
                $(".wrap-pop").remove();
            }
        });
        function wrap_pop() {
            $(".wrap-pop").click(function () {
                $(".panel-Confirm").animate({"top":"-100%"},500).hide(function () {
                    $(this).animate({"top":"-100%"},500);
                });
                $(this).remove();
            });
        }
    /*});*/
</script>
<!-- End js -->

</body>
</html>