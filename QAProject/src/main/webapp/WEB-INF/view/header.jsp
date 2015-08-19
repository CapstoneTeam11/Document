<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 6/4/2015
  Time: 5:12 PM
  To change this template use File | Settings | File Templates.
--%>
<div class="navbar navbar-fixed-top">
    <header id="header" style="height: 50px">
        <section class="container clearfix">
            <div class="logo"
                 style="line-height: 50px"><a href="/newsfeed"><img alt="" src="/resource/assets/images/logo.png"></a></div>
            <c:if test="${sessionScope.user!=null}">
            <c:if test="${sessionScope.user.roleId.id!=3}">
            <nav class="">
                <ul class="nav nav-pills notification" >
                    <li class="dropdown pull-right">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="color : white;" id="notifiDropdown"><i class="icon-globe" style="font-size: 22px;"></i><span style="color: #ff7361" id="countNotifi"></span></a>
                        <!--UPDATE ICON-->
                        <ul class="dropdown-menu" style="min-width : 414px;">
                            <input type="hidden" value="${sessionScope.user.id}" id="userIdFlag">
                            <li class="notification-li"><div class="notification-all"><div style="margin-left: 10px;"><a class="notification-user">Notification</a></div></div></li>
                            <ul class="scrollable-menu" id="notificationAppend" style="min-width : 414px;">
                            </ul>
                                <div class="notification-all"><div style="margin-left: 10px;"><a href="/notification/all" class="notification-user">See all unread</a></div></div>
                        </ul>
                    </li>
                </ul>
            </nav>
            </c:if>
            <nav class="navigation" style="margin-top: -18px">
                <ul>
                    <c:if test="${sessionScope.user.roleId.id!=3}">
                    <li><a href="/newsfeed">News feed</a></li>
                    </c:if>
                    <li class="parent-list" style="margin-right: 5px"><a>Hi, ${sessionScope.user.displayName} <span class="menu-nav-arrow"></span></a>
                        <ul style="overflow: hidden; height: auto; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px; display: none;">
                            <c:if test="${sessionScope.user.roleId.id!=3}">
                            <li><a href="/dashboard">Dashboard</a></li>
                            </c:if>
                            <c:if test="${sessionScope.user.roleId.id==1}">
                            <li><a href="/material">Material</a></li>
                            </c:if>
                            <c:if test="${sessionScope.user.roleId.id==2}">
                                <li><a href="/tracking">Tracking</a></li>
                            </c:if>
                            <c:if test="${sessionScope.user.roleId.id!=3}">
                            <li><a href="/profile/view/${sessionScope.user.id}">Profile</a></li>
                            </c:if>
                            <c:if test="${sessionScope.user.roleId.id==3}">
                                <li><a href="/search?filter=0&searchKey=">Search</a></li>
                                <li><a href="/manage/1">Manage</a></li>
                            </c:if>
                            <li><a href="/logout">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            </c:if>
        </section><!-- End container -->
    </header><!-- End header -->
</div> <!-- End fixed container for header-->

