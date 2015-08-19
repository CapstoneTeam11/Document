<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: Minh--%>
  <%--Date: 6/2/2015--%>
  <%--Time: 9:26 AM--%>
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

<div class="panel-pop" id="create-folder">
    <h2>Create folder<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
            <div class="form-inputs clearfix">
                <div id="folderCreateP">
                    <div class="col-md-2">
                    <label class="required">Folder name<span>*</span></label>
                    </div>
                    <div class="col-md-10">
                    <input type="text" name="name" id="folderName">
                    </div>
                </div>
            </div>
            <div class="col-md-10 col-md-offset-2">
            <p class="form-submit">
                <input type="submit" id="submitFolder" value="Create new folder" class="button color small submit">
            </p>
            </div>
        <div class="clearfix"></div>
    </div>
</div><!-- End create folder -->
    <div class="panel-Confirm" id="delete-folder">
        <h2>Delete folder</h2>
        <div>
            <p class="panelMessage">Do you want delete this folder ?</p>
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
                    <h3>Manage Material</h3>
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
                </div>
                <div class="col-md-6 col-sm-6">
                    <a href="#" id="create-folder-click" class="button medium green-button" style="float: right"><i class="icon-plus-sign"></i> Create folder</a>
                </div>
            </div>

            <div class="tabs-warp question-tab">
                <ul class="tabs">
                    <li class="tab"><a href="#" class="current">Library</a></li>
                </ul>
                <div class="tab-inner-warp">
                    <div class="tab-inner">
                        <div class="row" id="appendFolder">
                            <c:forEach var="folder" items="${folders}">
                            <div class="col-md-3 deleteDiv">
                                <div class="page-content page-shortcode">
                                    <span class="deleteFolder"><input type="hidden" name="folderId" value="${folder.id}"><a id="removeFolder" onclick="removeFolder(this);return false;"><i class="icon-remove"></i></a></span>
                                    <div class="box_icon">
                                        <span class="t_center icon_i"><span icon_size="120"><i i_color="#1abc9c" i_hover="#34495e" class="icon-folder-open-alt color_default" style="font-size: 60px; color: rgb(52, 73, 94);"></i></span></span>
                                        <div class="t_center">
                                            <h3><a href="/folder/${folder.id}">${folder.name}</a></h3>
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix gap"></div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>


            <!-- End page-content -->
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
<%@include file="js.jsp" %>
<c:if test="${user!=null}">
<script src="/resource/assets/js/notification.js"></script>
</c:if>
<script>
    var deleteId
    var deleteDiv
    var removeFolder = function(e) {
        deleteId = $(e).parents('.deleteFolder').find("[name='folderId']").val();
        deleteDiv = $(e).parents('.deleteDiv')
        $(".panel-Confirm").animate({"top":"-100%"},10).hide();
        $("#delete-folder").show().animate({"top":"34%"},500);
        $("body").prepend("<div class='wrap-pop'></div>");
        wrap_pop()
    }
    $('.panelButton').click(function(e) {
        var url = '/folder/remove';
        if ($(e.currentTarget).hasClass('OK')) {
            $.ajax({
                type: "POST",
                url: url,
                data: "id="+deleteId,
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
        var folderDiv = function(folderId,folderName) {
            var div = '<div class="col-md-3"><div class="page-content page-shortcode">'+
                       '<span class="deleteFolder"><input type="hidden" name="folderId" value="'+folderId+'"><a id="removeFolder"><i class="icon-remove"></i></a></span>'+
                        '<div class="box_icon"><span class="t_center icon_i"><span icon_size="120"><i i_color="#1abc9c" i_hover="#34495e" class="icon-folder-open-alt color_default" style="font-size: 60px; color: rgb(52, 73, 94);"></i></span></span>'+
                        '<div class="t_center"><h3><a href="/folder/'+folderId+'">'+folderName+'</a></h3>'+
                        '<p></p></div></div></div><div class="clearfix gap"></div> </div>'
            return div;

        }
        $('#submitFolder').click(function(e){
            e.preventDefault;
            if($('#create-folder-error').length > 0) {
                $('#create-folder-error').remove();
            }
            var url = "/folder/create"
            var data = "name="+$('#folderName').val();
            $.ajax({
                type: "POST",
                url: url,
                data: data,
                success: function(data){
                   if(data!="NG" && data!="exist") {
                       $(".panel-pop h2 i").click();
                       var div = folderDiv(data,$('#folderName').val())
                        $('#appendFolder').append(div);
                   } else if (data=="exist") {
                        $('#folderCreateP').append('<label id="create-folder-error" style="color: red;"  class="error" for="question-title">Folder is exist</label>')
                   } else {
                       $('#folderCreateP').append('<label id="create-folder-error" style="color: red;" class="error" for="question-title">Has a error , please try again</label>')
                       $(".panel-pop h2 i").click();
                   }
                }
            });
        })
    })
</script>
<!-- End js -->

</body>
</html>
