<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/17/2015
  Time: 8:31 AM
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

    <link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Main Style -->
    <link rel="stylesheet" href="/resource/assets/css/style.css">

    <!-- Skins -->
    <link rel="stylesheet" href="/resource/assets/css/skins/skins.css">

    <!-- Responsive Style -->
    <link rel="stylesheet" href="/resource/assets/css/responsive.css">

    <!-- Favicons -->
    <link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">

</head>
<style>
    .dropdown-menu {
        margin: -2px 0 0;
        border-radius: 0px;
    }
    .scrollable-menu {
        height: auto;
        max-height: 300px;
        overflow-x: hidden;
    }
    .mail-avatar {
        width: 40px;
        height: 40px;
        border-radius: 24px;
        float: left;

    }
    .notification-li {

        border-bottom: 1px solid #DFDFDF;
    }
    .notification-all {
        margin-top: 5px;
        margin-bottom: 5px;
        display: flex;
        padding: 3px 20px;
        clear: both;
        white-space: nowrap;
    }
    .notification-user {
        padding: 0;
        overflow: inherit;
        display: inline-block;
        font-size: 14px;
        color: #f68484;
        font-weight: 700;
    }
    .notification-action {
        color: #bfc5cf;
        width: 300px;
        word-wrap: break-word;
        white-space: normal;
        display: initial;
    }

    .notification-link {
        font-weight: 700;
        color: #71d398;

    }
    .notification .open>a, .notification .open>a:focus, .notification .open>a:hover {
        background-color: #55A6BC;
        border-color: #337ab7;
    }
    .notification>li>a:focus, .notification>li>a:hover {
        text-decoration: none;
        background-color: #55A6BC;
    }
    .notification {
        float: right;
        line-height: 1;
        position: relative;
        height: 100%;
        font-size: 14px;
        font-weight: bold;
        margin-top: 22px;
        margin-right: 5px;
    }
</style>
<body>

<div class="loader"><div class="loader_html"></div></div>

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


<header id="header">
    <section class="container clearfix">
        <div class="logo"><a href="/"><img alt="" src="/resource/assets/images/logo.png"></a></div>
        <nav class="">
            <ul class="nav nav-pills notification" >
                <li class="dropdown pull-right">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="color : white;"><i class="icon-globe" style="font-size: 22px;"></i><span style="color: #ff7361"> 15</span></a>
                    <!--UPDATE ICON-->
                    <ul class="dropdown-menu scrollable-menu" style="min-width : 414px;">
                        <li class="notification-li"><div class="notification-all"><div style="margin-left: 10px;"><a class="notification-user">Notification</a></div></div></li>
                        <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                        <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                        <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class Create a new post in ABC Class Create a new post in ABC Class Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                        <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Want To join <a class="notification-link" style="display : inline-block;">ABC Class</a></div><div></div><a href="#" class="button small blue-button" style="">Approve</a><a href="#" class="button small red-button" style="">Reject</a></div></div></li>
                        <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                        <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                        <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class Create a new post in ABC Class Create a new post in ABC Class Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                        <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Want To join <a class="notification-link" style="display : inline-block;">ABC Class</a></div><div></div><a href="#" class="button small blue-button" style="">Approve</a><a href="#" class="button small red-button" style="">Reject</a></div></div></li>
                        <div class="notification-all"><div style="margin-left: 10px;"><a href="#" class="notification-user">See All</a></div></div>
                    </ul>

                </li>

            </ul>
        </nav>
        <nav class="navigation">
            <ul>
                <li class="current_page_item"><a href="index.html">Home</a></li>
                <li class="ask_question"><a href="ask_question.html">Dashboard</a></li>
                <li><a href="#">Your profile</a></li>
                <li><a href="contact_us.html">About Us</a></li>
            </ul>
        </nav>
    </section><!-- End container -->
</header><!-- End header -->

<div class="breadcrumbs">
    <section class="container" style="height:70px">
        <div class="row">
            <div class="col-md-12">
                <h3>Home</h3>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content">
<div class="clearfix"></div>
<div class="row">
<div class="col-md-12">

    <div class="row">
        <div class="" style="padding-left: 15px">
            <input type="text" aria-required="true" value="Find article, question, class or teacher here..." onfocus="if(this.value=='Find article, question, class or teacher here...')this.value='';"
                   onblur="if(this.value=='')this.value='Find article, question, class or teacher here...';" style="width: 90%; margin-top:5px; float: left">
        </div>
        <div class="">
            <a href="#" class="button small color" style="padding-bottom: 9px">Search</a>
        </div>
    </div>

    <div class="tabs-warp question-tab">
        <ul class="tabs">
            <li class="tab"><a href="#" class="current">Questions</a></li>
            <li class="tab"><a href="#">Articles</a></li>
            <li class="tab"><a href="#">Class</a></li>
            <li class="tab"><a href="#">Teacher</a></li>

        </ul>
        <div class="tab-inner-warp">
            <div class="tab-inner">
                <article class="question question-type-normal">
                    <h2>
                        <a href="single_question.html">This is my first Question</a>
                    </h2>
                    <div class="question-author">
                        <a href="#" original-title="ahmed" class="question-author-img tooltip-n"><span></span><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/avatar.png"></a>
                    </div>
                    <div class="question-inner">
                        <div class="clearfix"></div>
                        <p class="question-desc">Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit.</p>
                        <div class="question-details">
                            <span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>
                        </div>
                        <span class="question-date"><i class="icon-time"></i>4 mins ago</span>
                        <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
                        <span class="question-category"><a href="#"><i class="icon-user"></i>Teacher: Mr.Nguyen</a></span>
                        <span class="question-comment"><a href="#"><i class="icon-comment"></i>5 Answer</a></span>
                        <div class="clearfix"></div>
                    </div>
                </article>
                <article class="question question-type-normal">
                    <h2>
                        <a href="single_question.html">This is my 2nd Question</a>
                    </h2>
                    <div class="question-author">
                        <a href="#" original-title="ahmed" class="question-author-img tooltip-n"><span></span><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/avatar.png"></a>
                    </div>
                    <div class="question-inner">
                        <div class="clearfix"></div>
                        <p class="question-desc">Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit.</p>
                        <div class="question-details">
                            <span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>
                        </div>
                        <span class="question-date"><i class="icon-time"></i>4 mins ago</span>
                        <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
                        <span class="question-category"><a href="#"><i class="icon-user"></i>Teacher: Mr.Nguyen</a></span>
                        <span class="question-comment"><a href="#"><i class="icon-comment"></i>5 Answer</a></span>
                        <div class="clearfix"></div>
                    </div>
                </article>
                <article class="question question-type-normal">
                    <h2>
                        <a href="single_question.html">This is my 3rd Question</a>
                    </h2>
                    <div class="question-author">
                        <a href="#" original-title="ahmed" class="question-author-img tooltip-n"><span></span><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/avatar.png"></a>
                    </div>
                    <div class="question-inner">
                        <div class="clearfix"></div>
                        <p class="question-desc">Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit.</p>
                        <div class="question-details">
                            <span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>
                        </div>
                        <span class="question-date"><i class="icon-time"></i>4 mins ago</span>
                        <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
                        <span class="question-category"><a href="#"><i class="icon-user"></i>Teacher: Mr.Nguyen</a></span>
                        <span class="question-comment"><a href="#"><i class="icon-comment"></i>5 Answer</a></span>
                        <div class="clearfix"></div>
                    </div>
                </article>
                <a href="#" class="load-questions"><i class="icon-refresh"></i>Load More Questions</a>
            </div>
        </div>
        <div class="tab-inner-warp">
            <div class="tab-inner">
                <article class="post clearfix">
                    <div class="post-inner">
                        <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="single_post.html">Post Without Image.</a></h2>
                        <div class="post-meta">
                            <span class="meta-author"><i class="icon-user"></i><a href="#">Teacher: Mr.Thang</a></span>
                            <span class="meta-date"><i class="icon-time"></i>September 30 , 2013</span>
                            <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">15 comments</a></span>
                            <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
                        </div>
                        <div class="post-content">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi.</p>
                            <a href="single_post.html" class="post-read-more button color small">Continue reading</a>
                        </div><!-- End post-content -->
                    </div><!-- End post-inner -->
                </article>
                <article class="post clearfix">
                    <div class="post-inner">
                        <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="single_post.html">Post Without Image.</a></h2>
                        <div class="post-meta">
                            <span class="meta-author"><i class="icon-user"></i><a href="#">Teacher: Mr.Thang</a></span>
                            <span class="meta-date"><i class="icon-time"></i>September 30 , 2013</span>
                            <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">15 comments</a></span>
                            <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
                        </div>
                        <div class="post-content">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi.</p>
                            <a href="single_post.html" class="post-read-more button color small">Continue reading</a>
                        </div><!-- End post-content -->
                    </div><!-- End post-inner -->
                </article>
                <article class="post clearfix">
                    <div class="post-inner">
                        <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="single_post.html">Post Without Image.</a></h2>
                        <div class="post-meta">
                            <span class="meta-author"><i class="icon-user"></i><a href="#">Teacher: Mr.Thang</a></span>
                            <span class="meta-date"><i class="icon-time"></i>September 30 , 2013</span>
                            <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">15 comments</a></span>
                            <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
                        </div>
                        <div class="post-content">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi.</p>
                            <a href="single_post.html" class="post-read-more button color small">Continue reading</a>
                        </div><!-- End post-content -->
                    </div><!-- End post-inner -->
                </article>
                <article class="post clearfix">
                    <div class="post-inner">
                        <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="single_post.html">Post Without Image.</a></h2>
                        <div class="post-meta">
                            <span class="meta-author"><i class="icon-user"></i><a href="#">Teacher: Mr.Thang</a></span>
                            <span class="meta-date"><i class="icon-time"></i>September 30 , 2013</span>
                            <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">15 comments</a></span>
                            <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
                        </div>
                        <div class="post-content">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi.</p>
                            <a href="single_post.html" class="post-read-more button color small">Continue reading</a>
                        </div><!-- End post-content -->
                    </div><!-- End post-inner -->
                </article>
                <a href="#" class="load-questions"><i class="icon-refresh"></i>Load More Articles</a>
            </div>
        </div>
        <div class="tab-inner-warp">
            <div class="tab-inner">
                <div class="about-author clearfix">
                    <div class="" style="float: left;padding-right: 20px;">
                        <a href="#" original-title="admin" class=""><img alt="" src="http://steinhardt.nyu.edu/scmsAdmin/media/users/il30/icons_facultyresources/classroom-01.png"></a>
                    </div>
                    <a class="" href="#" style="float: right">Join class</a>
                    <div class="author-bio">
                        <h4><a href="#">Advance Java class</a></h4>
                        This is introduction of Advance Java class: advance java advance java advance java advance java advance java
                    </div>
                </div>
                <div class="about-author clearfix">
                    <div class="" style="float: left;padding-right: 20px;">
                        <a href="#" original-title="admin" class=""><img alt="" src="http://steinhardt.nyu.edu/scmsAdmin/media/users/il30/icons_facultyresources/classroom-01.png"></a>
                    </div>
                    <a class="" href="#" style="float: right">Join class</a>
                    <div class="author-bio">
                        <h4><a href="#">Advance Java class</a></h4>
                        This is introduction of Advance Java class: advance java advance java advance java advance java advance java
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-inner-warp">
            <div class="tab-inner">
                <div class="about-author clearfix">
                    <div class="author-image">
                        <a href="#" original-title="admin" class="tooltip-n"><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg"></a>
                    </div>
                    <a class="" href="#" style="float: right">Follow</a>
                    <div class="author-bio">
                        <h4><a href="#">Johnny Walker</a></h4>
                        I'm teaching at FPT University. My professional are Java, C# and SQL
                    </div>
                </div>
                <div class="about-author clearfix">
                    <div class="author-image">
                        <a href="#" original-title="admin" class="tooltip-n"><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg"></a>
                    </div>
                    <a class="" href="#" style="float: right">Follow</a>
                    <div class="author-bio">
                        <h4><a href="#">Paul Smith</a></h4>
                        I'm English teacher at Hoa Sen University. I can help you improve your speaking and writing for TOELF test.
                    </div>
                </div>
            </div>
        </div>
    </div><!-- End page-content -->
</div><!-- End main -->

</div><!-- End row -->
</section><!-- End container -->

<footer id="footer">
    <section class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="widget widget_contact">
                    <h3 class="widget_title">Where We Are ?</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu.</p>
                </div>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</footer><!-- End footer -->
</div><!-- End wrap -->
<!-- End wrap -->
<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<script src="/resource/assets/js/jquery.min.js"></script>
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
<!-- End js -->

</body>
</html>