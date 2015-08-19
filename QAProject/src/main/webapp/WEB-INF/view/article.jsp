<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: Minh--%>
  <%--Date: 5/25/2015--%>
  <%--Time: 2:34 PM--%>
  <%--To change this template use File | Settings | File Templates. --%>
<%--&ndash;%&gt;--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
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
<div class="panel-Confirm" id="delete-post">
    <h2>Delete Article</h2>
    <div>
        <p class="panelMessage">Do you want delete this article?</p>
        <p>
            <input type="submit" value="Cancel"  class="button color small cancel panelButtonDeletePost" >
            <input type="submit" value="OK"  class="button color small OK panelButtonDeletePost" style="margin-left: 3%;">
        </p>
        <div class="clearfix"></div>
    </div>
</div>
<div class="panel-Confirm" id="delete-comment">
    <h2>Delete Comment</h2>
    <div>
        <p class="panelMessage">Do you want delete this comment?</p>
        <p>
            <input type="submit" value="Cancel"  class="button color small cancel panelButton" >
            <input type="submit" value="OK"  class="button color small OK panelButton" style="margin-left: 3%;">
        </p>
        <div class="clearfix"></div>
    </div>
</div>

<%@include file="header.jsp" %>

<div class="breadcrumbs" style="margin-top: 86px">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3 style="margin-top:15px">${post.title}</h3>
                <h5 style="margin-top: 15px">
                    <a href="/search?filter=4&searchKey=" style="color: white;">Classroom</a> /
                    <a href="/classroom/${post.ownerClassId.id}" style="color: white;">${post.ownerClassId.classroomName}</a> /
                    <a href="/classroom/${post.ownerClassId.id}?tab=article" style="color: white;">Article</a> /
                    <span style="color: #2f3239;">${post.title}</span>
                </h5>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar">
    <div class="row">
        <div class="col-md-9" id="questionMain">
            <article class="question single-question question-type-normal">
                <h2 class="post-title">${post.title}</h2>
                <%--<span class="wantAnswer"><a id="wantNumber">${fn:length(post.wantAnswerPosts)}</a> people likes this</span>--%>
                <%--<c:if test="${wantAnswer!=null && sessionScope.user!=null}">--%>
                    <%--<a class="wantAnswer dontWantanswerId" href="#" style="  right: 163px;font-size: 27px;top: 14px;" id="wantAnswer" ><i class="icon-thumbs-down"></i></a>--%>
                <%--</c:if>--%>
                <%--<input type="hidden" id="wantAnswerId" value="${wantAnswer.id}">--%>
                <%--<c:if test="${wantAnswer==null && sessionScope.user!=null}">--%>
                    <%--<a class="wantAnswer wantAnswerId" href="#" style="  right: 163px;font-size: 27px;top: 14px;" id="wantAnswer" ><i class="icon-thumbs-up"></i></a>--%>
                <%--</c:if>--%>
                <div class="question-inner" id="prvId">
                    <div class="clearfix"></div>
                    <div class="question-desc">
                        <p>${post.body}</p>
                    </div>
                    <span class="question-date"><i class="icon-time"></i>${post.lastEditedDate}</span>
                    <span class="question-category"><a href="/classroom/${post.ownerClassId.id}"><i
                            class="icon-group"></i>Class: ${post.ownerClassId.classroomName}</a></span>
                    <span class="question-category"><a href="/profile/view/${post.ownerClassId.ownerUserId.id}"><i
                            class="icon-user"></i>Teacher: ${post.ownerClassId.ownerUserId.displayName}</a></span>
                    <span class="question-view"><i class="icon-eye-open"></i>${post.viewer} view(s)</span>
                    <span class="question-tags">
                        <form action="/post/deletePost" method="post" id="deletePostForm" hidden="true"><input type="hidden" name="id" value="${post.id}"></form>
                        <c:if test="${sessionScope.user.id==post.ownerUserId.id or sessionScope.user.id==post.ownerClassId.ownerUserId.id || sessionScope.user.roleId.id==3}">
                            <div class="btn-group">
                                <a data-toggle="dropdown" href="" aria-expanded="false"><i class="icon-cog" style="color: black;font-weight: bold;font-size: 20px;"></i><span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu" style="left: -127px;">
                                    <c:if test="${sessionScope.user.id==post.ownerUserId.id && sessionScope.user.roleId.id!=3 && post.status!=0}">
                                        <li><a href="/post/update/${post.id}">Edit</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.user.id==post.ownerUserId.id || sessionScope.user.roleId.id==3}">
                                        <li><a href="#" id="deletePost">Delete</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.user.id==post.ownerClassId.ownerUserId.id || sessionScope.user.roleId.id==3 }">
                                        <c:if test="${post.status!=0}">
                                            <form action="/post/closePost" method="post" id="closeOpenPostForm" hidden="true"><input type="hidden" name="id" value="${post.id}"></form>
                                            <li><a href="#" id="closeOpenPost">Close</a></li>
                                        </c:if>
                                        <c:if test="${post.status==0}">
                                            <form action="/post/openPost" method="post" id="closeOpenPostForm" hidden="true"><input type="hidden" name="id" value="${post.id}"></form>
                                            <li><a href="#" id="closeOpenPost">Open</a></li>
                                        </c:if>
                                    </c:if>
                                </ul>
                            </div>
                        </c:if>
                    </span>
                    <div class="clearfix"></div>
                </div>
            </article>
            <c:if test="${post.isComment==0 and empty postAnswers}">
                <div class="clearfix" style="height: 60px;"></div>
            </c:if>
            <c:if test="${post.isComment==1}">
                <div id="respond" class="comment-respond page-content clearfix">
                    <div class="boxedtitle page-title"><h2>Leave a comment</h2></div>
                    <form action="#" id="commentform" class="comment-form">
                        <div id="form-textarea">
                            <textarea id="question-details" aria-required="true" cols="58" rows="8"></textarea>
                        </div>
                        <p class="form-submit">
                            <input name="submit" type="submit" id="submit" value="Submit your comment"
                                   class="button small color">
                        </p>
                    </form>
                </div>
            </c:if>
            <c:if test="${not empty postAnswers}">
                <div id="commentlist" class="page-content">
                    <div class="boxedtitle page-title"><h2>Comments ( <span class="color">${numberAnswer}</span> )
                    </h2></div>
                    <ol class="commentlist clearfix" id="commentListDetail">
                        <c:if test="${fn:length(postAnswers) > 10}">
                            <c:forEach var="postAnswer" items="${postAnswers}" end="9">
                                <li class="comment">
                                    <div class="comment-body comment-body-answered clearfix">
                                        <div class="avatar"><img alt=""
                                                                 src="${postAnswer.ownerUserId.profileImageURL}">
                                        </div>
                                        <div class="comment-text">
                                            <div class="author clearfix"  style="display: flex">
                                                <div style="width: 30%">
                                                    <div class="comment-author"><a href="/profile/view/${postAnswer.ownerUserId.id}">${postAnswer.ownerUserId.displayName}</a>
                                                    </div>
                                                    <div class="comment-meta">
                                                        <div class="date"><i class="icon-time"></i>${postAnswer.creationDate}</div>
                                                    </div>
                                                </div>
                                                <div class="acceptAnswerIcon" id="answerIcon${postAnswer.id}">
                                                </div>
                                                    <%--Add javascript to chang "<i class="icon-thumbs-up"></i>Accept" to "Unaccept"--%>
                                                <div style="width: 75%;display: flex">
                                                    <div style="width: 100%;float: right;">
                                                        <input type="hidden" name="postAnswerId" value="${postAnswer.id}">
                                                    </div>
                                                    <div style="float: right;margin-left: 2%;">
                                                        <c:if test="${sessionScope.user.id == postAnswer.ownerUserId.id}" >
                                                            <div class="btn-group">
                                                                <a data-toggle="dropdown" href="" aria-expanded="false"><span class="caretBig"></span></a>
                                                                <ul class="actionAnswer dropdown-menu" role="menu" >
                                                                    <li><a href="#" onclick="editAnswer(this);return false;">Edit</a></li>
                                                                    <li><a href="#" onclick="deleteAnswer(this);return false;">Delete</a></li>
                                                                </ul>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${sessionScope.user.roleId.id==3}" >
                                                            <div class="btn-group">
                                                                <a data-toggle="dropdown" href="" aria-expanded="false"><span class="caretBig"></span></a>
                                                                <ul class="actionAnswer dropdown-menu " role="menu" >
                                                                    <li><a onclick="deleteAnswer(this);return false;">Delete</a></li>
                                                                </ul>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="textComment"><p class="textBody">${postAnswer.body}</p></div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${fn:length(postAnswers) <= 10}">
                            <c:forEach var="postAnswer" items="${postAnswers}">
                                <li class="comment">
                                    <div class="comment-body comment-body-answered clearfix">
                                        <div class="avatar"><img alt=""
                                                                 src="${postAnswer.ownerUserId.profileImageURL}">
                                        </div>
                                        <div class="comment-text">
                                            <div class="author clearfix"  style="display: flex">
                                                <div style="width: 30%">
                                                    <div class="comment-author"><a href="/profile/view/${postAnswer.ownerUserId.id}">${postAnswer.ownerUserId.displayName}</a>
                                                    </div>
                                                    <div class="comment-meta">
                                                        <div class="date"><i class="icon-time"></i>${postAnswer.creationDate}</div>
                                                    </div>
                                                </div>
                                                <div class="acceptAnswerIcon" id="answerIcon${postAnswer.id}">

                                                </div>
                                                    <%--Add javascript to chang "<i class="icon-thumbs-up"></i>Accept" to "Unaccept"--%>
                                                <div style="width: 75%;display: flex">
                                                    <div style="width: 100%;float: right;">
                                                        <input type="hidden" name="postAnswerId" value="${postAnswer.id}">
                                                    </div>
                                                    <div style="float: right;margin-left: 2%;">
                                                        <c:if test="${sessionScope.user.id == postAnswer.ownerUserId.id}" >
                                                            <div class="btn-group">
                                                                <a data-toggle="dropdown" href="" aria-expanded="false"><span class="caretBig"></span></a>
                                                                <ul class="actionAnswer dropdown-menu " role="menu" >
                                                                    <li><a href="#" onclick="editAnswer(this);return false;">Edit</a></li>
                                                                    <li><a onclick="deleteAnswer(this);return false;">Delete</a></li>
                                                                </ul>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${sessionScope.user.roleId.id==3}" >
                                                            <div class="btn-group">
                                                                <a data-toggle="dropdown" href="" aria-expanded="false"><span class="caretBig"></span></a>
                                                                <ul class="actionAnswer dropdown-menu " role="menu" >
                                                                    <li><a onclick="deleteAnswer(this);return false;">Delete</a></li>
                                                                </ul>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="textComment"><p class="textBody">${postAnswer.body}</p></div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ol>
                    <!-- End commentlist -->
                </div>
            </c:if>
            <c:if test="${fn:length(postAnswers) > 10}">
                <div><a class="post-read-more button color small" style="margin-bottom: 20px;" id="loadMore">Continue reading</a></div>
            </c:if>


        </div><!-- End main -->
        <aside class="col-md-3 sidebar">

            <div class="widget widget_highest_points">
                <h3 class="widget_title">Article Author</h3>
                <ul>
                    <li>
                        <div class="author-img">
                            <a href="#"><img width="60" height="60" src="${post.ownerUserId.profileImageURL}" alt=""></a>
                        </div>
                        <h6><a href="/profile/view/${post.ownerUserId.id}">${post.ownerUserId.displayName}</a></h6>
                    </li>
                </ul>
            </div>
            <div class="widget widget_tag_cloud">
                <h3 class="widget_title">Article's Tags</h3>
                <c:forEach var="tag" items="${post.tagPostList}">
                    <a href="#">${tag.tagId.tagName}</a>
                </c:forEach>
            </div>
            <c:if test="${not empty relatedArticles}">
                <div class="widget">
                    <h3 class="widget_title">Related Articles</h3>
                    <ul class="related-posts">
                        <c:forEach var="relatedArticle" items="${relatedArticles}">
                            <li class="related-item">
                                <a href="/post/view/${relatedArticle.id}">${relatedArticle.title}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>

            <c:if test="${not empty relatedMaterials}">
                <div class="widget">
                    <h3 class="widget_title">Related Materials</h3>
                    <ul class="related-posts">
                        <c:forEach var="relatedMaterial" items="${relatedMaterials}">
                            <li class="related-item">
                                <a href="/download/${relatedMaterial.id}">${relatedMaterial.name}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>



        </aside><!-- End sidebar -->
    </div><!-- End row -->
</section><!-- End container -->

<%@include file="footer.jsp" %>
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>


<!-- js -->
<%@include file="js.jsp" %>
<script src="/resource/assets/js/js.cookie.js"></script>
<c:if test="${sessionScope.user!=null}">
<script src="/resource/assets/js/notification.js"></script>
</c:if>
<script>
    CKEDITOR.replace('question-details');
</script>
<!-- End js -->
<script>
    function wrap_pop() {
        $(".wrap-pop").click(function () {
            $(".panel-Confirm").animate({"top":"-100%"},500).hide(function () {
                $(this).animate({"top":"-100%"},500);
            });
            $(this).remove();
        });
    }
    var textBody = "";

    var cancelEdit = function(e) {
        var commentEditing = $('#editComment').parents('.comment-text').find('.textComment');
        commentEditing.empty();
        commentEditing.prepend(textBody);
        MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
    }

    var editAnswer = function(e) {
        if(textBody=="") {
            var commentText = $(e).parents('.comment-text').find('.textComment');
            var updateId = $(e).parents('.comment-text').find("[name='postAnswerId']").val();
            var url = "/post/updateAnswer/"+updateId;
            $.ajax({
                type: "GET",
                url: url,
                success: function (data) {
                    if(data != "" ){
                        var editComment = '<textarea id="editComment" aria-required="true" cols="58" rows="8">' + data +'</textarea>' + '<div style="text-align: left;font-size: 12px">Click <a href="#" onclick="cancelEdit(this);return false;">here</a> to cancel</div>'+
                                '<input name="submit" onclick="updateAnswer(this);return false;" value="Update your answer" style="width: 100%;text-align: center"class="button small color">'
                        commentText.empty();
                        commentText.prepend(editComment);
                        CKEDITOR.replace('editComment');
                        textBody = data;
                    } else {
                        console.log("Error");
                    }
                }
            });
            location.href = "#editComment";

        } else {
            var commentEditing = $('#editComment').parents('.comment-text').find('.textComment');
            commentEditing.empty();
            commentEditing.prepend(textBody);
            MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
            var commentText = $(e).parents('.comment-text').find('.textComment');
            var updateId = $(e).parents('.comment-text').find("[name='postAnswerId']").val();
            var url = "/post/updateAnswer/"+updateId;
            $.ajax({
                type: "GET",
                url: url,
                success: function (data) {
                    if(data != "" ){
                        var editComment = '<textarea id="editComment" aria-required="true" cols="58" rows="8">' + data +'</textarea>' + '<div style="text-align: left;font-size: 12px">Click <a href="#" onclick="cancelEdit(this);return false;">here</a> to cancel</div>'+
                                '<input name="submit" onclick="updateAnswer(this);return false;" value="Update your answer" style="width: 100%;text-align: center"class="button small color">'
                        commentText.empty();
                        commentText.prepend(editComment);
                        CKEDITOR.replace('editComment');
                        textBody = data;
                    } else {
                        console.log("Error");
                    }
                }
            });
            location.href = "#editComment";
        }

    }
    var updateAnswer = function(e) {
        var updateId = $(e).parents('.comment-text').find("[name='postAnswerId']").val();
        var updateBody = CKEDITOR.instances['editComment'].getData();
        var url = "/post/updateAnswer"
        var postDto = {'id' : updateId ,'body' : updateBody};
        var textAfterUpdate = '<p>'+ updateBody +'</p>' ;
        $.ajax({
            type: "POST",
            url: url,
            data: postDto,
            success: function (data) {
                if(data != "NG" ){
                    var commentText = $(e).parents('.comment-text').find('.textComment');
                    commentText.empty();
                    commentText.prepend(textAfterUpdate);
                    MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
                    textBody = "";
                } else {
                    console.log("Error");
                }
            }
        });

    }
    var deleteId
    var deleteDiv
    var deleteAnswer = function(e) {
        deleteId = $(e).parents('.comment-text').find("[name='postAnswerId']").val();
        deleteDiv = $(e).parents('.comment')
        $(".panel-Confirm").animate({"top":"-100%"},10).hide();
        $("#delete-comment").show().animate({"top":"34%"},500);
        $("body").prepend("<div class='wrap-pop'></div>");
        wrap_pop()
    };
    $('.panelButton').click(function(e) {

        var postDto = {'id' : deleteId };
        var url = '/post/deleteAnswer';
        if ($(e.currentTarget).hasClass('OK')) {
            $.ajax({
                type: "POST",
                url: url,
                data: postDto,
                success: function (data) {
                    if(data != "NG" ){
                        deleteDiv.remove();
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
    })
    $(document).ready(function () {
        var listAnswer = new Array()
        listAnswer = $("input[name='postAnswerId']")
        var lastestId = listAnswer.last().val();
        function getListCommentDiv() {
            var listComment = '<div id="commentlist" class="page-content">'+
                              '<div class="boxedtitle page-title"><h2>Comments ( <span class="color">1</span> )'+
                              '</h2></div>'+
                              '<ol class="commentlist clearfix" id="commentListDetail">'+'</ol>'
            return listComment
        }
        function getCommentDiv(ownerName, lastEditDate,imageUrl) {
            var commentDiv = '<li class="comment">'+
                    '<div class="comment-body comment-body-answered clearfix">'+
                    '<div class="avatar"><img alt=""'+
                    'src="'+ imageUrl +'">'+
                    '</div>'+
                    '<div class="comment-text">'+
                    '<div class="author clearfix"  style="display: flex">'+
                    '<div style="width: 30%">'+
                    '<div class="comment-author"><a href="#">' + ownerName +'</a>'+
                    '</div>'+
                    '<div class="comment-meta">'+
                    '<div class="date"><i class="icon-time"></i>' + lastEditDate +'</div>' +
                    '</div>' +
                    '</div>' ;
            return commentDiv;
        }

        //2
        function acceptAnswerIconDiv(id) {
            var answerIconDiv = '<div class="acceptAnswerIcon" id="answerIcon' + id + '">' +
                    '</div>' +
                    '<div style="width: 75%;display: flex">' + '<div style="width: 100%;float: right;">' +
                    '<input type="hidden" name="postAnswerId" value="' + id + '">';
            return answerIconDiv;
        }

        //2 ( required one of acceptAnswerIconDiv or notAcceptAnswerIconDiv)
        function notAcceptAnswerIconDiv(id) {
            var answerIconDiv = '<div class="acceptAnswerIcon" id="answerIcon' + id + '">' +
                    '</div>' +
                    '<div style="width: 75%;display: flex">' + '<div style="width: 100%;float: right;">' +
                    '<input type="hidden" name="postAnswerId" value="' + id + '">';
            return answerIconDiv;
        }

        //3 ( optional )
        function unacceptAnswerDiv() {
            return ''
        }

        //3  ( optional )
        function acceptAnswerDiv() {
            return ''
        }

        //Css for comment 4 (required)
        function acceptAnswerAction() {
            var acceptAnswerAction = '</div>' + '</div>' +
                    '<div style="float: right;margin-left: 2%;">';
            return acceptAnswerAction;
        }

        //5 ( optional )
        function postActionUser() {
            var actionPost = '<div class="btn-group">' +
                    '<a data-toggle="dropdown" href="" aria-expanded="false"><span class="caretBig"></span></a>' +
                    '<ul class="actionAnswer dropdown-menu" role="menu">' +
                    '<li><a onclick="editAnswer(this);return false">Edit</a></li>' +
                    '<li><a onclick="deleteAnswer(this);return false;">Delete</a></li>' +
                    '</ul>' +
                    '</div>';
            return actionPost;
        }
        function postActionAdmin() {
            var actionPost = '<div class="btn-group">'+
                    '<a data-toggle="dropdown" href="" aria-expanded="false"><span class="caretBig"></span></a>' +
                    '<ul class="actionAnswer dropdown-menu" role="menu">' +
                    '<li><a onclick="deleteAnswer(this);return false;">Delete</a></li>' +
                    '</ul>' +
                    '</div>' ;
            return actionPost;
        }
        //6 (required)
        function answerBody(body) {
            var answerBody = '</div>' +
                    '</div>' +
                    '<div class="textComment"><p class="textBody">' + body + '</p>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</li>';
            return answerBody;
        }

        //Create stomp client over sockJS protocol
        var socket = new SockJS("/ws");
        var stompClient = Stomp.over(socket);

        // Callback function to be called when stomp client is connected to server
        var connectCallback = function () {
            stompClient.subscribe('/topic/discussion/${post.id}', post);
        };

        // Callback function to be called when stomp client could not connect to server
        var errorCallback = function (error) {
            alert(error.headers.message);
        };

        function post(post) {
            var postOwnerId = ${post.ownerUserId.id}
            var userId =$('#userIdFlag').val()
            var post = JSON.parse(post.body);
            var userRole = '${sessionScope.user.roleId.roleName}';
            if($('#commentlist').length==0) {
                $('#questionMain').append(getListCommentDiv());
            }
            if(postOwnerId==userId && userRole!='Admin' ) {
                //user is post Owner
                if(userId==post.ownerId) {
                    var divAppend = getCommentDiv(post.ownerName, post.lastEditedDate,post.ownerProfileImageURL) +
                            notAcceptAnswerIconDiv(post.id) + acceptAnswerDiv() +
                            acceptAnswerAction() + postActionUser() + answerBody(post.body)
                    $('#commentListDetail').prepend(divAppend);
                } else {
                    var divAppend = getCommentDiv(post.ownerName,post.lastEditedDate,post.ownerProfileImageURL) +
                            notAcceptAnswerIconDiv(post.id) + acceptAnswerDiv() +
                            acceptAnswerAction() + answerBody(post.body)
                    $('#commentListDetail').prepend(divAppend);
                }

            } else if(postOwnerId!=userId && userRole!='Admin') {
                //user is post Owner
                if(userId==post.ownerId) {
                    var divAppend = getCommentDiv(post.ownerName, post.lastEditedDate,post.ownerProfileImageURL) +
                            notAcceptAnswerIconDiv(post.id) +
                            acceptAnswerAction() + postActionUser() + answerBody(post.body)

                    $('#commentListDetail').prepend(divAppend);
                } else {
                    var divAppend = getCommentDiv(post.ownerName,post.lastEditedDate,post.ownerProfileImageURL) +
                            notAcceptAnswerIconDiv(post.id) +
                            acceptAnswerAction() + answerBody(post.body)
                    $('#commentListDetail').prepend(divAppend);
                }
            } else if(userRole=='Admin') {
                var divAppend = getCommentDiv(post[i].ownerName, post[i].lastEditedDate,post[i].ownerProfileImageURL) +
                        notAcceptAnswerIconDiv(post[i].id) +
                        acceptAnswerAction() + postActionAdmin()() + answerBody(post[i].body)

                $('#commentListDetail').append(divAppend);
            }
            MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
            $('.numberAnswer').html($('.numberAnswer').html()*1+1);

        }

        // Connect to server via websocket
        stompClient.connect("guest", "guest", connectCallback, errorCallback);
//        $('.answerFlag').delegate('click',function (e) {
//
//        });
        if (Cookies.get('post') == undefined) {
            Cookies.set('post', '${post.id}');
        } else {
            var postIds = Cookies.get('post');
            var listPost = new Array();
            var flag = 0;
            listPost = postIds.split(',');
            for (var i = 0; i < listPost.length; i++) {
                if (listPost[i] ==${post.id}) {
                    flag = 1;
                    break;
                }
            }
            if (flag == 0) {
                postIds = postIds + "," + ${post.id};
                var url = "/post/count/${post.id}"
                $.ajax({
                    type: "POST",
                    url: url,
                    success: function (data) {
                        if (data != "NG") {
                        } else {
                            console.log("Error");
                        }
                    }
                });
            }
            Cookies.set('post', postIds);
        }
        $('#loadMore').click(function (e) {
            var url = "/post/view/${post.id}/"+lastestId;
            //comply sequence of function div
            //1(required)

            $.ajax({
                type : "GET",
                url : url,
                success : function(data) {
                    var post = new Array();
                    post = data;
                    var postOwnerId = ${post.ownerUserId.id}
                    var userId =$('#userIdFlag').val()
                    var length = post.length;
                    var userRole = '${sessionScope.user.roleId.roleName}';
                    if(length > 10) {
                        length = post.length-1;
                    } else {
                        $('#loadMore').hide();
                    }
                    for(var i = 0 ; i < length ; i++ ) {
                        //if user is Question owner .
                        lastestId = post[i].id;
                        if(userRole == 'Admin') {
                            if(post[i].acceptedAnswerId==1) {
                                var divAppend = getCommentDiv(post[i].ownerName,post[i].lastEditedDate,post[i].ownerProfileImageURL) +
                                        acceptAnswerIconDiv(post[i].id) +
                                        acceptAnswerAction() + postActionAdmin() + answerBody(post[i].body)

                                $('#commentListDetail').append(divAppend);
                            } else {
                                var divAppend = getCommentDiv(post[i].ownerName, post[i].lastEditedDate,post[i].ownerProfileImageURL) +
                                        notAcceptAnswerIconDiv(post[i].id) +
                                        acceptAnswerAction() + postActionAdmin() + answerBody(post[i].body)

                                $('#commentListDetail').append(divAppend);
                            }
                            continue;
                        }
                        if(postOwnerId==userId) {
                            // if answer was accepted
                            if(post[i].acceptedAnswerId==1) {
                                //user is post Owner
                                if(userId==post[i].ownerId) {
                                    var divAppend = getCommentDiv(post[i].ownerName,post[i].lastEditedDate,post[i].ownerProfileImageURL) +
                                            acceptAnswerIconDiv(post[i].id) + unacceptAnswerDiv() +
                                            acceptAnswerAction() + postActionUser() + answerBody(post[i].body)

                                    $('#commentListDetail').append(divAppend);
                                } else {
                                    var divAppend = getCommentDiv(post[i].ownerName,post[i].lastEditedDate,post[i].ownerProfileImageURL) +
                                            acceptAnswerIconDiv(post[i].id) + unacceptAnswerDiv() +
                                            acceptAnswerAction() + answerBody(post[i].body)
                                    $('#commentListDetail').append(divAppend);
                                }

                            } else {
                                //user is post Owner
                                if(userId==post[i].ownerId) {
                                    var divAppend = getCommentDiv(post[i].ownerName, post[i].lastEditedDate,post[i].ownerProfileImageURL) +
                                            notAcceptAnswerIconDiv(post[i].id) + acceptAnswerDiv() +
                                            acceptAnswerAction() + postActionUser() + answerBody(post[i].body)

                                    $('#commentListDetail').append(divAppend);
                                } else {
                                    var divAppend = getCommentDiv(post[i].ownerName,post[i].lastEditedDate,post[i].ownerProfileImageURL) +
                                            notAcceptAnswerIconDiv(post[i].id) + acceptAnswerDiv() +
                                            acceptAnswerAction() + answerBody(post[i].body)
                                    $('#commentListDetail').append(divAppend);
                                }

                            }

                        } else {
                            // user isn't question owner and this answer was accepted
                            if(post[i].acceptedAnswerId==1) {
                                //user is post Owner
                                if(userId==post[i].ownerId) {
                                    var divAppend = getCommentDiv(post[i].ownerName,post[i].lastEditedDate,post[i].ownerProfileImageURL) +
                                            acceptAnswerIconDiv(post[i].id) +
                                            acceptAnswerAction() + postActionUser() + answerBody(post[i].body)

                                    $('#commentListDetail').append(divAppend);
                                } else {
                                    var divAppend = getCommentDiv(post[i].ownerName,post[i].lastEditedDate,post[i].ownerProfileImageURL) +
                                            acceptAnswerIconDiv(post[i].id)  +
                                            acceptAnswerAction() + answerBody(post[i].body)
                                    $('#commentListDetail').append(divAppend);
                                }
                                // user isn't question owner and this answer wasn't accepted
                            } else {
                                //user is post Owner
                                if(userId==post[i].ownerId) {
                                    var divAppend = getCommentDiv(post[i].ownerName, post[i].lastEditedDate,post[i].ownerProfileImageURL) +
                                            notAcceptAnswerIconDiv(post[i].id) +
                                            acceptAnswerAction() + postActionUser() + answerBody(post[i].body)

                                    $('#commentListDetail').append(divAppend);
                                } else {
                                    var divAppend = getCommentDiv(post[i].ownerName,post[i].lastEditedDate,post[i].ownerProfileImageURL) +
                                            notAcceptAnswerIconDiv(post[i].id) +
                                            acceptAnswerAction() + answerBody(post[i].body)
                                    $('#commentListDetail').append(divAppend);
                                }
                            }
                        }

                    }
                }
            });
        });
        MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
        $('#wantAnswer').click(function (e) {
            if($('#wantAnswer').hasClass('wantAnswerId')) {
                var postId = ${post.id}
                var wantAnswerDto  = {postId: postId};
                var url = "/post/wantAnswer"
                $.ajax({
                    type: "POST",
                    url: url,
                    data: wantAnswerDto,
                    success: function (data) {
                        if(data != "NG" ){
                            var number = $('#wantNumber').html();
                            number = number*1+1;
                            $('#wantNumber').html(number);
                            $('#wantAnswer').removeClass('wantAnswerId')
                            $('#wantAnswer').addClass('dontWantanswerId')
                            $('#wantAnswerId').val(data)
                            var icon = $('.icon-thumbs-up');
                            icon.attr('class', 'icon-thumbs-down')
                        } else {
                            console.log("Error");
                        }
                    }
                });
            } else {
                var id = $('#wantAnswerId').val()
                var url = "/post/dontWantAnswer"
                var wantAnswerDto  = {id: id};
                $.ajax({
                    type: "POST",
                    url: url,
                    data : wantAnswerDto,
                    success: function (data) {
                        if(data == "OK" ){
                            var number = $('#wantNumber').html();
                            number = number*1-1;
                            $('#wantNumber').html(number);
                            $('#wantAnswer').removeClass('dontWantanswerId')
                            $('#wantAnswer').addClass('wantAnswerId')
                            var icon = $('.icon-thumbs-down');
                            icon.attr('class', 'icon-thumbs-up')
                        } else {
                            console.log("Error");
                        }
                    }
                });
            }
        });
        $('#submit').click(function (e) {
            e.preventDefault();
            var url = "/post/add"
            var detail = CKEDITOR.instances['question-details'].getData()
            var postDto  = {'ownerId': '${sessionScope.user.id}', 'body': detail, 'parentId': ${post.id}};
            $.ajax({
                type : "POST",
                url : url,
                data : postDto,
                success: function (data) {
                    if(data != "OK" ){
                        console.log("Error");
                        CKEDITOR.instances['question-details'].setData("")
                    } else {
                        CKEDITOR.instances['question-details'].setData("")
                    }
                }
            })
            return false;
        });


        $('#deletePost').click(function (e) {
            e.preventDefault();
            $(".panel-Confirm").animate({"top":"-100%"},10).hide();
            $("#delete-post").show().animate({"top":"34%"},500);
            $("body").prepend("<div class='wrap-pop'></div>");
            wrap_pop()
            var flagPanel =  $('.panelButtonDeletePost').click(function(e) {
                if ($(e.currentTarget).hasClass('OK')) {
                    var form = $('#deletePostForm').submit();
                } else {
                    $(".panel-Confirm").animate({"top":"-100%"},500);
                    $(".wrap-pop").remove();
                }
            })
        });
        $('#closeOpenPost').click(function (e) {
            e.preventDefault();
            var form = $('#closeOpenPostForm').submit();
            return false;
        });
    })
</script>
</body>
</html>
