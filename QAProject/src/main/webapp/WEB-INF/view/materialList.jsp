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
    <div class="panel-Confirm delete-Material">
        <h2>Delete material</h2>
        <div>
            <p class="panelMessage">Do you want to Delete this material?</p>
            <p>
                <input type="submit" value="Cancel"  class="button color small cancel deleteMaterial" >
                <input type="submit" value="OK"  class="button color small OK deleteMaterial" style="margin-left: 3%;">
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

                </div>

                <div class="tabs-warp question-tab">
                    <ul class="tabs">
                        <li class="tab"><a href="#" class="current">${folderName}</a></li>
                    </ul>
                    <div class="tab-inner-warp">
                        <div class="tab-inner">
                                <table class="table table-hover">
                                    <tr>
                                        <th>File name</th>
                                        <th>Size (KB)</th>
                                        <th></th>
                                    </tr>
                                    <c:forEach var="material" items="${materials}">
                                    <tr>
                                        <td><input type="hidden" value="${material.id}"><a href="" onclick="downloadMaterial(this);return false;"><i class="icon-download"></i> ${material.name}</a></td>
                                        <td>${material.size}</td>
                                        <td><input type="hidden" name="materialId" value="${material.id}"><a href="#" onclick="removeMaterial(this);return false"><i class="icon-remove"></i> Delete</a></td>
                                    </tr>
                                    </c:forEach>
                                </table>
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

<!-- js -->
<%@include file="js.jsp" %>
<c:if test="${sessionScope.user!=null}">
<script src="/resource/assets/js/notification.js"></script>
</c:if>

<!-- End js -->
<script>
    var idDeleteMaterial
    var divDeleteMaterial
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
    var removeMaterial = function(e) {
        idDeleteMaterial = $(e).parents('td').find('input').val();
        divDeleteMaterial = $(e).parents('tr');
        $(".delete-Material").animate({"top":"-100%"},10).hide();
        $(".delete-Material").show().animate({"top":"34%"},500);
        $("body").prepend("<div class='wrap-pop'></div>");
        wrap_pop();
        return false;
    }
    $('.deleteMaterial').click(function(e) {
        if ($(e.currentTarget).hasClass('OK')) {
            $.ajax({
                type: "POST",
                url: "/material/delete",
                data: 'materialId=' + idDeleteMaterial,
                success: function (data) {
                    if(data != "NG" ){
                        divDeleteMaterial.remove();
                        idDeleteMaterial = null ;
                    } else {
                        console.log("Error");
                    }
                }
            });
            $(".delete-Material").animate({"top":"-100%"},500);
            $(".wrap-pop").remove();
        } else {
            $(".delete-Material").animate({"top":"-100%"},500);
            $(".wrap-pop").remove();
        }
    });
</script>
</body>
</html>
