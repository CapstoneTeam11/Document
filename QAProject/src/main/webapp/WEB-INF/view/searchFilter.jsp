<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 7/6/2015
  Time: 5:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="css.jsp" %>
<div id="wrap">


<%@include file="header.jsp" %>
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
<div class="breadcrumbs" style="margin-top: 86px">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <c:if test="${not empty param.searchKey}">
                <h3>Search results for <span style="font-size: 20px; font-style: italic">${param.searchKey}</span></h3>
                </c:if>
            <c:if test="${empty param.searchKey}">
                <h3>
                    Search all
                    <c:if test="${param.filter==1}">
                        question.
                    </c:if>
                    <c:if test="${param.filter==2}">
                        article.
                    </c:if>
                    <c:if test="${param.filter==3}">
                        material.
                    </c:if>
                    <c:if test="${param.filter==4}">
                        classroom.
                    </c:if>
                    <c:if test="${param.filter==5}">
                        user.
                    </c:if>
                </h3>
            </c:if>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar" style="min-height: 260px">
<div class="row">
<div class="col-md-10 col-md-offset-1">

<div id="searchbar" class="row">
    <form method="GET" action="/search">
        <div class="" style="padding-left: 15px">
            <select name="filter" style="width: 15%; float: left; margin-top: 5px; padding-bottom: 6px">
                <option value="0">All</option>
                <option value="1" ${param.filter == 1 ? 'selected="selected"' : ''}>Question</option>
                <option value="2" ${param.filter == 2 ? 'selected="selected"' : ''}>Article</option>
                <option value="3" ${param.filter == 3 ? 'selected="selected"' : ''}>Material</option>
                <option value="4" ${param.filter == 4 ? 'selected="selected"' : ''}>Classroom</option>
                <option value="5" ${param.filter == 5 ? 'selected="selected"' : ''}>User</option>
            </select>
            <input name="searchKey" type="text" aria-required="true"
                   value="${param.searchKey}"
                   style="width: 72%; margin-top:5px; float: left;">
            <input href="#" class="button small color" style="padding-bottom: 9px; width: 12%;
                        text-align: center" type="submit" value="Search">
        </div>
    </form>
</div><!-- End #searchbar -->
<div id="result-count" style="margin-bottom: 5px;float: right;font-style: italic;">
    Found
    <c:if test="${countResult>0}">
        ${countResult} result(s).
    </c:if>
    <c:if test="${countResult==0}">
        no matched result.
    </c:if>
</div>
<div class="divider"><span></span></div>
<span class="anchor-result-page" id="question"></span>
<c:if test="${not empty questions}">
    <div class="row">
        <div class="col-md-12">
            <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
                <h2>
                    Question
                </h2>
            </div>

            <div class="page-content page-content-user">
                <div class="user-questions" id="questions">
                    <c:if test="${fn:length(questions)>10}">
                        <c:forEach var="question" items="${questions}" end="9">
                            <article class="question user-question">
                                <h3>
                                    <a href="/post/view/${question.id}">${question.title}</a>
                                </h3>
                                <div class="question-type-main"><i class="icon-question-sign"></i>Question</div>
                                <div class="question-content">
                                    <div class="question-bottom">
                                        ${question.body}
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                    </c:if>
                    <c:if test="${fn:length(questions)<=10}">
                        <c:forEach var="question" items="${questions}">
                            <article class="question user-question">
                                <h3>
                                    <a href="/post/view/${question.id}">${question.title}</a>
                                </h3>
                                <div class="question-type-main"><i class="icon-question-sign"></i>Question</div>
                                <div class="question-content">
                                    <div class="question-bottom">
                                            ${question.body}
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <c:if test="${fn:length(questions)>10}">
                    <div id="loadingQ"
                        style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
                    <a class="post-read-more button color small"
                       style="margin: 5px 0px;" id="loadMoreQuestion">Load more results</a>
            </c:if>
        </div>
    </div><!-- End question -->
    <div class="divider"><span></span></div>
</c:if>

<span class="anchor-result-page" id="article"></span>
<c:if test="${not empty articles}">
    <div  class="row">
        <div class="col-md-12">
            <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
                <h2>
                    Article
                </h2>
            </div>

            <div class="page-content page-content-user">
                <div class="user-questions" id="articles">
                <c:if test="${fn:length(articles)>10}">
                    <c:forEach var="article" items="${articles}" end="9">
                        <article class="question user-question">
                            <h3>
                                <a href="/post/view/${article.id}">${article.title}</a>
                            </h3>
                            <div class="question-type-main"><i class="icon-edit"></i>Article</div>
                            <div class="question-content">
                                <div class="question-bottom">
                                    ${article.body}
                                </div>
                            </div>
                        </article>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(articles)<=10}">
                    <c:forEach var="article" items="${articles}">
                        <article class="question user-question">
                            <h3>
                                <a href="/post/view/${article.id}">${article.title}</a>
                            </h3>
                            <div class="question-type-main"><i class="icon-edit"></i>Article</div>
                            <div class="question-content">
                                <div class="question-bottom">
                                        ${article.body}
                                </div>
                            </div>
                        </article>
                    </c:forEach>
                </c:if>
                </div>
            </div>
            <c:if test="${fn:length(articles)>10}">
                <div id="loadingA"
                     style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
                <a class="post-read-more button color small"
                   style="margin: 5px 0px;" id="loadMoreArticle">Load more results</a>
            </c:if>
        </div>
    </div><!-- End articles -->
    <div class="divider"><span></span></div>
</c:if>

<span class="anchor-result-page" id="material"></span>
<c:if test="${not empty materials}">
    <div  class="row">
        <div class="col-md-12">
            <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
                <h2>
                    Material
                </h2>
            </div>
            <div class="" style="display: block;">
                <div class="tab-inner">
                    <table class="table table-hover" id="materials">
                        <tr>
                            <th>No</th>
                            <th>File name</th>
                            <th>Uploaded Date</th>
                            <th>File size</th>
                            <th>Save to</th>
                        </tr>
                        <c:if test="${fn:length(materials)>10}">
                            <c:forEach var="material" items="${materials}" varStatus="counter" end="9">
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
                </div>
                <c:if test="${fn:length(materials)>10}">
                    <div id="loadingM"
                         style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
                    <a class="post-read-more button color small"
                       style="margin: 5px 0px;" id="loadMoreMaterial">Load more results</a>
                </c:if>
            </div>
        </div>
    </div><!-- End #material -->
    <div  class="divider"><span></span></div>
</c:if>

<span class="anchor-result-page" id="classroom"></span>
<c:if test="${not empty classrooms}">
    <div class="row">
        <div class="col-md-12">
            <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
                <h2>
                    Classroom
                </h2>
            </div>

            <div class="page-content page-content-user">
                <div class="user-questions" id="classrooms">
                    <c:if test="${fn:length(classrooms)>10}">
                        <c:forEach var="classroom" items="${classrooms}" end="9">
                            <article class="question user-question">
                                <h3>
                                    <a href="/classroom/${classroom.id}">${classroom.classroomName}</a>
                                </h3>
                                <div class="question-type-main"><i class="icon-group"></i>Classroom</div>
                                <div class="question-content">
                                    <div class="question-bottom">
                                        ${classroom.classroomDescription}
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                    </c:if>
                    <c:if test="${fn:length(classrooms)<=10}">
                        <c:forEach var="classroom" items="${classrooms}">
                            <article class="question user-question">
                                <h3>
                                    <a href="/classroom/${classroom.id}">${classroom.classroomName}</a>
                                </h3>
                                <div class="question-type-main"><i class="icon-group"></i>Classroom</div>
                                <div class="question-content">
                                    <div class="question-bottom">
                                            ${classroom.classroomDescription}
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <c:if test="${fn:length(classrooms)>10}">
                <div id="loadingC"
                     style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
                <a class="post-read-more button color small"
                   style="margin: 5px 0px;" id="loadMoreClassroom">Load more results</a>
            </c:if>
        </div>
    </div><!-- End articles -->
    <div class="divider"><span></span></div>
</c:if>

<span class="anchor-result-page" id="user"></span>
<c:if test="${not empty users}">
    <div class="row">
        <div class="col-md-12">
            <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
                <h2>
                    User
                </h2>
            </div>

            <div id="commentlist" class="page-content" style="margin-bottom: 0px">
                <ol class="commentlist clearfix" id="users">
                    <c:if test="${fn:length(users)>10}">
                        <c:forEach var="user" items="${users}" end="9">
                            <li class="comment">
                                <div class="comment-body comment-body-answered clearfix">
                                    <div class="avatar"><img alt="" src="${user.profileImageURL}">
                                    </div>
                                    <div class="comment-text">
                                        <div class="author clearfix" style="display: flex">
                                            <div style="width: 30%">
                                                <div class="comment-author"><a href="/profile/view/${user.id}">${user.displayName}</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="textComment"><p class="textBody">${user.aboutMe}</p></div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${fn:length(users)<=10}">
                        <c:forEach var="user" items="${users}">
                            <li class="comment">
                                <div class="comment-body comment-body-answered clearfix">
                                    <div class="avatar"><img alt="" src="${user.profileImageURL}">
                                    </div>
                                    <div class="comment-text">
                                        <div class="author clearfix" style="display: flex">
                                            <div style="width: 30%">
                                                <div class="comment-author"><a href="/profile/view/${user.id}">${user.displayName}</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="textComment"><p class="textBody">${user.aboutMe}</p></div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </c:if>
                </ol>
            </div>
            <c:if test="${fn:length(users)>10}">
                <div id="loadingU"
                     style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
                <a class="post-read-more button color small"
                   style="margin: 5px 0px;" id="loadMoreUser">Load more results</a>
            </c:if>
        </div>
    </div><!-- End articles -->
</c:if>

</div><!-- End main -->
</div><!-- End row -->
</section><!-- End container -->

<%@include file="footer.jsp" %>
</div><!-- End wrap -->
<!-- End wrap -->
<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<%@include file="js.jsp" %>
<c:if test="${sessionScope.user!=null}">
    <script src="/resource/assets/js/notification.js"></script>
</c:if>
<!-- End js -->
<script>

var idAddMaterial;
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
                $('#folderList').prepend('<label style="color: #0088cc;" class="errorFolder"><a href="/material">You dont have any folder</a></label>')
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
function wrap_pop() {
    $(".wrap-pop").click(function () {
        $(".panel-Confirm").animate({"top":"-100%"},500).hide(function () {
            $(this).animate({"top":"-100%"},500);
        });
        $(this).remove();
    });
}
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
    var lastQuestionId = '${lastQuestionId}';
    var lastArticleId = '${lastArticleId}';
    var lastMaterialId = '${lastMaterialId}';
    var lastClassroomId = '${lastClassroomId}';
    var lastUserId = '${lastUserId}';
    var materialCounter = 11;
    $('#loadMoreQuestion').click(function (e) {
        var url = "/search/question";
        var searchKey = '${param.searchKey}';
        $.ajax({
            type: "POST",
            url: url,
            data: {searchKey: searchKey, lastId: lastQuestionId},
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
                    var component = '<article class="question user-question">' +
                            '<h3>' +
                            '<a href="/post/view/'+ questions[i].id+'">'+questions[i].title+'</a>' +
                            '</h3>' +
                            '<div class="question-type-main"><i class="icon-question-sign"></i>Question</div>' +
                            '<div class="question-content">' +
                            '<div class="question-bottom">' +
                            questions[i].body +
                            '</div>' +
                            '</div>' +
                            '</article>';
                    $('#questions').append(component);
                }
            }
        })
    });
    $('#loadMoreArticle').click(function (e) {
        var url = "/search/article";
        var searchKey = '${param.searchKey}';
        $.ajax({
            type: "POST",
            url: url,
            data: {searchKey: searchKey, lastId: lastArticleId},
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
                lastArticleId= articles[length-1].id;
                for (var i = 0; i < length; i++) {
                    var component = '<article class="question user-question">' +
                            '<h3>' +
                            '<a href="/post/view/'+ articles[i].id+'">'+articles[i].title+'</a>' +
                            '</h3>' +
                            '<div class="question-type-main"><i class="icon-edit"></i>Question</div>' +
                            '<div class="question-content">' +
                            '<div class="question-bottom">' +
                            articles[i].body +
                            '</div>' +
                            '</div>' +
                            '</article>';
                    $('#articles').append(component);
                }
            }
        })
    });
    $('#loadMoreMaterial').click(function (e) {
        var url = "/search/material";
        var searchKey = '${param.searchKey}';
        $.ajax({
            type: "POST",
            url: url,
            data: {searchKey: searchKey, lastId: lastMaterialId},
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
                lastMaterialId = materials[length-1].id;
                for (var i = 0; i < length; i++) {
                    var component = '<tr>' +
                            '<td>'+ materialCounter + '</td>' +
                            '<td>'+ materials[i].name + '</td>' +
                            '<td>'+ materials[i].creationDate + '</td>' +
                            '<td>' + materials[i].size + '</td>' +
                            '<td><a id="add-to-folder-click" href="#">Folder</a> / <a href="/download/'+ materials[i].id +
                            '">Computer</a></td></tr>';
                    $('#materials').append(component);
                    materialCounter++;
                }
            }
        })
    });
    $('#loadMoreUser').click(function (e) {
        var url = "/search/user";
        var searchKey = '${param.searchKey}';
        $.ajax({
            type: "POST",
            url: url,
            data: {searchKey: searchKey, lastId: lastUserId},
            beforeSend: function(){
                $('#loadMoreUser').hide();
                $('#loadingU').show();

            },
            complete: function() {
                $('#loadingU').hide();
            },
            success: function (data) {
                var users = new Array();
                users = data;
                var length = users.length;
                if (length > 10) {
                    length = users.length - 1;
                    $('#loadMoreUser').show();
                } else {
                    $('#loadMoreUser').hide();
                }
                lastUserId= users[length-1].id;
                for (var i = 0; i < length; i++) {
                    var component = '<li class="comment">' +
                            '<div class="comment-body comment-body-answered clearfix">' +
                            '<div class="avatar"><img alt="" src="${user.profileImageURL}">' +
                            '</div>' +
                            '<div class="comment-text">' +
                            '<div class="author clearfix" style="display: flex">' +
                            '<div style="width: 30%">' +
                            '<div class="comment-author"><a href="/profile/view/'+users[i].id+'">'+users[i].displayName+'</a>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '<div class="textComment"><p class="textBody">'+users[i].aboutMe +'</p></div>' +
                            '</div>' +
                            '</div>' +
                            '</li>';
                    $('#users').append(component);
                }
            }
        })
    });
    $('#loadMoreClassroom').click(function (e) {
        var url = "/search/classroom";
        var searchKey = '${param.searchKey}';
        $.ajax({
            type: "POST",
            url: url,
            data: {searchKey: searchKey, lastId: lastClassroomId},
            beforeSend: function(){
                $('#loadMoreClassroom').hide();
                $('#loadingC').show();

            },
            complete: function() {
                $('#loadingC').hide();
            },
            success: function (data) {
                var classrooms = new Array();
                classrooms = data;
                var length = classrooms.length;
                if (length > 10) {
                    length = classrooms.length - 1;
                    $('#loadMoreClassroom').show();
                } else {
                    $('#loadMoreClassroom').hide();
                }
                lastClassroomId= classrooms[length-1].id;
                for (var i = 0; i < length; i++) {
                    var component = '<article class="question user-question">' +
                            '<h3>' +
                            '<a href="/classroom/'+ classrooms[i].id+'">'+classrooms[i].classroomName+'</a>' +
                            '</h3>' +
                            '<div class="question-type-main"><i class="icon-group"></i>Question</div>' +
                            '<div class="question-content">' +
                            '<div class="question-bottom">' +
                            classrooms[i].classroomDescription +
                            '</div>' +
                            '</div>' +
                            '</article>';
                    $('#classrooms').append(component);
                }
            }
        })
    });
</script>

</body>
</html>
