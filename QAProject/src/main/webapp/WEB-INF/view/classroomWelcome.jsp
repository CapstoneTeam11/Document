<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: Minh--%>
  <%--Date: 6/9/2015--%>
  <%--Time: 4:25 PM--%>
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

    <%--<!-- Notification Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/notification.css">--%>
    <%--<!-- Left Notification style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/jquery.growl.css"/>--%>
    <%--<!-- Favicons -->--%>
    <%--<link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">--%>
    <%--<!-- Toast message Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/jquery.toastmessage.css">--%>
    <%--<!--TagInput-->--%>
    <%--<link rel="stylesheet" href="/resource/assets/js/bootstrap-tagsinput.css">--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/tag.css">--%>
<%--</head>--%>

<%--<body>--%>

<%--<div class="loader"><div class="loader_html"></div></div>--%>
<%@include file="css.jsp" %>
<div id="wrap">
<div class="panel-Confirm remove-Student">
    <h2>Remove student</h2>
    <div>
        <p class="panelMessage">Do you want to remove this student?</p>
        <p>
            <input type="submit" value="Cancel"  class="button color small cancel panelButton" >
            <input type="submit" value="OK"  class="button color small OK panelButton" style="margin-left: 3%;">
        </p>
        <div class="clearfix"></div>
    </div>
</div>
<div class="panel-Confirm leave-Classroom">
    <h2>Leave Classroom</h2>
    <div>
        <p class="panelMessage">Do you want to leave this classroom?</p>
        <p>
            <input type="submit" value="Cancel"  class="button color small cancel panelLeaveButton" >
            <input type="submit" value="OK"  class="button color small OK panelLeaveButton" style="margin-left: 3%;">
        </p>
        <div class="clearfix"></div>
    </div>
</div>
<div class="panel-pop" id="addMaterial">
    <h2>Upload Material<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <form method="post" action="/upload" enctype="multipart/form-data">
            <div style="display: flex;height: 42px;">
                <p style="width: 18% !important;">
                    <label class="required">Tag<span>*</span></label>
                </p>
                <div style="width: 82%">
                    <input type="text" class="input" name="tag" id="tagsuggest"/>
                </div>
                <div id="hiddenTag"></div>
            </div>
            <div class="form-inputs clearfix">
                <p>
                    <input type="file" name="fileUpload" size="50">
                </p>
            </div>
            <p class="form-submit">
                <c:if test="${classroom.status == 1}">
                    <input type="submit" value="Upload" class="button color small submit">
                </c:if>
                <input type="hidden" name="classId" value="${classroom.id}">
            </p>
        </form>
        <div class="clearfix"></div>
    </div>
</div><!-- End upload material -->

<div class="panel-pop" id="add-to-folder">
    <h2>Add to folder<i class="icon-remove"></i></h2>
    <div style="height: auto; max-height: 300px; overflow-x: hidden;" id="folderList">
        <c:forEach var="folder" items="${user.folderList}">
            <a href="/library/add/${folder.id}/" class="list-group-item">
                <h4 class="list-group-item-heading">${folder.name} </h4>
            </a>
        </c:forEach>
    </div>
</div><!-- End add to folder -->



<%@include file="header.jsp" %>

<div class="breadcrumbs" style="margin-top: 86px">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>${classroom.classroomName}</h3>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar">
<div class="row">
<div class="col-md-9">
        <div class="clearfix"></div>
        <div class="page-content page-shortcode">
            <div class="row" style="margin-top: 65px; margin-bottom: 65px">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <a href="/post/create/${classroom.id}">
                        <div class="page-content page-shortcode">
                            <div class="box_icon">
                                <span class="t_center icon_i"><span class="icon_circle" icon_size="50" span_bg="#1abc9c" span_hover="#34495e" style="height: 50px; width: 50px; font-size: 25px; line-height: 50px; background-color: rgb(52, 73, 94);"><i class="icon-pencil"></i></span></span>
                                <div class="t_center">
                                    <h3>Create your first post</h3>
                                    <p>This class haven't had any post yet. Create first post now.</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div><!-- End page-content -->
    </div><!-- End main -->
<aside class="col-md-3 sidebar">
    <div class="widget">
        <h3 class="widget_title">About class</h3>
        <ul class="related-posts">
            <li class="related-item">
                <p>${classroom.classroomDescription}</p>
                <div class="clear"></div>
            </li>
        </ul>
        <c:if test="${user.roleId.id==1}">
            <c:if test="${classroom.status == 1}">
                <c:if test="${empty checkClassroomUser || checkClassroomUser.approval == 2}">
                    <p id="link-btn">
                        <a class="button small color" onclick="joinClassroom(this); return false;">
                            Join
                        </a>
                    </p>
                </c:if>
                <c:if test="${checkClassroomUser.approval == 0 && checkClassroomUser.type == 1}">
                    <a href="#" class="button small color">Request Sent</a>
                    <%--<a href="javascript:handleClass('${classroom.id}', 1)" class="button small color" id="join">Cancel Request</a>--%>
                </c:if>
                <c:if test="${checkClassroomUser.approval == 0 && checkClassroomUser.type == 2}">
                    <p id="link-btn">
                        <a class="button small color" onclick="acceptInvitation(this); return false;">
                            Accept Invitation
                        </a>
                    </p>
                </c:if>
                <c:if test="${checkClassroomUser.approval == 1}">
                    <p id="link-btn">
                        <a class="button small color" onclick="leaveClassroom(this); return false;">
                            Leave
                        </a>
                    </p>
                </c:if>
            </c:if>
        </c:if>
    </div>
    <c:if test="${user.roleId.id==2}">
        <c:if test="${classroom.status == 1}">
            <div class="widget widget_login" style="  min-height: 130px;">
                <h3 class="widget_title">Invite student</h3>
                <div class="pull-right" style="width: 100%;">
                    <a href="#" id="create-folder-click" class="button medium color" style="width: 100%;text-align: center;"><i class="icon-plus-sign"></i> Invite</a>
                </div>
            </div>
        </c:if>
    </c:if>
    <div class="widget widget_highest_points">
        <h3 class="widget_title">Classroom Owner</h3>
        <ul>
            <li>
                <div class="author-img">
                    <a href="/profile/view${classroom.ownerUserId.id}"><img width="60" height="60" src="${classroom.ownerUserId.profileImageURL}" alt=""></a>
                </div>
                <h6><a href="/profile/view${classroom.ownerUserId.id}">${classroom.ownerUserId.displayName}</a></h6>
                <span class="comment">${classroom.ownerUserId.aboutMe}</span>
            </li>
        </ul>
    </div>

</aside><!-- End sidebar -->
</div><!-- End row -->
</section><!-- End container -->

<%@include file="footer.jsp" %>
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>
<div class="panel-pop" id="create-folder">
    <h2>Invite student join to class<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <form method="post" action="/folder/create">
            <div class="form-inputs clearfix">
                <div style="display: flex;height: 42px;">
                    <p style="width: 18% !important;">
                        <label class="required">Student<span>*</span></label>
                    </p>
                    <div style="width: 82%">
                        <input type="text" class="input" name="tag" id="tagsuggest1"/>
                    </div>
                    <div id="hiddenTag1"></div>
                </div>
            </div>
            <p class="form-submit">
                <a href="javascript:inviteStudent(${classroom.id})" class="button color small submit" style="width: 100%;text-align: center;">Invite</a>
            </p>
        </form>
        <div class="clearfix"></div>
    </div>
</div><!-- End create folder -->
<!-- js -->
<%@include file="js.jsp" %>
<c:if test="${user!=null}">
    <script src="/resource/assets/js/notification.js"></script>
</c:if>
<!-- End js -->
<script>

var removeMaterial = function(e) {
    var formDelete = $(e).parents('td').find('form');
    $(formDelete).submit();
    return false;
}
var createTag = function(e){
    var flag = 0;
    for( var i = 0 ; i < elt.tagsinput('items').length ; i ++) {
        if($('.tt-input').val()==elt.tagsinput('items')[i].name) {
            flag = 1;
        }
    }
    if(flag==0) {
        $('#tagsuggest').tagsinput('add', { id: Math.round((Math.random()*10000))*-1, name: $('.tt-input').val() });
        $('.tt-input').val("");
    }
};
var studentNameList = [];
$(document).ready(function () {
    function wrap_pop() {
        $(".wrap-pop").click(function () {
            $(".panel-pop").animate({"top":"-100%"},500).hide(function () {
                $(this).animate({"top":"-100%"},500);
            });
            $(this).remove();
        });
    }
    $("#add-to-folder-click").click(function (e) {
        $(".panel-pop").animate({"top":"-100%"},10).hide();
        $("#add-to-folder").show().animate({"top":"50%"},500);
        $("body").prepend("<div class='wrap-pop'></div>");
        wrap_pop();
        var materialId = $(e.currentTarget).parents('td').find("[name='materialId']").val();
        var listHref = $('#folderList').children();
        for( var i = 0 ; i < listHref.length ; i++) {
            if(listHref[i].hasAttribute('href')) {
                oldHref = listHref[i].href;
                newHref = oldHref + materialId;
                listHref[i].href = newHref;
            }
        }
        return false;
    });
    urlTag = $(location).attr('origin')+"/tag/%QUERY";
    var tag = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: urlTag
        }
    });
    tag.initialize();
    elt = $('#tagsuggest');
    var hiddenTag = $('#hiddenTag');
    elt.tagsinput({
        itemValue: 'id',
        itemText: 'name',
        typeaheadjs: {
            name: 'tag',
            displayKey: 'name',
            source: tag.ttAdapter(),
            templates: {
                empty: [
                    '<div style="display: flex"><span class="unableFind"> unable to find tag</span> <span><a class="button color small" id="createTag" onclick="createTag()" style="margin-left: 5px">Create Now</a></span></div>'
                ].join('\n'),
                suggestion: Handlebars.compile('<div><span style="white-space: nowrap">{{name}}</span></div>')
            }
        }
    });
    elt.on('itemAdded', function (event) {
        var idTag = event.item.id;
        if(idTag < 0) {
            var name = event.item.name;
            hiddenTag.append("<input type='hidden' name='newTag' value='" + name + "' id=tag" + idTag + ">");
        } else {
            hiddenTag.append("<input type='hidden' name='tagId' value='" + idTag + "' id=tag" + idTag + ">");
        }
    });
    elt.on('itemRemoved', function (event) {
        var tagId = "#tag" + event.item.id;
        $(tagId).remove();
    });


    urlFindStudent = $(location).attr('origin')+"/findAllStudentNotInClass/${classroom.id}/%QUERY";
    var student = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: urlFindStudent
        }
    });
    student.initialize();
    var elt1 = $('#tagsuggest1');
    var hiddenTagStudent = $('#hiddenTag1');
    elt1.tagsinput({
        itemValue: 'studentId',
        itemText: 'studentName',
        typeaheadjs: {
            name: 'student',
            displayKey: 'studentName',
            source: student.ttAdapter(),
            templates: {
                empty: [
                    '<div class="empty-message">',
                    'unable to find any student or this student was invited or request to your class',
                    '</div>'
                ].join('\n'),
                suggestion: Handlebars.compile('<div><span><img src="{{studentProfileImageURL}}" class="author-imgTag"></span> <span style="white-space: nowrap">{{studentName}}</span></div>')
            }
        }
    });
    elt1.on('itemAdded', function (event) {
        var studentId = event.item.id;
        hiddenTagStudent.append("<input type='hidden' name='tagId' value=" + studentId + " id=tag" + studentId + ">");
    });
    elt1.on('itemRemoved', function (event) {
        var tagId = "#tag" + event.item.id;
        $(tagId).remove();
    });
    /*short test for list of posts - MinhKH*/
    $(".short-text").each(function () {
        text = $(this).text();
        if (text.length > 400) {
            $(this).html(text.substr(0, 400) + '.......');
        }
    });
});


function inviteStudent(id){
    var url = "/inviteJoinClass/"+id;
    var name = $("#tagsuggest1").val();
    $.ajax({
        type: "POST",
        url: url,
        data: "studentName="+name,
        success: function(data){
            if(data == "OK"){
                $('.panel-pop h2 i').click();
                $('#tagsuggest1').tagsinput('removeAll');
            }else{
                $('.panel-pop h2 i').click();
                $('#tagsuggest1').tagsinput('removeAll');
            }

        }
    });
}
function getStudentList(id){
    var url = "/findAllStudentNotInClass/"+id;
    $.ajax({
        type: "POST",
        url: url,
//            data: "studentName="+name,
        success: function(data, callback){
            if(data != null && data.length >0){
                makeTag(data)
            }else{
                $().toastmessage('showErrorToast', "Get student name fail! Please try again late!");
            }
        }
    });
}
/*function acceptRequest(el, studentId, requestId){
 var url = "/acceptRequest";
 var id = $("#requestId"+requestId).val();
 var ownerClassroomId = $("#ownerClassroomId"+requestId).val();
 var currentClassroomId = $("#currentClassroomId"+requestId).val();
 $.ajax({
 type: "POST",
 url: url,
 data: "requestId="+id+"&ownerClassroomId="+ownerClassroomId+"&currentClassroomId="+currentClassroomId,
 success: function(data){
 if(data != null && data.status == "OK"){
 if(typeof el == 'object'){
 $(el).remove();
 }else{
 $("#"+el).remove();
 }
 reloadStudent(studentId);
 }else if(data != null && data.status == "NG" && data.id == 0){
 window.location.href="/";
 }else if(data != null && data.status == "NG" && data.id != 0){
 window.location.href="/classroom/"+data.id;
 }
 }
 });
 }*/
/*function ignoreRequest(el, requestId){
 var url = "/ignoreRequest";
 var id = $("#requestId"+requestId).val();
 var ownerClassroomId = $("#ownerClassroomId"+requestId).val();
 var currentClassroomId = $("#currentClassroomId"+requestId).val();
 $.ajax({
 type: "POST",
 url: url,
 data: "requestId="+id+"&ownerClassroomId="+ownerClassroomId+"&currentClassroomId="+currentClassroomId,
 success: function(data){
 if(data != null && data.status == "OK"){
 if(typeof el == 'object'){
 $(el).remove();
 }else{
 $("#"+el).remove();
 }

 }else if(data != null && data.status == "NG" && data.id == 0){
 window.location.href="/";
 }else if(data != null && data.status == "NG" && data.id != 0){
 window.location.href="/classroom/"+data.id;
 }
 }
 });
 }*/
/*function reloadStudent(studentId, requestId){
 var url = "/getUserById";
 $.ajax({
 type: "POST",
 url: url,
 data: "id="+studentId,
 success: function(data){
 if(data != null){
 var  html ="<div class='about-author clearfix' id='student"+studentId+"'>"+
 "<div class='author-image'>"+
 "<a href='#' original-title='' class='tooltip-n'><img alt='' src='http://2code.info/demo/html/ask-me/images/demo/admin.jpeg'></a>"+
 "</div><a class='' href='javascript:removeStudent("+ studentId +")' style='float: right'>Remove</a><div class='author-bio' style='margin-top: 25px'>"+
 "<h4><a href='#'>"+data.studentName+"</a></h4></div></div>";
 var location = $("#studentTag").find('.about-author').last();

 $(html).insertAfter(location);
 $("#no-student").remove();
 }else if(data != null && data.status == "NG" && data.id == 0){
 window.location.href="/";
 }else if(data != null && data.status == "NG" && data.id != 0){
 window.location.href="/classroom/"+data.id;
 }
 }
 });
 }*/
/*function removeStudent(studentId){
 var url = "/removeStudent";
 var classId = ${classroom.id};
 var ownerId = ${classroom.ownerUserId.id}
 $.ajax({
 type: "POST",
 url: url,
 data: "studentId="+studentId +"&classId="+classId+"&ownerId="+ownerId,
 success: function(data){
 if(data != null && data.status == "OK"){
 $("#student"+studentId).remove();

 }else if(data != null && data.status == "NG" && data.id == 0){
 window.location.href="/";
 }else if(data != null && data.status == "NG" && data.id != 0){
 window.location.href="/classroom/"+data.id;
 }
 }
 });
 }*/
/* function handleClass(id, type){
 var url = "/handleClass";
 $.ajax({
 type: "POST",
 url: url,
 data: "classId="+id +"&type="+ type,
 success: function(data){
 if(data != null && data.status == "OK"){
 if(type == 3){
 var btn = "<a href='javascript:joinClass(${classroom.id})' class='button small color' id='join'>Join</a>";
 $("#link-btn").html(btn);
 }else if(type==2){
 var btn = "<a href='javascript:handleClass('${classroom.id}', 3)' class='button small color' id='join'>Leave</a>";
 $("#link-btn").html(btn);
 }

 }else if(data != null && data.status == "NG" && data.id == 0){
 window.location.href="/";
 }else if(data != null && data.status == "NG" && data.id != 0){
 window.location.href="/classroom/"+data.id;
 }
 }
 });
 }*/
function closeClass(classId, type) {
    var url = "/openCloseClass";
    $.ajax({
        type: "POST",
        url: url,
        data: "classId=" + classId+"&type="+ type,
        success: function (data) {
            if (data != null && data.status == "OK") {
                <%--var createPost = "<a href='/post/create/${classroom.id}' class='button medium green-button' style='float: right'><i class='icon-pencil'></i> Create post</a>";--%>
                <%--$("#createPost").html(createPost);--%>
                <%----%>
                window.location.href = "/classroom/" + data.id;
            } else if (data != null && data.status == "NG" && data.id == 0) {
                window.location.href = "/";
            } else if (data != null && data.status == "NG" && data.id != 0) {
                window.location.href = "/classroom/" + data.id;
            }
        }
    });
}


//handle accept invitation - leave class - MinhKH
var joinClassroom = function(e){
    var classroomId = ${classroom.id};
    var url = "/requestJoinClass";
    $.ajax({
        type: "POST",
        url: url,
        data: "classroomId="+ classroomId,
        success: function(data){
            if(data == "OK"){
                $("#link-btn").html('<a class="button small color" href="">' +
                        'Request sent' +
                        '</a>');
            }else{
                window.location.href="/";
            }
        }
    });
}
var acceptInvitation = function (e) {
    var classroomId = ${classroom.id};
    $.ajax({
        type: "POST",
        url: "/acceptInvitation",
        data: "classroomId="+ classroomId,
        success: function (data){
            if(data === "OK"){
                $("#link-btn").html('<a class="button small color" onclick="leaveClassroom(this); return false;">' +
                        'Leave' +
                        '</a>');
                $('#createPost').html('<a href="/post/create/'+ classroomId +
                        '" class="button medium green-button" style="float: right">'+
                        '<i class="icon-pencil"></i> Create post</a>');
            }
        }
    });
};
var leaveClassroom = function(e) {
    $(".leave-Classroom").animate({"top":"-100%"},10).hide();
    $(".leave-Classroom").show().animate({"top":"34%"},500);
    $("body").prepend("<div class='wrap-pop'></div>");
    wrap_pop();
};
$('.panelLeaveButton').click(function(e) {
    var classroomId = ${classroom.id};
    if ($(e.currentTarget).hasClass('OK')) {
        $.ajax({
            type: "POST",
            url: "/leaveClassroom",
            data: 'classroomId=' + classroomId,
            success: function (data) {
                if(data != "NG" ){
                    $("#link-btn").html('<a class="button small color" onclick="joinClassroom(this); return false;">' +
                            'Join' +
                            '</a>');
                    $('#createPost').html('');
                } else {
                    console.log("Error");
                }
            }
        });
        $(".leave-Classroom").animate({"top":"-100%"},500);
        $(".wrap-pop").remove();
    } else {
        $(".leave-Classroom").animate({"top":"-100%"},500);
        $(".wrap-pop").remove();
    }
});


//Load more - MinhKH
var lastQuestionId = ${lastQuestionId};
var lastArticleId = ${lastArticleId};
var lastMaterialId = ${lastMaterialId};
var lastRequestId = ${lastRequestId};
var lastClassroomUserId = ${lastClassroomUserId};
var materialCounter = 11;
$('#loadMoreQuestion').click(function (e) {
    var url = "/classroom/question";
    var classroomId = ${classroom.id};
    $.ajax({
        type: "POST",
        url: url,
        data: {classroomId: classroomId, lastId: lastQuestionId},
        beforeSend: function(){
            $('#loadMoreQuestion').hide();
            $('#loading').show();

        },
        complete: function() {
            $('#loading').hide();
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
                if (questions[i].acceptedAnswerId===undefined) {
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
                        '<div class="clearfix"></div>' +
                        '</div>' +
                        '</article>';
                $('#questions').append(component);
                $(".tooltip-n").tipsy({fade:true,gravity:"s"});
            }
        }
    })
});
$('#loadMoreArticle').click(function (e) {
    var url = "/classroom/article";
    var classroomId = ${classroom.id};
    $.ajax({
        type: "POST",
        url: url,
        data: {classroomId: classroomId, lastId: lastArticleId},
        success: function (data) {
            var articles = new Array();
            articles = data;
            var length = articles.length;
            if (length > 10) {
                length = articles.length - 1;
            } else {
                $('#loadMoreArticle').hide();
            }
            lastArticleId= articles[length-1].id;
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
                $(".tooltip-n").tipsy({fade:true,gravity:"s"});
            }
        }
    })
});
$('#loadMoreMaterial').click(function (e) {
    var currentUser = ${user.id};
    var ownedUser = ${classroom.ownerUserId.id};
    var url = "/classroom/material";
    var classroomId = ${classroom.id};
    $.ajax({
        type: "POST",
        url: url,
        data: {classroomId: classroomId, lastId: lastMaterialId},
        success: function (data) {
            var materials = new Array();
            materials = data;
            var length = materials.length;
            if (length > 10) {
                length = materials.length - 1;
            } else {
                $('#loadMoreMaterial').hide();
            }
            lastMaterialId = materials[length-1].id;
            for (var i = 0; i < length; i++) {
                var component = '<tr>' +
                        '<td>'+ materialCounter + '</td>' +
                        '<td>'+ materials[i].name + '</td>' +
                        '<td>'+ materials[i].creationDate + '</td>' +
                        '<td>' + materials[i].size + '</td>' +
                        '<td><a id="add-to-folder-click" href="#">Folder</a> / <a href="/download/'+ materials[i].id +
                        '">Computer</a></td>';
                if (currentUser==ownedUser){
                    component = component +
                            '<td><form action="/material/delete" method="post" style="display: none">' +
                            '<input type="hidden" name="materialId" value="'+ materials[i].id +'"></form>' +
                            '<a href="#" onclick="removeMaterial(this)"><i class="icon-remove"></i> Delete</a></td>';
                }
                component = component + '</tr>';
                $('#materials').append(component);
                materialCounter++;
            }
        }
    })
});
$('#loadMoreRequest').click(function (e) {
    var url = "/classroom/request";
    var classroomId = ${classroom.id};
    var classroomName = "${classroom.classroomName}";
    $.ajax({
        type: "POST",
        url: url,
        data: {classroomId: classroomId, lastId: lastRequestId},
        success: function (data) {
            var requests = new Array();
            requests = data;
            var length = requests.length;
            if (length > 10) {
                length = requests.length - 1;
            } else {
                $('#loadMoreRequest').hide();
            }
            lastRequestId = requests[length-1].id;
            for (var i = 0; i < length; i++) {
                var component = '<div class="about-author clearfix" id="request'+ requests[i].id+'">' +
                        '<div class="author-image">' +
                        '<a href="/profile/view/'+ requests[i].studentId +'" original-title="'
                        + requests[i].studentName +'" ' +
                        'class="tooltip-n"><img alt="" src="'+ requests[i].studentProfileImageURL +'"></a>' +
                        '</div>' +
                        '<a class="ignoreRequest" onclick="ignoreRequest(this); return false;" ' +
                        'style="float: right; cursor: pointer" id="'+ requests[i].id +'">Ignore</a>' +
                        '<a class="confirmRequest" onclick="confirmRequest(this); return false;" ' +
                        'style="float: right; margin-right: 15px; cursor: pointer" id="'+ requests[i].id+
                        '">Confirm</a>' +
                        '<div class="author-bio">' +
                        '<h4><a href="/profile/view/'+ requests[i].studentId +'">'+ requests[i].studentName+'</a></h4>' +
                        'Requested to join <a href="/classroom/'+classroomId+'" style="font-size:' +
                        ' 15px">'+ classroomName+ '</a>' +
                        '</div>' +
                        '</div>';
                $('#requests').append(component);
                $(".tooltip-n").tipsy({fade:true,gravity:"s"});
            }
        }
    })
});
$('#loadMoreStudent').click(function (e) {
    var currentUser = ${user.id};
    var ownedUser = ${classroom.ownerUserId.id};
    var url = "/classroom/student";
    var classroomId = ${classroom.id};
    $.ajax({
        type: "POST",
        url: url,
        data: {classroomId: classroomId, lastId: lastClassroomUserId},
        beforeSend: function(){

            $('#loadMoreStudent').text('Loading...');
        },
        success: function (data) {
            var students = new Array();
            students = data;
            var length = students.length;
            if (length > 10) {
                length = students.length - 1;
            } else {
                $('#loadMoreStudent').hide();
            }
            lastClassroomUserId = students[length-1].classroomUserId;
            for (var i = 0; i < length; i++) {
                var component = '<div class="about-author clearfix" id="student'+ students[i].classroomUserId+'">' +
                        '<div class="author-image">' +
                        '<a href="/profile/view/'+ students[i].studentId+'" original-title="'+
                        students[i].studentName +
                        '" class="tooltip-n">' +
                        '<img alt="" src="'+students[i].studentProfileImageURL+'"></a>' +
                        '</div>';
                if (currentUser==ownedUser){
                    component = component +
                            '<a class="removeStudent" id="'+ students[i].classroomUserId+'" ' +
                            'onclick="removeStudent(this); return false;" ' +
                            'style="float: right; cursor:pointer">Remove</a>';
                }
                component = component +
                        '<div class="author-bio" style="margin-top: 25px">' +
                        '<h4><a href="/profile/view/'+ students[i].studentId+'">'+ students[i].studentName+'</a></h4>' +
                        '</div>' +
                        '</div>';
                $('#students').append(component);
                $(".tooltip-n").tipsy({fade:true,gravity:"s"});
            }
        }
    })
});

var ignoreRequest = function (e){
    var requestId = $(e).attr('id');
    $.ajax({
        type: "POST",
        url: "/ignoreRequest",
        data: "requestId="+ requestId,
        success: function (data){
            if(data === "OK"){
                var request = $('#request'+requestId);
                var studentName = request.find("h4").find("a").text();
                var studentHref = request.find("h4").find("a").attr("href");
                request.html('You have ignored the request of <a href="'+
                        studentHref +'">'+
                        studentName+'</a>.');
                request.attr("style","background-color: #ffff9e")
            }
        }
    });
};
var confirmRequest = function (e){
    var requestId = $(e).attr('id');
    $.ajax({
        type: "POST",
        url: "/confirmRequest",
        data: "requestId="+ requestId,
        success: function (data){
            if(data !== undefined){
                var student = data;
                var request = $('#request'+requestId);
                var studentName = request.find("h4").find("a").text();
                var studentHref = request.find("h4").find("a").attr("href");
                request.html('You have confirmed the request of <a href="'+
                        studentHref +'">'+
                        studentName+'</a>.');
                request.attr("style","background-color: #99ff99")
                var newStudent = '<div class="about-author clearfix" id="student'+ student.classroomUserId+'">' +
                        '<div class="author-image">' +
                        '<a href="/profile/view/'+ student.studentId+'" original-title="'+
                        student.studentName +
                        '" class="tooltip-n">' +
                        '<img alt="" src="'+student.studentProfileImageURL+'"></a>' +
                        '</div>' +
                        '<a class="removeStudent" id="'+ student.classroomUserId+'" ' +
                        'onclick="removeStudent(this); return false;" ' +
                        'style="float: right; cursor:pointer">Remove</a>' +
                        '<div class="author-bio" style="margin-top: 25px">' +
                        '<h4><a href="/profile/view/'+ student.studentId+'">'+ student.studentName+'</a></h4>' +
                        '</div>' +
                        '</div>';
                $('#noStudent').remove();
                $('#students').prepend(newStudent);
            }
        }
    });
};
var removeStudent = function(e) {
    var removeId = $(e).attr('id');
    $(".remove-Student").animate({"top":"-100%"},10).hide();
    $(".remove-Student").show().animate({"top":"34%"},500);
    $(".remove-Student").attr('id',removeId);
    $("body").prepend("<div class='wrap-pop'></div>");
    wrap_pop();

};
$('.panelButton').click(function(e) {
    var removeId = $(".remove-Student").attr('id');
    if ($(e.currentTarget).hasClass('OK')) {
        $.ajax({
            type: "POST",
            url: "/removeStudent",
            data: 'removeId=' + removeId,
            success: function (data) {
                if(data != "NG" ){
                    var removeElement = $('#student'+removeId);
                    var studentName = removeElement.find("h4").find("a").text();
                    var studentHref = removeElement.find("h4").find("a").attr("href");
                    removeElement.html('You have removed <a href="'+
                            studentHref +'">'+
                            studentName+'</a> from classroom.');
                    removeElement.attr("style","background-color: #ffff9e")
                } else {
                    console.log("Error");
                }
            }
        });
        $(".remove-Student").animate({"top":"-100%"},500);
        $(".wrap-pop").remove();
    } else {
        $(".remove-Student").animate({"top":"-100%"},500);
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
</script>
</body>
</html>
