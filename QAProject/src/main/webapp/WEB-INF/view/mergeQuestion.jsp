<%--&lt;%&ndash;--%>
<%--Created by IntelliJ IDEA.--%>
<%--User: Minh--%>
<%--Date: 6/30/2015--%>
<%--Time: 9:07 AM--%>
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


    <%@include file="header.jsp" %>

    <div class="breadcrumbs" style="margin-top: 86px">
        <section class="container" style="height:70px; display: flex; align-items: center">
            <div class="row">
                <div class="col-md-12">
                    <h3 style="margin-top:15px">Merge questions</h3>
                    <h5 style="margin-top: 15px">
                        <a href="/search?filter=4&searchKey=" style="color: white;">Classroom</a> /
                        <a href="/classroom/${classroom.id}" style="color: white;">${classroom.classroomName}</a> /
                        <span style="color: #2f3239;">Merge questions</span>
                    </h5>
                </div>
            </div><!-- End row -->
        </section><!-- End container -->
    </div><!-- End breadcrumbs -->

    <section class="container main-content page-left-sidebar">
        <div class="row">
            <div class="col-md-9">
                <%--<div style="display: flex;">
                <span style="font-weight: bold">Group questions have similar title over</span><span id="range"
                    class="button color small submit" style="color: white;padding: 3px 5px;margin-left: 5px;">${range} %</span>
                <input type="range" min="0" max="100" step="10" value="${range}" style="width: 40%" id="rangeMerge">
                <a class="button color small submit" href="/post/merge/${classroom.id}/${range}" id="suggestMergehref" style="margin-left: 5px">Group</a>
                </div>--%>
                <c:if test="${fulltext==null}">
                <%--<div class="col-md-12">--%>
                    <%--<span style="font-weight: bold; font-size: 18px">--%>
                        <%--Group questions have similar titles over--%>
                    <%--</span>--%>
                    <%--<span id="range"--%>
                      <%--style="font-size: 20px; font-style:italic; font-weight: bold">--%>
                          <%--${range}%--%>
                    <%--</span>--%>
                <%--</div>--%>

                <%--<div class="col-md-12">--%>
                    <%--<div class="col-md-6" style="padding-left: 0px;">--%>
                        <%--<input type="range" min="0" max="100" step="10" value="${range}" style="margin-top: 10px;"--%>
                               <%--id="rangeMerge"></div>--%>
                    <%--<div class="col-md-6">--%>
                        <%--<a class="button color small submit" href="/post/merge/${classroom.id}/${range}" id="suggestMergehref">Group</a></div>--%>
                <%--</div>--%>
                </c:if>
                <form action="/post/merge" method="GET" id="mergeForm">
                <input type="hidden" name="id" value="${classroom.id}">
                <table class="table table-hover" style="margin-left: 10px" id="tableMerge">
                    <thead>
                    <tr>
                        <th style="border-bottom: none; font-weight: bold"></th>
                        <th style="border-bottom: none"></th>
                    </tr>
                    </thead>
                    <tbody style="display: block; max-height: 300px; overflow-y: auto">
                    <tr>
                        <td class="col-md-12"><a href="/post/view/${posts[0].id}">${posts[0].title}</a></td>
                        <td ><input type="checkbox" class="checkbox" name="postMerges"
                                    value="${posts[0].id}" required minlength="2"
                                    title="Please select at least two questions."></td>
                    </tr>
                    <c:forEach var="post" items="${posts}" begin="1">
                        <tr>
                            <td class="col-md-12"><a href="/post/view/${post.id}">${post.title}</a></td>
                            <td ><input type="checkbox" class="checkbox" name="postMerges"
                                        value="${post.id}"></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <label for="postMerges" class="error" id="mergeQuestion-error" style="text-align: right"></label>
                <div class="row">
                    <input type="submit" class="button color small submit" value="Merge checked questions"
                           style="float: right;margin-right: 16px;">
                </div>
                </form>
                <div id="respond" class="comment-respond page-content clearfix">
                    <div class="boxedtitle page-title"><h2>Answer checked questions</h2></div>
                    <form action="/post/add/all" id="commentform" method="POST" class="comment-form">
                        <div id="hiddenId" name="hiddenId">
                            <input type="hidden" name="validateId" id="validateId"/>
                        </div>
                        <input type="hidden" name="classroomId" value="${classroom.id}">
                        <input type="hidden" name="detail" id="detail">

                        <c:if test="${fulltext==null}">
                            <input type="hidden" name="range" value="${range}" id="rangeComment">
                        </c:if>
                        <div id="form-textarea">
                            <textarea id="question-details" name="questionDetails" aria-required="true" cols="58" rows="8"></textarea>
                        </div>
                        <p class="form-submit" style="width: 100%">
                            <input name="submit" type="submit" id="submit" value="Submit your answer"
                                   class="button small color">
                        </p>
                    </form>
                </div>
            </div><!-- End main -->
            <aside class="col-md-3 sidebar">
                <div class="widget">
                    <h3 class="widget_title">About classroom</h3>
                    <ul class="related-posts">
                        <li class="related-item">
                            <c:if test="${classroom.status==1}">
                                <p>${classroom.classroomDescription}</p>
                            </c:if>
                            <c:if test="${classroom.status==0}">
                                <p style="color: red; font-style: italic">Classroom is closed.</p>
                            </c:if>
                        </li>
                    </ul>
                </div>
                <div class="widget widget_tag_cloud">
                    <h3 class="widget_title">Classroom's Tags</h3>
                    <c:forEach var="tag" items="${classroom.tagClassroomList}">
                        <a href="#">${tag.tagId.tagName}</a>
                    </c:forEach>
                </div>
            </aside><!-- End sidebar -->
        </div><!-- End row -->
    </section><!-- End container -->

    <%@include file="footer.jsp" %>
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<%@include file="js.jsp" %>
<script src="/resource/assets/js/jquery.dataTables.min.js"></script>
<script src="/resource/assets/js/dataTables.bootstrap.js"></script>
<c:if test="${sessionScope.user!=null}">
    <script src="/resource/assets/js/notification.js"></script>
</c:if>

<!-- End js -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#tableMerge').dataTable({
            "paging":   false,
            "ordering": false,
            "info":     false,
            "oLanguage": {
                "sSearch": "Filter by title : "
            }
        });
        $('#tableMerge_filter').parent('div').prev('div').remove()
        $('#tableMerge_filter').parent('div').css({'margin-left':'1%'})
        $('#mergeForm').validate();
        $('#commentform').validate({
            ignore: [],
            rules:{
                questionDetails: {
                    required: function (){
                        CKEDITOR.instances['question-details'].updateElement();
                    },
                    minlength: 30
                },
                validateId: {
                    required: function () {
                      if ($('.ids').length==0){
                          return true;
                      }
                      return false;
                    }
                }
            },
            messages: {
                validateId: {
                    required: "Please select at least one question."
                },
                questionDetails: {
                    required: "Please provide the answer.",
                    minlength: "The answer must be at least 30 characters long."
                }
            },
            errorPlacement: function(error, element)
            {
                if (element.attr("name") == "questionDetails")
                {
                    error.insertBefore("#form-textarea");
                } else {
                    error.insertBefore(element);
                }
            }
        });
        CKEDITOR.replace('questionDetails');
        $('#rangeMerge').change(function(e){
            var classroomId = ${classroom.id};
            $('#range').html($(e.currentTarget).val() +'%')
            var href = '/post/merge/'+classroomId+'/'+$(e.currentTarget).val();
            $('#suggestMergehref').attr('href',href);
            $('#rangeComment').val($(e.currentTarget).val())
        })
        $('.checkbox').change(function(e){
            if($(e.currentTarget).is(':checked')) {
                $('#hiddenId').append('<input type="hidden" class="ids" name="ids" value="'+$(e.currentTarget).val()
                        +'"id="hiddenCheck'+ $(e.currentTarget).val() +'">');
            } else {
                var remove = '#hiddenCheck'+$(e.currentTarget).val();
                $(remove).remove();
            }
        })
        $('#submit').click(function(e){
            var detail = CKEDITOR.instances['question-details'].getData()
            $('#detail').val(detail);
            $('#commentform').submit();
        })
    })
</script>
</body>
</html>
