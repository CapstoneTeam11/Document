
<%@include file="css.jsp" %>
<div id="wrap">
<div class="panel-Confirm remove-Student">
    <h2>Remove student</h2>
    <div>
        <p class="panelMessage">Do you want to remove this student?</p>
        <p>
            <input type="submit" value="Cancel"  class="button color small cancel panelButton" >
            <input type="submit" value="OK"  class="button color small OK panelButton" style="margin-left: 3%;">
        </p>
        <div class="clearfix"></div>
    </div>
</div>
<div class="panel-Confirm leave-Classroom">
    <h2>Leave Classroom</h2>
    <div>
        <p class="panelMessage">Do you want to leave this classroom?</p>
        <p>
            <input type="submit" value="Cancel"  class="button color small cancel panelLeaveButton" >
            <input type="submit" value="OK"  class="button color small OK panelLeaveButton" style="margin-left: 3%;">
        </p>
        <div class="clearfix"></div>
    </div>
</div>
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
<div class="panel-pop" id="addMaterial">
    <h2>Upload Material<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <form method="post" action="/upload" enctype="multipart/form-data" id="formUpload">
            <div style="display: flex; margin-bottom: 20px">
                <div class="col-md-2">
                    <label class="required" style="padding-top:10px">Tag<span>*</span></label>
                </div>
                <div class="col-md-10" id="divTagSuggest">
                    <input type="text" class="input" name="tag" id="tagsuggest"/>
                </div>
                <div id="hiddenTag"></div>
            </div>
            <div>
                <div class="col-md-2">
                    <label class="required">File<span>*</span></label>
                </div>
                <div class="col-md-10 form-inputs clearfix">
                    <p>
                        <input type="file" name="fileUpload" size="50" required="true" id="fileUpload">
                        <label>If you want to update already material , just upload material has the same name and extension</label>
                    </p>
                </div>
            </div>
            <div class="form-inputs clearfix" id="errorUpload">
            </div>
            <div class="col-md-10 col-md-offset-2">
            <p class="form-submit">
                <c:if test="${classroom.status == 1}">
                    <input type="submit" value="Upload" id="materialSubmit" class="button color small submit">
                </c:if>
                <input type="hidden" name="classId" value="${classroom.id}">
            </p>
            </div>
        </form>
        <div class="clearfix"></div>
    </div>
</div><!-- End upload material -->

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
                <h3 style="margin-top: 15px">${classroom.classroomName}</h3>
                <h5 style="margin-top: 15px">
                    <a href="/search?filter=4&searchKey=" style="color: white;">Classroom</a> /
                    <span style="color: #2f3239;">${classroom.classroomName}</span>
                </h5>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar" style="min-height: 260px">
<div class="row">
<div class="col-md-9">
    <div class="clearfix"></div>
    <div class="row">
    <div class="col-md-6 col-sm-6">
        <form method="GET" action="/classroom/search">
        <input type="hidden" value="${classroom.id}" name="classroomId">
        <input type="text" aria-required="true" value="Search in ${classroom.classroomName} class" onfocus="if(this.value=='Search in ${classroom.classroomName} class')this.value='';"
               onblur="if(this.value=='')this.value='Search in ${classroom.classroomName} class';"
               style="width: 100%" name="searchKey">
        </form>
    </div>
    <div class="col-md-6 col-sm-6" id="createPost">
        <c:if test="${classroom.ownerUserId.id == user.id || sessionScope.user.roleId.id==3}">
            <div class="col-md-11 col-sm-9">
                <c:if test="${classroom.status == 1 && classroom.ownerUserId.id == user.id}">
                    <a href="/post/create/${classroom.id}" class="button medium green-button" style="float: right"><i class="icon-pencil"></i> Create post</a>
                </c:if>
            </div>
            <div class="" style="margin-top: 20px; float: right">
                <div class="btn-group">
                    <a data-toggle="dropdown" href="" aria-expanded="false"><i class="icon-cog" style="color: black;font-weight: bold;font-size: 20px;"></i><span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu" style="left: -127px;" id="activeBtn">
                        <c:if test="${classroom.status == 1}">
                            <c:if test="${classroom.ownerUserId.id == user.id || sessionScope.user.roleId.id!=3}">
                            <li><a href="/updateClass/${classroom.id}">Update class</a></li>
                            </c:if>
                            <c:if test="${classroom.ownerUserId.id == user.id || sessionScope.user.roleId.id==3}">
                            <li><a href="javascript:closeClass(${classroom.id}, 0);">Close class</a></li>
                            </c:if>
                        </c:if>
                        <c:if test="${classroom.status == 0}">
                            <c:if test="${classroom.ownerUserId.id == user.id || sessionScope.user.roleId.id==3}">
                            <li><a href="javascript:closeClass(${classroom.id}, 1);">Reopen class</a></li>
                            </c:if>
                        </c:if>
                    </ul>
                </div>
            </div>
        </c:if>
        <c:if test="${not empty checkClassroomUser}">
            <c:if test="${checkClassroomUser.approval!=2 && checkClassroomUser.approval!=0 && classroom.status==1}">
                <a href="/post/create/${classroom.id}" class="button medium green-button" style="float: right"><i class="icon-pencil"></i> Create post</a>
            </c:if>
        </c:if>
    </div>

    </div>


<div class="tabs-warp question-tab">
<ul class="tabs">
    <li class="tab"><a href="#" class="current">Question</a></li>
    <li class="tab"><a href="#">Article</a></li>
    <li class="tab"><a href="#">Material</a></li>
    <li class="tab"><a href="#">Student</a></li>
    <c:if test="${user.id==classroom.ownerUserId.id}">
        <li class="tab"><a href="#">Join Request</a></li>
    </c:if>
</ul>

<div class="tab-inner-warp">
    <div class="tab-inner" id="questions">
        <c:if test="${not empty questions}">
            <c:if test="${sessionScope.user.id == classroom.ownerUserId.id && fn:length(questions)>1 &&
            classroom.status==1 }">
                <div class="col-md-4 col-sm-6" style="float: right;">
                    <a href="/post/merge/${classroom.id}/70" class="button medium green-button" style="float: right;margin-right: -15px;margin-top: -25px;"><i class="icon-reorder"></i>Merge questions</a>
                </div>
                <div style="height: 15px"></div>
            </c:if>
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
                        <c:if test="${question.similar != null and question.similar > 1}">
                            <div class="similarQuestion">
                                <span class="question-category"><a
                                        href="/post/merge/${question.id}"><i
                                        class="icon-sitemap" style="margin-right: 5px"></i>${question.similar} similar question(s)</a></span>
                            </div>
                        </c:if>
                        <div class="question-inner">
                            <div class="clearfix"></div>
                            <div class="question-desc short-text">${question.body}</div>
                            <div class="question-details">
                                                    <span class="question-answered question-answered-done">
                                                        <c:if test="${question.acceptedAnswerId==1}">
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
                        <c:if test="${question.similar != null and question.similar > 1}">
                            <div class="similarQuestion">
                                <span class="question-category"><a
                                        href="/post/merge/${question.id}"><i
                                        class="icon-sitemap" style="margin-right: 5px"></i>${question.similar} similar question(s)</a></span>
                            </div>
                        </c:if>
                        <div class="question-inner">
                            <div class="clearfix"></div>
                            <div class="question-desc short-text">${question.body}</div>
                            <div class="question-details">
                                                    <span class="question-answered question-answered-done">
                                                        <c:if test="${question.acceptedAnswerId==1}">
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
                                                <c:if test="${question.similar != null and question.similar > 1 }">
                                                    <span class="question-category"><a
                                                            href="/post/merge/${question.id}"><i
                                                            class="icon-sitemap"></i>${question.similar} similar question(s)</a></span>
                                                </c:if>
                            <div class="clearfix"></div>
                        </div>
                    </article>
                </c:forEach>
            </c:if>
        </c:if>
        <c:if test="${empty questions}">
            <div class="about-author clearfix">
                No question.
            </div>
        </c:if>
    </div>
    <c:if test="${fn:length(questions)>10}">
        <div id="loadingQ"
             style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
        <a class="post-read-more button color small"
           style="margin-bottom: 5px;" id="loadMoreQuestion">Load more</a>
    </c:if>
</div>
<div class="tab-inner-warp">
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
        <c:if test="${empty articles}">
            <div class="about-author clearfix">
                No article.
            </div>
        </c:if>
    </div>
    <c:if test="${fn:length(articles)>10}">
        <div id="loadingA"
             style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
        <a class="post-read-more button color small"
           style="margin-bottom: 5px;" id="loadMoreArticle">Load more</a>
    </c:if>
</div>
<div class="tab-inner-warp">
    <div class="tab-inner">
        <c:if test="${classroom.status == 1}">
        <c:if test="${classroom.ownerUserId.id == user.id}">
            <div class="col-md-3 col-sm-6" style="float: right">
                <a href="#" class="button medium green-button"
                   style="float: right;margin-top: -25px;margin-right:-15px;"
                   id="addMaterial-click"><i class="icon-upload"></i> Upload</a>
            </div>
        </c:if>
        </c:if>
        <c:if test="${not empty materials}">
            <table class="table table-hover" id="materials">
                <tr>
                    <th>No</th>
                    <th>File name</th>
                    <th>Uploaded Date</th>
                    <th>Size (KB)</th>
                    <th>Save to</th>
                    <th></th>
                </tr>
                <c:if test="${fn:length(materials)>10}">
                    <c:forEach var="material" items="${materials}" end="9" varStatus="counter">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${material.name}</td>
                            <td>${material.creationDate}</td>
                            <td>${material.size}</td>
                            <td><input type="hidden" value="${material.id}" name="materialId"><c:if test="${sessionScope.user.roleId.id==1}"><a class="add-to-folder-click" onclick="GetListFolder(this);return false" href="#">Folder</a> / </c:if><a href="" onclick="downloadMaterial(this);return false;"> Computer</a></td>
                            <c:if test="${user.id==classroom.ownerUserId.id || user.roleId.id == 3}">
                                <td><form action="/material/delete" method="post" style="display: none"><input type="hidden" name="materialId" value="${material.id}"></form><a href="#" onclick="removeMaterial(this)"><i class="icon-remove"></i> Delete</a></td>
                            </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(materials)<=10}">
                    <c:forEach var="material" items="${materials}" varStatus="counter">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${material.name}</td>
                            <td>${material.creationDate}</td>
                            <td>${material.size}</td>
                            <td><input type="hidden" value="${material.id}" name="materialId"><c:if test="${sessionScope.user.roleId.id==1}"><a class="add-to-folder-click" onclick="GetListFolder(this);return false" href="#">Folder</a> /</c:if> <a href="" onclick="downloadMaterial(this);return false;"> Computer</a></td>
                            <c:if test="${user.id==classroom.ownerUserId.id || user.roleId.id == 3}">
                                <td><form action="/material/delete" method="post" style="display: none"><input type="hidden" name="materialId" value="${material.id}"></form><a href="#" onclick="removeMaterial(this)"><i class="icon-remove"></i> Delete</a></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </c:if>
        <c:if test="${empty materials}">
            <div class="about-author clearfix col-md-12">
                No material.
            </div>
        </c:if>
        <c:if test="${fn:length(materials)>10}">
            <div id="loadingM"
                 style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
            <a class="post-read-more button color small"
               style="margin-bottom: 5px;" id="loadMoreMaterial">Load more</a>
        </c:if>
    </div>
</div>
    <div class="tab-inner-warp">
        <div class="tab-inner" id="students">
            <c:if test="${not empty students}">
                <c:if test="${fn:length(students)>10}">
                    <c:forEach var="student" items="${students}" end="9">
                        <div class="about-author clearfix" id="student${student.classroomUserId}">
                            <div class="author-image">
                                <a href="/profile/view/${student.studentId}" original-title="${student.studentName}"
                                   class="tooltip-n">
                                    <img alt="" src="${student.studentProfileImageURL}"></a>
                            </div>
                            <c:if test="${user.id==classroom.ownerUserId.id}">
                                <a class="removeStudent" id="${student.classroomUserId}"
                                   onclick="removeStudent(this); return false;"
                                   style="float: right; cursor:pointer">Remove</a>
                            </c:if>
                            <div class="author-bio" style="margin-top: 25px">
                                <h4><a href="/profile/view/${student.studentId}">${student.studentName}</a></h4>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(students)<=10}">
                    <c:forEach var="student" items="${students}">
                        <div class="about-author clearfix" id="student${student.classroomUserId}">
                            <div class="author-image">
                                <a href="/profile/view/${student.studentId}" original-title="${student.studentName}"
                                   class="tooltip-n">
                                    <img alt="" src="${student.studentProfileImageURL}"></a>
                            </div>
                            <c:if test="${user.id==classroom.ownerUserId.id}">
                                <a class="removeStudent" id="${student.classroomUserId}"
                                   onclick="removeStudent(this); return false;"
                                   style="float: right; cursor:pointer">Remove</a>
                            </c:if>
                            <div class="author-bio" style="margin-top: 25px">
                                <h4><a href="/profile/view/${student.studentId}">${student.studentName}</a></h4>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${empty students}">
                <div class="about-author clearfix" id="noStudent">
                    No student.
                </div>
            </c:if>
        </div>
        <c:if test="${fn:length(students)>10}">
            <div id="loadingS"
                 style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
            <a class="post-read-more button color small"
               style="margin-bottom: 5px;" id="loadMoreStudent">Load more</a>
        </c:if>
    </div>
<c:if test="${user.id==classroom.ownerUserId.id}">
    <div class="tab-inner-warp">
        <div class="tab-inner" id="requests">
            <c:if test="${not empty requests}">
                <c:if test="${fn:length(requests)>10}">
                    <c:forEach var="request" items="${requests}" end="9">
                        <div class="about-author clearfix" id="request${request.id}">
                            <div class="author-image">
                                <a href="/profile/view/${request.studentId}" original-title="${request.studentName}"
                                   class="tooltip-n"><img alt="" src="${request.studentProfileImageURL}"></a>
                            </div>
                            <a class="ignoreRequest" onclick="ignoreRequest(this); return false;"
                               style="float: right; cursor: pointer" id="${request.id}">Ignore</a>
                            <a class="confirmRequest" onclick="confirmRequest(this); return false;"
                               style="float: right; margin-right: 15px; cursor: pointer" id="${request.id}">Confirm</a>
                            <div class="author-bio">
                                <h4><a href="/profile/view/${request.studentId}">${request.studentName}</a></h4>
                                Requested to join <a href="/classroom/${classroom.id}" style="font-size: 15px">${classroom.classroomName}</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(requests)<=10}">
                    <c:forEach var="request" items="${requests}">
                        <div class="about-author clearfix" id="request${request.id}">
                            <div class="author-image">
                                <a href="/profile/view/${request.studentId}" original-title="${request.studentName}"
                                   class="tooltip-n"><img alt="" src="${request.studentProfileImageURL}"></a>
                            </div>
                            <a class="ignoreRequest" onclick="ignoreRequest(this); return false;"
                               style="float: right; cursor: pointer" id="${request.id}">Ignore</a>
                            <a class="confirmRequest" onclick="confirmRequest(this); return false;"
                               style="float: right; margin-right: 15px; cursor: pointer" id="${request.id}">Confirm</a>
                            <div class="author-bio">
                                <h4><a href="/profile/view/${request.studentId}">${request.studentName}</a></h4>
                                Requested to join <a href="/classroom/${classroom.id}" style="font-size: 15px">${classroom.classroomName}</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${empty requests}">
                <div class="about-author clearfix">
                    No request.
                </div>
            </c:if>
        </div>
        <c:if test="${fn:length(requests)>10}">
            <div id="loadingR"
                 style="text-align: center; display: none"><img src="/resource/assets/images/loader.GIF"></div>
            <a class="post-read-more button color small"
               style="margin-bottom: 5px;" id="loadMoreRequest">Load more</a>
        </c:if>
    </div>

</c:if>
</div><!-- End page-content -->
</div><!-- End main -->
<aside class="col-md-3 sidebar">
    <c:if test="${classroom.ownerUserId.id!=user.id}">
        <div class="widget widget_highest_points">
            <h3 class="widget_title">Classroom Owner</h3>
            <ul>
                <li>
                    <div class="author-img">
                        <a href="/profile/view/${classroom.ownerUserId.id}"><img width="60" height="60"
                                                                                 src="${classroom.ownerUserId.profileImageURL}" alt=""></a>
                    </div>
                    <h6><a href="/profile/view/${classroom.ownerUserId.id}">${classroom.ownerUserId.displayName}</a></h6>
                    <span class="comment">${classroom.ownerUserId.aboutMe}</span>
                </li>
            </ul>
        </div>
    </c:if>
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
        <c:if test="${user.roleId.id==1}">
            <c:if test="${classroom.status == 1}">
                <c:if test="${empty checkClassroomUser || checkClassroomUser.approval == 2}">
                    <p id="link-btn">
                        <a class="button small color" onclick="joinClassroom(this); return false;">
                            Join
                        </a>
                    </p>
                </c:if>
                <c:if test="${checkClassroomUser.approval == 0 && checkClassroomUser.type == 1}">
                    <a href="#" class="button small color">Request Sent</a>
                    <%--<a href="javascript:handleClass('${classroom.id}', 1)" class="button small color" id="join">Cancel Request</a>--%>
                </c:if>
                <c:if test="${checkClassroomUser.approval == 0 && checkClassroomUser.type == 2}">
                    <p id="link-btn">
                        <a class="button small color" onclick="acceptInvitation(this); return false;">
                            Accept Invitation
                        </a>
                    </p>
                </c:if>
                <c:if test="${checkClassroomUser.approval == 1}">
                    <p id="link-btn">
                        <a class="button small color" onclick="leaveClassroom(this); return false;">
                            Leave
                        </a>
                    </p>
                </c:if>
            </c:if>
        </c:if>
    </div>
    <c:if test="${user.id==classroom.ownerUserId.id}">
        <c:if test="${classroom.status == 1}">
            <div class="widget widget_login" style="  min-height: 130px;">
                <h3 class="widget_title">Invite student</h3>
                <div class="pull-right" style="width: 100%;">
                    <a href="#" id="create-folder-click" class="button medium color" style="width: 100%;text-align: center;"><i class="icon-envelope"></i> Invite</a>
                </div>
            </div>
        </c:if>
    </c:if>
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
<div class="panel-pop" id="create-folder">
    <h2>Invite student to join class<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <form method="post" action="/folder/create">
            <div class="form-inputs clearfix">
                <div style="display: flex;">
                    <div class="col-md-2" >
                        <label class="required" style="padding-top: 10px">Student<span>*</span></label>
                    </div>
                    <div class="col-md-10" style="width: 100%">
                        <input type="text" class="input" name="tag" id="tagsuggest1"/>
                    </div>
                    <div id="hiddenTag1"></div>
                </div>
            </div>
            <div class="form-inputs clearfix" id="errorInvite">
            </div>
            <div class="col-md-10 col-md-offset-2">
            <p class="form-submit">
                <a href="javascript:inviteStudent(${classroom.id})" class="button color small submit" style="width: 100%;text-align: center;">Invite</a>
            </p>
            </div>
        </form>
        <div class="clearfix"></div>
    </div>
</div><!-- End create folder -->
<!-- js -->
<%@include file="js.jsp" %>
<c:if test="${user!=null}">
<script src="/resource/assets/js/notification.js"></script>
</c:if>
<!-- End js -->
<script>
    var idDeleteMaterial ;
    var divDeleteMaterial;
    var idAddMaterial;
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
    var createTag = function(e){
        var flag = 0;
        for( var i = 0 ; i < elt.tagsinput('items').length ; i ++) {
            if($('.tt-input').val()==elt.tagsinput('items')[i].name) {
                flag = 1;
            }
        }
        if(flag==0) {
            $('#tagsuggest').tagsinput('add', { id: Math.round((Math.random()*10000))*-1, name: $('.tt-input').val() });
            $('.tt-input').val("");
        }
    };
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
    var studentNameList = [];
    $(document).ready(function () {
        var tab = '${param.tab}';
        if (tab=='article') {
            $("ul.tabs").data("tabs").click(1);
        } else if (tab=='material') {
            $("ul.tabs").data("tabs").click(2);
        } else if (tab=='student') {
            $("ul.tabs").data("tabs").click(3);
        } else if (tab=='request') {
            $("ul.tabs").data("tabs").click(4);
        } else {
            $("ul.tabs").data("tabs").click(0);
        }

        $('#materialSubmit').click(function(e){
            $('#errorUpload').empty();
            var tagId = new Array();
            $("input[name=tagId]").each(function() {
                tagId.push($(this).val());
            });
            if(tagId.length ==0  || tagId.length > 5) {
                $('#errorUpload').append('<label id="create-folder-error" style="color: red;" class="error" for="question-title">Please provide at least one tag and max 5 tags</label>')
            } else if($('#fileUpload').val()==''){
                $('#errorUpload').append('<label id="create-folder-error" style="color: red;" class="error" for="question-title">Please choose uploaded file.</label>')
            } else {
                $('#formUpload').submit();
            }
            return false;
        })
        function wrap_pop() {
            $(".wrap-pop").click(function () {
                $(".panel-pop").animate({"top":"-100%"},500).hide(function () {
                    $(this).animate({"top":"-100%"},500);
                });
                $(this).remove();
            });
        }
        urlTag = $(location).attr('origin')+"/tag/%QUERY";
        var tag = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            remote: {
                url: urlTag
            }
        });
        tag.initialize();
        elt = $('#tagsuggest');
        var hiddenTag = $('#hiddenTag');
        elt.tagsinput({
            itemValue: 'id',
            itemText: 'name',
            maxTags : 5,
            typeaheadjs: {
                name: 'tag',
                displayKey: 'name',
                source: tag.ttAdapter(),
                templates: {
                    empty: [
                        '<div style="display: flex"><span class="unableFind"> unable to find tag</span> <span><a class="button color small" id="createTag" onclick="createTag()" style="margin-left: 5px">Create Now</a></span></div>'
                    ].join('\n'),
                    suggestion: Handlebars.compile('<div><span style="white-space: nowrap">{{name}}</span></div>')
                }
            }
        });
        elt.on('itemAdded', function (event) {
            var idTag = event.item.id;
            if(idTag < 0) {
                var name = event.item.name;
                hiddenTag.append("<input type='hidden' name='newTag' value='" + name + "' id=tag" + idTag + ">");
            } else {
                hiddenTag.append("<input type='hidden' name='tagId' value='" + idTag + "' id=tag" + idTag + ">");
            }
        });
        elt.on('itemRemoved', function (event) {
            var tagId = "#tag" + event.item.id;
            $(tagId).remove();
        });

        urlFindStudent = $(location).attr('origin')+"/findAllStudentNotInClass/${classroom.id}/%QUERY";
        var student = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            remote: {
                url: urlFindStudent
            }
        });
        student.initialize();
        var elt1 = $('#tagsuggest1');
        var hiddenTagStudent = $('#hiddenTag1');
        elt1.tagsinput({
            itemValue: 'studentId',
            itemText: 'studentName',
            typeaheadjs: {
                name: 'student',
                displayKey: 'studentName',
                source: student.ttAdapter(),
                templates: {
                    empty: [
                        '<div class="empty-message">',
                        'unable to find any student or this student was invited or request to your class',
                        '</div>'
                    ].join('\n'),
                    suggestion: Handlebars.compile('<div><span><img src="{{studentProfileImageURL}}" class="author-imgTag"></span> <span style="white-space: nowrap">{{studentName}}</span></div>')
                }
            }
        });
        elt1.on('itemAdded', function (event) {
            var studentId = event.item.id;
            hiddenTagStudent.append("<input type='hidden' name='tagId' value=" + studentId + " id=tag" + studentId + ">");
        });
        elt1.on('itemRemoved', function (event) {
            var tagId = "#tag" + event.item.id;
            $(tagId).remove();
        });
        /*short test for list of posts - MinhKH*/
        $(".short-text").each(function () {
            text = $(this).html();
            if (text.length > 400) {
                $(this).html(text.substr(0, 400) + '.......');
            }
        });
    });


    function inviteStudent(id){
        var url = "/inviteJoinClass/"+id;
        var name = $("#tagsuggest1").val();
        if(name=='') {
            $('#errorInvite').append('<label id="create-folder-error" style="color: red;" class="error" for="question-title">Please provide student name</label>')
        } else {
            $.ajax({
                type: "POST",
                url: url,
                data: "studentName="+name,
                success: function(data){
                    if(data == "OK"){
                        $('.panel-pop h2 i').click();
                        $('#tagsuggest1').tagsinput('removeAll');
                    }else{
                        $('.panel-pop h2 i').click();
                        $('#tagsuggest1').tagsinput('removeAll');
                    }

                }
            });
        }

    }
    function getStudentList(id){
        var url = "/findAllStudentNotInClass/"+id;
        $.ajax({
            type: "POST",
            url: url,
//            data: "studentName="+name,
            success: function(data, callback){
                if(data != null && data.length >0){
                    makeTag(data)
                }else{
                    $().toastmessage('showErrorToast', "Get student name fail! Please try again late!");
                }
            }
        });
    }
    /*function acceptRequest(el, studentId, requestId){
        var url = "/acceptRequest";
        var id = $("#requestId"+requestId).val();
        var ownerClassroomId = $("#ownerClassroomId"+requestId).val();
        var currentClassroomId = $("#currentClassroomId"+requestId).val();
        $.ajax({
            type: "POST",
            url: url,
            data: "requestId="+id+"&ownerClassroomId="+ownerClassroomId+"&currentClassroomId="+currentClassroomId,
            success: function(data){
                if(data != null && data.status == "OK"){
                    if(typeof el == 'object'){
                        $(el).remove();
                    }else{
                        $("#"+el).remove();
                    }
                    reloadStudent(studentId);
                }else if(data != null && data.status == "NG" && data.id == 0){
                    window.location.href="/";
                }else if(data != null && data.status == "NG" && data.id != 0){
                    window.location.href="/classroom/"+data.id;
                }
            }
        });
    }*/
    /*function ignoreRequest(el, requestId){
        var url = "/ignoreRequest";
        var id = $("#requestId"+requestId).val();
        var ownerClassroomId = $("#ownerClassroomId"+requestId).val();
        var currentClassroomId = $("#currentClassroomId"+requestId).val();
        $.ajax({
            type: "POST",
            url: url,
            data: "requestId="+id+"&ownerClassroomId="+ownerClassroomId+"&currentClassroomId="+currentClassroomId,
            success: function(data){
                if(data != null && data.status == "OK"){
                    if(typeof el == 'object'){
                        $(el).remove();
                    }else{
                        $("#"+el).remove();
                    }

                }else if(data != null && data.status == "NG" && data.id == 0){
                    window.location.href="/";
                }else if(data != null && data.status == "NG" && data.id != 0){
                    window.location.href="/classroom/"+data.id;
                }
            }
        });
    }*/
    /*function reloadStudent(studentId, requestId){
        var url = "/getUserById";
        $.ajax({
            type: "POST",
            url: url,
            data: "id="+studentId,
            success: function(data){
                if(data != null){
                    var  html ="<div class='about-author clearfix' id='student"+studentId+"'>"+
                            "<div class='author-image'>"+
                            "<a href='#' original-title='' class='tooltip-n'><img alt='' src='http://2code.info/demo/html/ask-me/images/demo/admin.jpeg'></a>"+
                            "</div><a class='' href='javascript:removeStudent("+ studentId +")' style='float: right'>Remove</a><div class='author-bio' style='margin-top: 25px'>"+
                            "<h4><a href='#'>"+data.studentName+"</a></h4></div></div>";
                    var location = $("#studentTag").find('.about-author').last();

                    $(html).insertAfter(location);
                    $("#no-student").remove();
                }else if(data != null && data.status == "NG" && data.id == 0){
                    window.location.href="/";
                }else if(data != null && data.status == "NG" && data.id != 0){
                    window.location.href="/classroom/"+data.id;
                }
            }
        });
    }*/
    /*function removeStudent(studentId){
        var url = "/removeStudent";
        var classId = ${classroom.id};
        var ownerId = ${classroom.ownerUserId.id}
        $.ajax({
            type: "POST",
            url: url,
            data: "studentId="+studentId +"&classId="+classId+"&ownerId="+ownerId,
            success: function(data){
                if(data != null && data.status == "OK"){
                    $("#student"+studentId).remove();

                }else if(data != null && data.status == "NG" && data.id == 0){
                    window.location.href="/";
                }else if(data != null && data.status == "NG" && data.id != 0){
                    window.location.href="/classroom/"+data.id;
                }
            }
        });
    }*/
   /* function handleClass(id, type){
        var url = "/handleClass";
        $.ajax({
            type: "POST",
            url: url,
            data: "classId="+id +"&type="+ type,
            success: function(data){
                if(data != null && data.status == "OK"){
                    if(type == 3){
                        var btn = "<a href='javascript:joinClass(${classroom.id})' class='button small color' id='join'>Join</a>";
                        $("#link-btn").html(btn);
                    }else if(type==2){
                        var btn = "<a href='javascript:handleClass('${classroom.id}', 3)' class='button small color' id='join'>Leave</a>";
                        $("#link-btn").html(btn);
                    }

                }else if(data != null && data.status == "NG" && data.id == 0){
                    window.location.href="/";
                }else if(data != null && data.status == "NG" && data.id != 0){
                    window.location.href="/classroom/"+data.id;
                }
            }
        });
    }*/
    function closeClass(classId, type) {
        var url = "/openCloseClass";
        $.ajax({
            type: "POST",
            url: url,
            data: "classId=" + classId+"&type="+ type,
            success: function (data) {
                if (data != null && data.status == "OK") {
                    <%--var createPost = "<a href='/post/create/${classroom.id}' class='button medium green-button' style='float: right'><i class='icon-pencil'></i> Create post</a>";--%>
                    <%--$("#createPost").html(createPost);--%>
                    <%----%>
                    window.location.href = "/classroom/" + data.id;
                } else if (data != null && data.status == "NG" && data.id == 0) {
                    window.location.href = "/";
                } else if (data != null && data.status == "NG" && data.id != 0) {
                    window.location.href = "/classroom/" + data.id;
                }
            }
        });
    }


    //handle accept invitation - leave class - MinhKH
    var joinClassroom = function(e){
        var classroomId = ${classroom.id};
        var url = "/requestJoinClass";
        $.ajax({
            type: "POST",
            url: url,
            data: "classroomId="+ classroomId,
            success: function(data){
                if(data == "OK"){
                    $("#link-btn").html('<a class="button small color" href="">' +
                            'Request sent' +
                            '</a>');
                }else{
                    window.location.href="/";
                }
            }
        });
    }
    var acceptInvitation = function (e) {
        var classroomId = ${classroom.id};
        $.ajax({
            type: "POST",
            url: "/acceptInvitation",
            data: "classroomId="+ classroomId,
            success: function (data){
                if(data === "OK"){
                    $("#link-btn").html('<a class="button small color" onclick="leaveClassroom(this); return false;">' +
                    'Leave' +
                    '</a>');
                    $('#createPost').html('<a href="/post/create/'+ classroomId +
                        '" class="button medium green-button" style="float: right">'+
                        '<i class="icon-pencil"></i> Create post</a>');
                }
            }
        });
    };
    var leaveClassroom = function(e) {
        $(".leave-Classroom").animate({"top":"-100%"},10).hide();
        $(".leave-Classroom").show().animate({"top":"34%"},500);
        $("body").prepend("<div class='wrap-pop'></div>");
        wrap_pop();
    };
    $('.panelLeaveButton').click(function(e) {
        var classroomId = ${classroom.id};
        if ($(e.currentTarget).hasClass('OK')) {
            $.ajax({
                type: "POST",
                url: "/leaveClassroom",
                data: 'classroomId=' + classroomId,
                success: function (data) {
                    if(data != "NG" ){
                        $("#link-btn").html('<a class="button small color" onclick="joinClassroom(this); return false;">' +
                                'Join' +
                                '</a>');
                        $('#createPost').html('');
                    } else {
                        console.log("Error");
                    }
                }
            });
            $(".leave-Classroom").animate({"top":"-100%"},500);
            $(".wrap-pop").remove();
        } else {
            $(".leave-Classroom").animate({"top":"-100%"},500);
            $(".wrap-pop").remove();
        }
    });


    //Load more - MinhKH
    var lastQuestionId = ${lastQuestionId};
    var lastArticleId = ${lastArticleId};
    var lastMaterialId = ${lastMaterialId};
    var lastRequestId = ${lastRequestId};
    var lastClassroomUserId = ${lastClassroomUserId};
    var materialCounter = 11;
    $('#loadMoreQuestion').click(function (e) {
        var url = "/classroom/question";
        var classroomId = ${classroom.id};
        $.ajax({
            type: "POST",
            url: url,
            data: {classroomId: classroomId, lastId: lastQuestionId},
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
                    var component = '<article class="question question-type-normal">' +
                            '<h2>' +
                            '<a href="/post/view/'+ questions[i].id + '">'+ questions[i].title
                            +'</a>' +
                            '</h2>' +
                            '<div class="question-author">' +
                            '<a href="/profile/view/'+ questions[i].ownerId + '"' +
                            'original-title="'+ questions[i].ownerName +
                            '" class="tooltip-n">' +
                            '<span></span><img alt="" src="' + questions[i].ownerProfileImageURL + '"></a>' +
                            '</div>'

                    if (questions[i].similar!=undefined && questions[i].similar > 1) {
                        component = component + '<div class="similarQuestion">'+
                                                 '<span class="question-category">' +
                                '<a href="/post/merge/'+ questions[i].id + '">' +
                                '<i class="icon-sitemap" style="margin-right: 5px">'+ '</i>' + questions[i].similar  + ' similar question(s)</a></span>' +
                                '</div>'
                    }
                    component = component + '<div class="question-inner">' +
                            '<div class="clearfix"></div>' +
                            '<div class="question-desc short-text">'+ questions[i].body + '</div>' +
                            '<div class="question-details">' +
                            '<span class="question-answered question-answered-done">';
                    if (questions[i].acceptedAnswerId===1) {
                        component = component + '<i class="icon-ok"></i>Resolved';
                    }
                    component = component + '</span>' +
                            '</div>' +
                            '<span class="question-date"><i ' +
                            'class="icon-time"></i>' + questions[i].lastEditedDate + '</span>' +
                            '<span class="question-category"><a ' +
                            'href="/classroom/' + questions[i].classId + '"><i ' +
                            'class="icon-group"></i>Class: ' + questions[i].className + '</a></span>' +
                            '<span class="question-comment"><a href="#"><i ' +
                            'class="icon-comment"></i>' + questions[i].answerCount +
                            ' Answer(s)</a></span>' +
                            '<span class="question-view"><i class="icon-eye-open"></i>' + questions[i].viewer +
                            ' view(s)</span>';
                    component = component + '<div class="clearfix"></div>' +
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
            }
        })
    });
    $('#loadMoreArticle').click(function (e) {
        var url = "/classroom/article";
        var classroomId = ${classroom.id};
        $.ajax({
            type: "POST",
            url: url,
            data: {classroomId: classroomId, lastId: lastArticleId},
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
            }
        })
    });
    $('#loadMoreMaterial').click(function (e) {
        var currentUser = ${user.id};
        var ownedUser = ${classroom.ownerUserId.id};
        var roleCurrentUser =  ${user.roleId.id};
        var url = "/classroom/material";
        var classroomId = ${classroom.id};
        $.ajax({
            type: "POST",
            url: url,
            data: {classroomId: classroomId, lastId: lastMaterialId},
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
                    '<td>' + materials[i].size + '</td>' ;
                     if(roleCurrentUser==1) {
                         component = component + '<td><input type="hidden" name="materialId" value="'+ materials[i].id +'"><a id="add-to-folder-click" onclick="GetListFolder(this);return false" href="#">Folder</a> / <a href="" onclick="downloadMaterial(this);return false;">Computer</a></td>';
                     } else {
                         component = component + '<td><input type="hidden" name="materialId" value="'+ materials[i].id +'"><a href="" onclick="downloadMaterial(this);return false;">Computer</a></td>';
                     }
                    if (currentUser==ownedUser || roleCurrentUser==3){
                        component = component +
                                '<td><form action="/material/delete" method="post" style="display: none">' +
                                '<input type="hidden" name="materialId" value="'+ materials[i].id +'"></form>' +
                                '<a href="#" onclick="removeMaterial(this)"><i class="icon-remove"></i> Delete</a></td>';
                    }
                    component = component + '</tr>';
                    $('#materials').append(component);
                    materialCounter++;
                }
            }
        })
    });
    $('#loadMoreRequest').click(function (e) {
        var url = "/classroom/request";
        var classroomId = ${classroom.id};
        var classroomName = "${classroom.classroomName}";
        $.ajax({
            type: "POST",
            url: url,
            data: {classroomId: classroomId, lastId: lastRequestId},
            beforeSend: function(){
                $('#loadMoreRequest').hide();
                $('#loadingR').show();

            },
            complete: function() {
                $('#loadingR').hide();
            },
            success: function (data) {
                var requests = new Array();
                requests = data;
                var length = requests.length;
                if (length > 10) {
                    length = requests.length - 1;
                    $('#loadMoreRequest').show();
                } else {
                    $('#loadMoreRequest').hide();
                }
                lastRequestId = requests[length-1].id;
                for (var i = 0; i < length; i++) {
                    var component = '<div class="about-author clearfix" id="request'+ requests[i].id+'">' +
                            '<div class="author-image">' +
                            '<a href="/profile/view/'+ requests[i].studentId +'" original-title="'
                            + requests[i].studentName +'" ' +
                            'class="tooltip-n"><img alt="" src="'+ requests[i].studentProfileImageURL +'"></a>' +
                            '</div>' +
                            '<a class="ignoreRequest" onclick="ignoreRequest(this); return false;" ' +
                            'style="float: right; cursor: pointer" id="'+ requests[i].id +'">Ignore</a>' +
                            '<a class="confirmRequest" onclick="confirmRequest(this); return false;" ' +
                            'style="float: right; margin-right: 15px; cursor: pointer" id="'+ requests[i].id+
                            '">Confirm</a>' +
                            '<div class="author-bio">' +
                            '<h4><a href="/profile/view/'+ requests[i].studentId +'">'+ requests[i].studentName+'</a></h4>' +
                            'Requested to join <a href="/classroom/'+classroomId+'" style="font-size:' +
                            ' 15px">'+ classroomName+ '</a>' +
                            '</div>' +
                            '</div>';
                    $('#requests').append(component);
                    $(".tooltip-n").tipsy({fade:true,gravity:"s"});
                }
            }
        })
    });
    $('#loadMoreStudent').click(function (e) {
        var currentUser = ${user.id};
        var ownedUser = ${classroom.ownerUserId.id};
        var url = "/classroom/student";
        var classroomId = ${classroom.id};
        $.ajax({
            type: "POST",
            url: url,
            data: {classroomId: classroomId, lastId: lastClassroomUserId},
            beforeSend: function(){
                $('#loadMoreStudent').hide();
                $('#loadingS').show();

            },
            complete: function() {
                $('#loadingS').hide();
            },
            success: function (data) {
                var students = new Array();
                students = data;
                var length = students.length;
                if (length > 10) {
                    length = students.length - 1;
                    $('#loadMoreStudent').show();
                } else {
                    $('#loadMoreStudent').hide();
                }
                lastClassroomUserId = students[length-1].classroomUserId;
                for (var i = 0; i < length; i++) {
                    var component = '<div class="about-author clearfix" id="student'+ students[i].classroomUserId+'">' +
                            '<div class="author-image">' +
                            '<a href="/profile/view/'+ students[i].studentId+'" original-title="'+
                            students[i].studentName +
                            '" class="tooltip-n">' +
                            '<img alt="" src="'+students[i].studentProfileImageURL+'"></a>' +
                            '</div>';
                            if (currentUser==ownedUser){
                                component = component +
                                        '<a class="removeStudent" id="'+ students[i].classroomUserId+'" ' +
                                        'onclick="removeStudent(this); return false;" ' +
                                        'style="float: right; cursor:pointer">Remove</a>';
                            }
                            component = component +
                            '<div class="author-bio" style="margin-top: 25px">' +
                            '<h4><a href="/profile/view/'+ students[i].studentId+'">'+ students[i].studentName+'</a></h4>' +
                            '</div>' +
                            '</div>';
                    $('#students').append(component);
                    $(".tooltip-n").tipsy({fade:true,gravity:"s"});
                }
            }
        })
    });

    var ignoreRequest = function (e){
        var requestId = $(e).attr('id');
        $.ajax({
            type: "POST",
            url: "/ignoreRequest",
            data: "requestId="+ requestId,
            success: function (data){
                if(data === "OK"){
                    var request = $('#request'+requestId);
                    var studentName = request.find("h4").find("a").text();
                    var studentHref = request.find("h4").find("a").attr("href");
                    request.html('You have ignored the request of <a href="'+
                            studentHref +'">'+
                            studentName+'</a>.');
                    request.attr("style","background-color: #ffff9e")
                }
            }
        });
    };
    var confirmRequest = function (e){
        var requestId = $(e).attr('id');
        $.ajax({
            type: "POST",
            url: "/confirmRequest",
            data: "requestId="+ requestId,
            success: function (data){
                if(data !== undefined){
                    var student = data;
                    var request = $('#request'+requestId);
                    var studentName = request.find("h4").find("a").text();
                    var studentHref = request.find("h4").find("a").attr("href");
                    request.html('You have confirmed the request of <a href="'+
                            studentHref +'">'+
                            studentName+'</a>.');
                    request.attr("style","background-color: #99ff99")
                    var newStudent = '<div class="about-author clearfix" id="student'+ student.classroomUserId+'">' +
                            '<div class="author-image">' +
                            '<a href="/profile/view/'+ student.studentId+'" original-title="'+
                            student.studentName +
                            '" class="tooltip-n">' +
                            '<img alt="" src="'+student.studentProfileImageURL+'"></a>' +
                            '</div>' +
                            '<a class="removeStudent" id="'+ student.classroomUserId+'" ' +
                            'onclick="removeStudent(this); return false;" ' +
                            'style="float: right; cursor:pointer">Remove</a>' +
                            '<div class="author-bio" style="margin-top: 25px">' +
                            '<h4><a href="/profile/view/'+ student.studentId+'">'+ student.studentName+'</a></h4>' +
                            '</div>' +
                            '</div>';
                    $('#noStudent').remove();
                    $('#students').prepend(newStudent);
                }
            }
        });
    };
    var removeStudent = function(e) {
        var removeId = $(e).attr('id');
        $(".remove-Student").animate({"top":"-100%"},10).hide();
        $(".remove-Student").show().animate({"top":"34%"},500);
        $(".remove-Student").attr('id',removeId);
        $("body").prepend("<div class='wrap-pop'></div>");
        wrap_pop();

    };
    $('.panelButton').click(function(e) {
        var removeId = $(".remove-Student").attr('id');
        if ($(e.currentTarget).hasClass('OK')) {
            $.ajax({
                type: "POST",
                url: "/removeStudent",
                data: 'removeId=' + removeId,
                success: function (data) {
                    if(data != "NG" ){
                        var removeElement = $('#student'+removeId);
                        var studentName = removeElement.find("h4").find("a").text();
                        var studentHref = removeElement.find("h4").find("a").attr("href");
                        removeElement.html('You have removed <a href="'+
                                studentHref +'">'+
                                studentName+'</a> from classroom.');
                        removeElement.attr("style","background-color: #ffff9e")
                    } else {
                        console.log("Error");
                    }
                }
            });
            $(".remove-Student").animate({"top":"-100%"},500);
            $(".wrap-pop").remove();
        } else {
            $(".remove-Student").animate({"top":"-100%"},500);
            $(".wrap-pop").remove();
        }
    });
    function wrap_pop() {
        $(".wrap-pop").click(function () {
            $(".panel-Confirm").animate({"top":"-100%"},500).hide(function () {
                $(this).animate({"top":"-100%"},500);
            });
            $(this).remove();
        });
    }
</script>
</body>
</html>