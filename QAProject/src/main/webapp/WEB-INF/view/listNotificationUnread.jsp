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


    <%@include file="header.jsp" %>

    <div class="breadcrumbs" style="margin-top: 86px">
        <section class="container" style="height:70px; display: flex; align-items: center">
            <div class="row">
                <div class="col-md-12">
                    <h3>Notifications unread</h3>
                </div>
            </div><!-- End row -->
        </section><!-- End container -->
    </div><!-- End breadcrumbs -->

    <section class="container main-content page-left-sidebar">
        <div class="row">
            <div class="col-md-9">
                <label>Notification unview</label>
                    <c:if test="${empty notifications}">
                        <div style="width: 70%;height: 50px">
                            <span style="font-size: 26px;font-weight: bold;color: rgb(85, 166, 188)">Dont have any notification</span>
                        </div>
                    </c:if>
                    <c:if test="${not empty notifications}">
                        <c:forEach var="notification" items="${notifications}">
                            <div style="border-bottom: 1px solid;width: 70%">
                                <a href="${notification.href}">
                                    <span><img src="${notification.senderAvatar}" style="width: 30px;height: 30px;margin-bottom: 6px"></span>
                                    <span>${notification.senderDisplayName}</span><span> ${notification.content}</span>
                                </a>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${not empty notifications}">
                    <div class="markAllRead">
                        <form action="/notification/mark/all" method="post">
                            <input name="submit" type="submit" id="submit" value="Mark all read"
                                   class="button small color">
                        </form>
                    </div>
                    </c:if>
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
<!-- End wrap -->
<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<%@include file="js.jsp" %>
<script src="/resource/assets/js/notification.js"></script>
<script src="/resource/assets/js/jquery.jqpagination.js"></script>
<script>
