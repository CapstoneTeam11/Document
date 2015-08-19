<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: Minh--%>
  <%--Date: 5/23/2015--%>
  <%--Time: 3:23 PM--%>
  <%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
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

<%--</head>--%>

<%--<body>--%>

<%--<div class="loader"><div class="loader_html"></div></div>--%>
<%@include file="css.jsp" %>
<div id="wrap">

<div class="panel-pop" id="suggested-classrooms">
    <input id="suggestedClassroomsVar" type="hidden" value="${suggestedClassrooms}"/>
    <h2>Join your first class now!<i class="icon-remove"></i></h2>
    <div style="height: auto; max-height: 300px; overflow-x: hidden;">
        <c:forEach var="suggestedClassroom" items="${suggestedClassrooms}">
            <a href="/classroom/${suggestedClassroom.id}" class="list-group-item">
                <h4 class="list-group-item-heading">${suggestedClassroom.classroomName}</h4>
            </a>
        </c:forEach>
    </div>
</div><!-- End add to folder -->
<div class="panel-pop" id="add-to-folder">
    <h2>Add to folder<i class="icon-remove"></i></h2>
    <div style="height: auto; max-height: 300px; overflow-x: hidden;" id="folderList">
        <c:forEach var="folder" items="${user.folderList}">
            <input type="hidden" value="${folder.id}">
            <a class="list-group-item listFolder">
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
                <h3>News feed</h3>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar">
    <div class="row">
        <div class="col-md-9">

            <div id="searchbar" class="row">
                <form method="GET" action="/search">
                    <div class="" style="padding-left: 15px">
                        <select name="filter" style="width: 15%; float: left; margin-top: 5px; padding-bottom: 6px">
                            <option value="0">All</option>
                            <option value="1">Question</option>
                            <option value="2">Article</option>
                            <option value="3">Material</option>
                            <option value="4">Classroom</option>
                            <option value="5">User</option>
                        </select>
                        <input name="searchKey" type="text" aria-required="true"
                               value="Find article, question, class or teacher here..."
                               onfocus="if(this.value=='Find article, question, class or teacher here...')this.value='';"
                               onblur="if(this.value=='')this.value='Find article, question, class or teacher here...';"
                               style="width: 72%; margin-top:5px; float: left;">
                        <input href="#" class="button small color" style="padding-bottom: 9px; width: 12%;
                        text-align: center" type="submit" value="Search">
                    </div>
                </form>
            </div><!-- End #searchbar -->

            <div class="divider"><span></span></div>

            <div id="question" class="row">
                <div class="col-md-12">
                    <div class="boxedtitle page-title"><h2>Question</h2></div>
                    <div style="display: block;">
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
                                                        <c:if test="${question.acceptedAnswerId ==1}">
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
                        </div>
                        <c:if test="${fn:length(questions)>10}">
                            <div id="loadingQ"
                                 style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
                            <a class="post-read-more button color small"
                               style="margin-bottom: 5px;" id="loadMoreQuestion">Load more</a>
                        </c:if>
                    </div>
                </div>


            </div><!-- End question -->

            <div class="divider"><span></span></div>

            <div id="article" class="row">
                <div class="col-md-12">
                    <div class="boxedtitle page-title"><h2>Article</h2></div>
                    <div class="" style="display: block;">
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
                        </div>
                        <c:if test="${fn:length(articles)>10}">
                            <div id="loadingA"
                                 style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
                            <a class="post-read-more button color small"
                               style="margin-bottom: 5px;" id="loadMoreArticle">Load more</a>
                        </c:if>
                    </div>
                </div>
            </div><!-- End #article -->

            <div class="divider"><span></span></div>

            <div id="material" class="row">
                <div class="col-md-12">
                    <div class="boxedtitle page-title"><h2>Material</h2></div>
                    <div class="" style="display: block;">
                        <div class="tab-inner">
                            <c:if test="${not empty materials}">
                                <table class="table table-hover" id="materials">
                                    <tr>
                                        <th>No</th>
                                        <th>File name</th>
                                        <th>Uploaded Date</th>
                                        <th>Size (KB)</th>
                                        <th>Save to</th>
                                    </tr>
                                    <c:if test="${fn:length(materials)>10}">
                                        <c:forEach var="material" items="${materials}" end="9" varStatus="counter">
                                            <tr>
                                                <td>${counter.count}</td>
                                                <td>${material.name}</td>
                                                <td>${material.creationDate}</td>
                                                <td>${material.size}</td>
                                                <td><input type="hidden" value="${material.id}" name="materialId"><c:if test="${sessionScope.user.roleId.id==1}"><a class="add-to-folder-click" onclick="GetListFolder(this);return false" href="#">Folder</a> / </c:if><a href="" onclick="downloadMaterial(this);return false;"> Computer</a></td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${fn:length(materials)<=10}">
                                        <c:forEach var="material" items="${materials}" varStatus="counter">
                                            <tr>
                                                <td>${counter.count}</td>
                                                <td>${material.name}</td>
                                                <td>${material.creationDate}</td>
                                                <td>${material.size}</td>
                                                <td><input type="hidden" value="${material.id}" name="materialId"><c:if test="${sessionScope.user.roleId.id==1}"><a class="add-to-folder-click" onclick="GetListFolder(this);return false" href="#">Folder</a> / </c:if><a href="" onclick="downloadMaterial(this);return false;"> Computer</a></td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </table>
                            </c:if>
                        </div>
                        <c:if test="${fn:length(materials)>10}">
                            <div id="loadingM"
                                 style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
                            <a class="post-read-more button color small"
                               style="margin-bottom: 5px;" id="loadMoreMaterial">Load more</a>
                        </c:if>
                    </div>
                </div>
            </div><!-- End #material -->


        </div><!-- End main -->
        <aside class="col-md-3 sidebar">
            <div class="widget widget_menu widget_menu_jquery" style="width: 220px">
                <ul>
                    <li><a href="#searchbar"><i class="icon-search"></i>Search</a></li>
                    <li><a href="#question"><i class="icon-question-sign"></i>Question</a></li>
                    <li><a href="#article"><i class="icon-edit"></i>Article</a></li>
                    <li><a href="#material"><i class="icon-file-alt"></i>Material</a></li>
                </ul>
            </div><!-- End widget_menu -->
        </aside><!-- End sidebar -->
    </div><!-- End row -->
</section><!-- End container -->

<%@include file="footer.jsp" %>
</div><!-- End wrap -->
<!-- End wrap -->


<!-- js -->
<%@include file="js.jsp" %>
<c:if test="${sessionScope.user!=null}">
    <script src="/resource/assets/js/notification.js"></script>
</c:if>
<!-- End js -->
<c:if test="${not empty suggestedClassrooms}">
    <script>
        $(document).ready(function(){
            jQuery(".panel-pop").animate({"top":"-100%"},10).hide();
            jQuery("#suggested-classrooms").show().animate({"top":"50%"},500);
            jQuery("body").prepend("<div class='wrap-pop'></div>");
            wrap_pop();
        });

        function wrap_pop() {
            jQuery(".wrap-pop").click(function () {
                jQuery(".panel-pop").animate({"top":"-100%"},500).hide(function () {
                    jQuery(this).animate({"top":"-100%"},500);
                });
                jQuery(this).remove();
            });
        }
    </script>
</c:if>
<script>
    var downloadMaterial = function(e) {
    e.preventDefault;
    var idMaterial = $(e).parent('td').find('input').val();
    var url = "/download/check/"+idMaterial;
    $.ajax({
        type: "GET",
        url: url,
        success:function(data) {
            if(data=='error') {
                $.growl.error({ message: "This material is not exist or it was deleted by owner" });
            } else {
                window.location = '/download/'+idMaterial;
            }
        }
    })
}
    var addToFolder = function(e){
        e.preventDefault;
        if($('.errorFolder').length > 0) {
            $('.errorFolder').remove();
        }
        var idFolder = $(e).prev('input').val();
        var url = "/library/add/"+idFolder+"/"+idAddMaterial;
        $.ajax({
            type: "POST",
            url: url,
            success: function (data) {
                if(data != "NG" && data!="Exist"){
                    $(".panel-pop h2 i").click();
                } else if(data=="Exist") {
                    $('#folderList').prepend('<label style="color: red;" class="errorFolder">This file is exist in this folder , choose another folder</label>')
                    console.log("Error");
                } else {
                    $('#folderList').prepend('<label style="color: red;" class="errorFolder">Has a error , please try again</label>')
                }
            }
        })
        return false;
    }
    var GetListFolder = function (e) {
        if($('.errorFolder').length > 0) {
            $('.errorFolder').remove();
        }
        var folders = new Array() ;
        var url = "/folders";
        $.ajax({
            type: "GET",
            url : url,
            success: function(data) {
                folders = data;
                $('#folderList').empty();
                function getFolderDiv(folderId,folderName ) {
                    var component = '<input type="hidden" value="'+ folderId +'"><a class="list-group-item listFolder" onclick="addToFolder(this);return false"><h4 class="list-group-item-heading">' +folderName+ '</h4></a>';
                    return component;
                }
                if(folders.length > 0 ) {
                    for(var i = 0 ; i < folders.length;i++) {
                        $('#folderList').append(getFolderDiv(folders[i].id,folders[i].folderName));
                    }
                } else {
                    $('#folderList').prepend('<label style="color: #0088cc;" class="errorFolder">You dont have any folder</label>')
                }
            }
        })
        $(".panel-pop").animate({"top":"-100%"},10).hide();
        $("#add-to-folder").show().animate({"top":"50%"},500);
        $("body").prepend("<div class='wrap-pop'></div>");
        wrap_pop();
        idAddMaterial = $(e).parents('td').find("[name='materialId']").val();
        return false;
    };
    $(document).ready(function(){
        /*short test for list of posts - MinhKH*/
        $(".short-text").each(function () {
            text = $(this).html();
            if (text.length > 400) {
                $(this).html(text.substr(0, 400) + '.......');
            }
        });
    });
    //Load more
    var questionPage = 2;
    var nextFromArticle = 10;
    var nextFromMaterial = 10;
    function wrap_pop() {
        $(".wrap-pop").click(function () {
            $(".panel-pop").animate({"top":"-100%"},500).hide(function () {
                $(this).animate({"top":"-100%"},500);
            });
            $(this).remove();
        });
    }
    $('#loadMoreQuestion').click(function (e) {
        var url = "newsFeed/question/" + questionPage;
        $.ajax({
            type: "GET",
            url: url,
            beforeSend: function(){
                $('#loadMoreQuestion').hide();
                $('#loadingQ').show();

            },
            complete: function() {
                $('#loadingQ').hide();
            },
            success: function (data) {
                var newsFeedQuestion = new Array();
                newsFeedQuestion = data;
                var length = newsFeedQuestion.length;
                if (length > 10) {
                    length = newsFeedQuestion.length - 1;
                    $('#loadMoreQuestion').show();
                } else {
                    $('#loadMoreQuestion').hide();
                }
                for (var i = 0; i < length; i++) {
                    var component = '<article class="question question-type-normal">' +
                            '<h2>' +
                            '<a href="/post/view/'+ newsFeedQuestion[i].id + '">'+ newsFeedQuestion[i].title
                            +'</a>' +
                            '</h2>' +
                            '<div class="question-author">' +
                            '<a href="/profile/view/'+ newsFeedQuestion[i].ownerId + '"' +
                            'original-title="'+ newsFeedQuestion[i].ownerName +
                            '" class="tooltip-n">' +
                            '<span></span><img alt="" src="' + newsFeedQuestion[i].ownerProfileImageURL + '"></a>' +
                            '</div>' +
                            '<div class="question-inner">' +
                            '<div class="clearfix"></div>' +
                            '<div class="question-desc short-text">'+ newsFeedQuestion[i].body + '</div>' +
                            '<div class="question-details">' +
                            '<span class="question-answered question-answered-done">';
                    if (newsFeedQuestion[i].acceptedAnswerId===1) {
                        component = component + '<i class="icon-ok"></i>Resolved';
                    }
                    component = component + '</span>' +
                            '</div>' +
                            '<span class="question-date"><i ' +
                            'class="icon-time"></i>' + newsFeedQuestion[i].lastEditedDate + '</span>' +
                            '<span class="question-category"><a ' +
                            'href="/classroom/' + newsFeedQuestion[i].classId + '"><i ' +
                            'class="icon-group"></i>Class: ' + newsFeedQuestion[i].className + '</a></span>' +
                            '<span class="question-comment"><a href="#"><i ' +
                            'class="icon-comment"></i>' + newsFeedQuestion[i].answerCount +
                            ' Answer(s)</a></span>' +
                            '<span class="question-view"><i class="icon-eye-open"></i>' + newsFeedQuestion[i].viewer +
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
                questionPage++;
            }
        })
    });
    $('#loadMoreArticle').click(function (e) {
        var url = "newsFeed/article/" + nextFromArticle;
        $.ajax({
            type: "GET",
            url: url,
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
                nextFromArticle = nextFromArticle + 10;
            }
        })
    });
    $('#loadMoreMaterial').click(function (e) {
        var url = "newsFeed/material/" + nextFromMaterial;
        var roleCurrentUser =  ${user.roleId.id};
        $.ajax({
            type: "GET",
            url: url,
            beforeSend: function(){
                $('#loadMoreMaterial').hide();
                $('#loadingM').show();

            },
            complete: function() {
                $('#loadingM').hide();
            },
            success: function (data) {
                var materials = new Array();
                materials = data;
                var length = materials.length;
                if (length > 10) {
                    length = materials.length - 1;
                    $('#loadMoreMaterial').show();
                } else {
                    $('#loadMoreMaterial').hide();
                }
                var counter = nextFromMaterial + 1;
                for (var i = 0; i < length; i++) {
                    var component = '<tr>' +
                            '<td>'+ counter + '</td>' +
                            '<td>'+ materials[i].name + '</td>' +
                            '<td>'+ materials[i].creationDate + '</td>' +
                            '<td>' + materials[i].size + '</td>' ;
                    if(roleCurrentUser==1) {
                        component = component + '<td><input type="hidden" name="materialId" value="'+ materials[i].id +'"><a id="add-to-folder-click" onclick="GetListFolder(this);return false" href="#">Folder</a> / <a href="" onclick="downloadMaterial(this);return false;">Computer</a></td>';
                    } else {
                        component = component + '<td><input type="hidden" name="materialId" value="'+ materials[i].id +'"><a href="" onclick="downloadMaterial(this);return false;">Computer</a></td>';
                    }
                    $('#materials').append(component);
                    counter++;
                }
                nextFromMaterial = nextFromMaterial + 10;
            }
        })
    });
</script>

</body>
</html>