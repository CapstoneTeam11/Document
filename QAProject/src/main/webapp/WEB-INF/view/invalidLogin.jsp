<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 6/15/2015
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <title>Ask me – Responsive Questions and Answers Template</title>
    <meta name="description" content="Ask me Responsive Questions and Answers Template">
    <meta name="author" content="2code.info">



    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Main Style -->
    <link rel="stylesheet" href="/resource/assets/css/style.css">

    <!-- Skins -->
    <link rel="stylesheet" href="/resource/assets/css/skins/skins.css">

    <!-- Responsive Style -->
    <link rel="stylesheet" href="/resource/assets/css/responsive.css">

    <!-- Boostrap Style -->
    <link rel="stylesheet" href="/resource/assets/css/bootstrap.min.css">

    <!-- Boostrap Theme Style -->
    <link rel="stylesheet" href="/resource/assets/css/bootstrap-theme.min.css">

    <!-- Notification Style -->
    <link rel="stylesheet" href="/resource/assets/css/notification.css">

    <!-- Favicons -->
    <link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">
    <link rel="stylesheet" href="/resource/assets/js/bootstrap-tagsinput.css">
    <link rel="stylesheet" href="/resource/assets/css/tag.css">

</head>

<body>

<div class="loader"><div class="loader_html"></div></div>

<div id="wrap">
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

    <header id="header" class="index-no-box">
        <section class="container clearfix">
                <div class="row">
                    <div class="col-md-3">
                        <div class="logo"><a href="/"><img alt="" src="/resource/assets/images/logoL.png"></a></div>
                    </div>
                    <div class="col-md-4"></div>
                </div>
        </section><!-- End container -->
    </header>

    <section class="container main-content">
        <div class="login">
            <div class="row">
                <div class="col-md-3">

                </div><!-- End col-md-3 -->
                <div class="col-md-6">
                    <div class="page-content">
                        <c:if test="${banned==null}">
                        <h2>
                            Login
                            <span style="float: right;font-size: 12px;color: red;margin-top: 12px;">
                               Invalid email or password</span>
                        </h2>
                        <form method="POST"  class="form-style form-style-3 form-style-5" id="loginForm" action="/login">
                            <div class="form-inputs clearfix">
                                <div class="row" style="margin-top: 10px;">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Email</label>
                                        <div class="col-md-9">
                                            <div class="row">
                                                <input type="text" value="" aria-required="true" id="email" style="width: 100%" name="username" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Password</label>
                                        <div class="col-md-9">
                                            <div class="row">
                                                <input type="password" value="" aria-required="true" id="password" style="width: 100%" name="password" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 10px;">
                                <div class="form-group">
                                    <label class="col-md-3 control-label"></label>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <input name="submit" type="submit"
                                                   value="Login" class="submit button medium color" style="width: 100%">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        </c:if>
                        <c:if test="${banned!=null}">
                            <h2>
                                Login
                            <span style="float: right;font-size: 12px;color: red;margin-top: 12px;">
                               Your account have been banned</span>
                            </h2>
                        </c:if>
                    </div><!-- End page-content -->
                </div><!-- End col-md-6 -->
            </div><!-- End row -->
        </div><!-- End login -->
    </section><!-- End container -->

</div><!-- End wrap -->

<!-- js -->
<script src="/resource/assets/ckeditor/ckeditor.js"></script>
<script src="/resource/assets/js/jquery.min.js"></script>
<script src="/resource/assets/js/bootstrap.min.js"></script>
<script src="/resource/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/resource/assets/js/jquery.easing.1.3.min.js"></script>
<script src="/resource/assets/js/html5.js"></script>
<script src="/resource/assets/js/twitter/jquery.tweet.js"></script>
<script src="/resource/assets/js/jflickrfeed.min.js"></script>
<script src="/resource/assets/js/jquery.inview.min.js"></script>
<script src="/resource/assets/js/jquery.tipsy.js"></script>
<script src="/resource/assets/js/tabs.js"></script>
<script src="/resource/assets/js/jquery.flexslider.js"></script>
<script src="/resource/assets/js/jquery.prettyPhoto.js"></script>
<script src="/resource/assets/js/jquery.carouFredSel-6.2.1-packed.js"></script>
<script src="/resource/assets/js/jquery.scrollTo.js"></script>
<script src="/resource/assets/js/jquery.nav.js"></script>
<script src="/resource/assets/js/tags.js"></script>
<script src="/resource/assets/js/jquery.bxslider.min.js"></script>
<script src="/resource/assets/js/custom.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.min.js"></script>
<script src="/resource/assets/js/bootstrap-tagsinput.js"></script>
<script src="/resource/assets/js/bootstrap-tagsinput.min.js"></script>
<script src="/resource/assets/js/bootstrapValidator.js"></script>
<script src="/resource/assets/js/validator.js"></script>
<!-- End js -->

<script>
    $(document).ready(function () {
    })

</script>
</body>
</html>
