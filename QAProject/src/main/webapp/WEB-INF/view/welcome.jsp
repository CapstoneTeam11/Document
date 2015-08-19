<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/25/2015
  Time: 3:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/resource/assets/bootstrap-3.3.4/css/bootstrap.min.css">

    <!-- Boostrap Theme Style -->
    <link rel="stylesheet" href="/resource/assets/bootstrap-3.3.4/css/bootstrap-theme.min.css">

    <!-- Notification Style -->
    <link rel="stylesheet" href="/resource/assets/css/notification.css">

    <!-- Favicons -->
    <link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">

    <!-- Validator -->
    <link rel="stylesheet" href="/resource/assets/css/bootstrapValidator.css">
    <style>
    </style>

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
            <form action="/login" method="post" id="loginForm">
                <div class="row">
                    <div class="col-md-3">
                        <div class="logo"><a href="/"><img alt="" src="/resource/assets/images/logoL.png"></a></div>
                    </div>
                    <div class="col-md-4"></div>
                    <div class="col-md-2">
                        <div class="row" style="color: #ffffff;padding-top: 10px;padding-left: 15px;">Email</div>
                        <input type="text" style="height: 30px; margin-bottom: 5px" id="username1" data-toggle="tooltip" name="username" tabindex="1">
                        <div class="checkbox" style="color: white; margin-top: 5px;font-size: 13px;">
                            <label><input type="checkbox" value="" checked>Remember me</label>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="row" style="color: #ffffff;padding-top: 10px;padding-left: 15px;">Password</div>
                        <input type="password" style="height: 30px; margin-bottom: 4px" id="password1" data-toggle="tooltip" name="password" tabindex="2">
                        <a href="#" style="color: white;font-size: 12px;" id="lost-password-click">
                            <%--Forget ?--%>
                        </a>
                    </div>
                    <div class="col-md-1" style="padding-top: 25px">
                        <%--<a href="javascript:checkLogin();" class="button small color" style="height: 30px">Login</a>--%>
                        <input type="submit" id="" value="Login"
                               class="button color small submit" tabindex="3">
                    </div>
                </div>
            </form>
        </section><!-- End container -->
    </header><!-- End header -->



    <section class="container main-content">
        <div class="login">
            <div class="row">
                <div class="col-md-6">
                    <div class="page-content page-shortcode">
                        <div class="box_icon">
                            <span class="t_center icon_i"><span class="icon_circle" icon_size="50" span_bg="#1abc9c" span_hover="#34495e" style="height: 50px; width: 50px; font-size: 25px; line-height: 50px; background-color: rgb(26, 188, 156);"><i class="icon-bullhorn"></i></span></span>
                            <div class="t_center">
                                <h3>Welcome to Ask me</h3>
                                <p>Ask me is a question and answer site for teachers and students.<br>It's built and
                                    run as a supported tool to help lack of discussion time at school.<br> With your help, we're working together to build a library of detailed answers to every question</p>
                            </div>
                        </div>
                    </div>
                </div><!-- End col-md-6 -->
                <div class="col-md-6">
                    <div class="page-content">
                        <h2>
                            Register Now
                            <span style="float: right;font-size: 12px;color: black;margin-top: 12px;">
                                (<span style="color:red">*</span>) required filed
                            </span>
                        </h2>
                        <form method="POST"  class="form-style form-style-3 form-style-5" id="registrationForm" action="/register">
                            <div class="form-inputs clearfix">
                                <%--<div class="row" style="margin-top: 10px;">--%>
                                <%--<div class="form-group">--%>
                                <%--<label class="col-md-3 control-label">Username<span>*</span></label>--%>
                                <%--<div class="col-md-9">--%>
                                <%--<input type="text" value="" aria-required="true" id="username" name="username" class="form-control">--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="text-align: right">
                                            Email<span style="color:red">*</span>
                                        </label>
                                        <div class="col-md-9">
                                            <div class="row">
                                                <input type="text" value="" aria-required="true" id="email"
                                                       name="email" style="width: 100%" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="padding-top: 10px; text-align: right">
                                            Password<span style="color:red">*</span>
                                        </label>
                                        <div class="col-md-9">
                                            <div class="row" style="margin-top:10px">
                                                <input type="password" value="" aria-required="true" id="password"
                                                       name="password"  style="width: 100%" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="text-align: right">
                                            Confirm password<span style="color:red">*</span>
                                        </label>
                                        <div class="col-md-9">
                                            <div class="row" style="margin-top: 10px">
                                                <input type="password" value="" aria-required="true" id="confirm_password"
                                                       name="confirm_password"  style="width: 100%" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="padding-top: 10px; text-align:
                                         right">
                                            Specialty<span style="color:red">*</span>
                                        </label>
                                        <div class="col-md-9">
                                            <div class="row" style="margin-top: 10px">
                                                <span class="styled-select"  style="width: 100%">
                                                    <select id="professional" name="cate"
                                                            title="Please choose your specialty." required>
                                                        <option value="">Select your specialty</option>
                                                        <c:forEach var="parent" items="${categories}">
                                                            <c:if test="${parent.parentId==0}">
                                                                <optgroup label="${parent.categoryName}">
                                                                    <c:forEach var="child" items="${categories}">
                                                                        <c:if test="${child.parentId==parent.id}">
                                                                            <option value="${child.id}">${child.categoryName}</option>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </optgroup>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;">
                                    <label class="col-md-3 control-label" style="margin-top: 18px; text-align: right">
                                        You are<span style="color:red">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="radio">
                                                    <label><input type="radio" name="role" style="width: auto;" value="student" checked>Student</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="radio">
                                                    <label><input type="radio" name="role" style="width: auto;" value="teacher">Teacher</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 10px;">
                                <label class="col-md-3 control-label"></label>
                                <div class="col-md-9">
                                    <div class="row"><input  name="submit" type="submit" value="Register"
                                                             class="submit button medium color" style="width: 100%;">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div><!-- End page-content -->
                </div><!-- End col-md-6 -->
            </div><!-- End row -->
        </div><!-- End login -->
    </section>


</div><!-- End wrap -->
<!-- End wrap -->


<!-- js -->
<script src="/resource/assets/js/jquery.min.js"></script>
<script src="/resource/assets/bootstrap-3.3.4/js/bootstrap.min.js"></script>
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
<script src="/resource/assets/js/jquery.validate.min.js"></script>
<!-- End js -->
<script type="application/javascript">
    $(document).ready(function() {
        //Jquery validator for Register - MinhKH
        $('#registrationForm').validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true,
                    minlength: 8,
                    maxlength: 50
                },
                confirm_password: {
                    required: true,
                    minlength: 8,
                    maxlength: 50,
                    equalTo: "#password"
                }
            },
            messages: {
                email: "Please enter a valid email address.",
                password: {
                    required: "Please provide a password.",
                    minlength: "Your password must be between 8 and 50 characters long.",
                    maxlength: "Your password must be between 8 and 50 characters long."
                },
                confirm_password: {
                    required: "Please provide a password.",
                    minlength: "Your password must be between 8 and 50 characters long.",
                    maxlength: "Your password must be between 8 and 50 characters long.",
                    equalTo: "Please enter the same password as above."
                }
            }
        });


        $('[data-toggle="tooltip"]').tooltip();
//        $('#registrationForm').formValidation({
//            framework: 'bootstrap',
//            icon: {
//                valid: 'glyphicon glyphicon-ok',
//                invalid: 'glyphicon glyphicon-remove',
//                validating: 'glyphicon glyphicon-refresh'
//            },
//            err: {
//                // You can set it to popover
//                // The message then will be shown in Bootstrap popover
//                container: 'tooltip'
//            },
//            fields: {
//                username: {
//                    validators: {
//                        notEmpty: {
//                            message: 'The username is required'
//                        },
//                        stringLength: {
//                            min: 6,
//                            max: 30,
//                            message: 'The username must be more than 6 and less than 30 characters long'
//                        },
//                        regexp: {
//                            regexp: /^[a-zA-Z0-9_\.]+$/,
//                            message: 'The username can only consist of alphabetical, number, dot and underscore'
//                        }
//                    }
//                },
//                email: {
//                    err: 'tooltip',
//                    validators: {
//                        notEmpty: {
//                            message: 'The email address is required'
//                        },
//                        emailAddress: {
//                            message: 'The input is not a valid email address'
//                        }
////                        regexp: {
////                            regex: /^[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+.[a-zA-Z]{2,4}/,
////                            message: 'The email format incorrect'
////                        }
//                    }
//                },
//                password: {
//                    validators: {
//                        notEmpty: {
//                            message: 'The password is required'
//                        },
//                        stringLength: {
//                            min: 8,
//                            message: 'The username must be more than 8 characters'
//                        },
//                        different: {
//                            field: 'username',
//                            message: 'The password cannot be the same as username'
//                        },
//                        identical: {
//                            field: 'confirm-password',
//                            message: 'The password and its confirm must be the same'
//                        }
//                    }
//                }
//            }
//        })
//        .on('success.form.fv', function(e) {
//////            // Prevent form submission
////                e.preventDefault();
////
////                var $form = $(e.target),
////                fv    = $(e.target).data('formValidation');
////
////                // Do whatever you want here ...
////
////                // Then submit the form as usual
////                fv.defaultSubmit();
//        });
    });
    function register() {
//        var username = $('#username').val();
        var password = $('#password').val();
        var email = $('#email').val();
        var role = $("input[name='role']:checked").val();
        var cate = $("#professional option:selected").val();
        var user = {email: email, password: password, role: role, cate: cate};
        var url = "/register";
        $.ajax({
            type: "POST",
            url: url,
            data: user,
            success: function (data) {
                if(data.status == "OK" && data.id == 2){
                    window.location.href="/teacherdashboardWelcome";
                }else  if(data.status == "OK" && data.id == 1){
                    window.location.href="/newsfeed/welcome";
                }
                else  if(data.status == "Exist email"){
                    alert("Exist email");
                }else {
                    alert("Username or password is incorrect!");
                }
            }
//            dataType: dataType
        });
    }
    function checkLogin(){
        var username = $('#username1').val();
        var password = $('#password1').val();
        if(username == null || username == ""){
            $('#username1').attr('placeholder', "Enter username!");
            return;
        }
        if(password == null || password == ""){
            $('#username1').attr('placeholder', "Enter password!");
            return;
        }
        login();
    }
    function login(){
        var username = $('#username1').val();
        var password = $('#password1').val();
        var url = "/login";
        $.ajax({
            type: "POST",
            url: url,
            data: "username="+username+"&password="+password,
            success: function(data){
                if(data.status == "OK" && data.id == 2){
                    window.location.href="/teacherdashboard";
                }else  if(data.status == "OK" && data.id == 1){
                    window.location.href="/studentdashboard";
                }else {
                    alert("Username or password is incorrect!");
                }
            }
        });
    }
</script>
</body>
</html>