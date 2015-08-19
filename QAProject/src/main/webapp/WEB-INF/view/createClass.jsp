
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
                    <c:if test="${classroom==null}">
                    <h3>Create classroom</h3>
                    </c:if>
                    <c:if test="${classroom!=null}">
                        <h3>Update classroom</h3>
                    </c:if>
                </div>
            </div><!-- End row -->
        </section><!-- End container -->
    </div><!-- End breadcrumbs -->

    <section class="container main-content page-left-sidebar">
        <div class="row">
            <div class="col-md-9">
                <c:if test="${classroom!=null}">
                <div class="page-content ask-question">
                    <div class="boxedtitle page-title">
                        <h2>
                            Update class
                            <span style="float: right;font-size: 12px;color: black;margin-top: 12px;">
                                (<span style="color:red">*</span>) required filed
                            </span>
                        </h2>
                    </div>

                    <div class="form-style form-style-3" id="question-submit">
                        <form method="post" action="/updateClass" id="classAction">
                            <input type="hidden" name="classroomId" value="${classroom.id}">
                                <div class="row" style="margin-bottom: 20px">
                                    <div class="col-md-2">
                                    <label class="required" style="width: 100%">Class name</label>
                                    </div>
                                    <div class="col-md-10">
                                    <input type="text" id="question-title" name="classroomName" style="width: 100%" readonly="true"
                                           value="${classroom.classroomName}">
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 20px">
                                    <div class="col-md-2">
                                    <c:forEach var="tag" items="${classroom.tagClassroomList}">
                                        <input type="hidden" name="tagUpdateId" value="${tag.tagId.id}">
                                        <input type="hidden" name="tagUpdateName" value="${tag.tagId.tagName}">
                                    </c:forEach>
                                        <label class="required">Tag<span>*</span></label>
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" class="input" name="tag" id="tagsuggest"/>
                                    </div>
                                    <div id="hiddenTag"></div>
                                </div>
                                <div class="row" style="margin-bottom: 20px">
                                    <div class="col-md-2">
                                    <label class="required">Specialty<span>*</span></label>
                                    </div>
                                    <div class="col-md-10">
									<span class="styled-select" style="width: 40%">
										<select id="professional" name="categoryId"
                                                title="Please select classroom's specialty"
                                                required>
                                            <option value="">Select classroom's specialty</option>
                                            <c:forEach var="category" items="${categories}">
                                                <c:if test="${category.parentId==0}">
                                                    <optgroup label="${category.categoryName}">
                                                        <c:forEach var="child" items="${categories}">
                                                            <c:if test="${child.parentId==category.id}">
                                                                <c:if test="${child.id == classroom.categoryId.id}">
                                                                <option value="${child.id}" selected="true">${child.categoryName}</option>
                                                                </c:if>
                                                                <c:if test="${child.id != classroom.categoryId.id}">
                                                                 <option value="${child.id}">${child.categoryName}</option>
                                                                </c:if>
                                                            </c:if>
                                                        </c:forEach>
                                                    </optgroup>
                                                </c:if>
                                            </c:forEach>
                                        </select>
									</span>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 20px">
                                    <div class="col-md-2">
                                        <label class="required">Class's Description<span>*</span></label>
                                    </div>
                                    <div class="col-md-10">
                                        <div id="form-textarea">
                                        <textarea id="class-description" aria-required="true" cols="58" rows="8"
                                                  style="width: 100%;"
                                                  name="classroomDescription">${classroom.classroomDescription}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-10">
                                        <input type="submit" id="publish-question" value="Update Class"
                                               class="button color small submit">
                                    </div>
                                </div>
                        </form>
                    </div>
                </div><!-- End page-content -->
                </c:if>
                <c:if test="${classroom==null}">
                    <div class="page-content ask-question">
                        <div class="boxedtitle page-title">
                            <h2>
                                Create class
                                <span style="float: right;font-size: 12px;color: black;margin-top: 12px;">
                                (<span style="color:red">*</span>) required filed
                            </span>
                            </h2>
                        </div>

                        <div class="form-style form-style-3" id="question-submit">
                            <form method="post" action="/createClass" id="classAction">
                                <div class="row" style="margin-bottom: 20px">
                                    <div class="col-md-2">
                                        <label class="required" style="width: 100%">Class name<span>*</span></label>
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" id="question-title" style="width: 100%" name="classroomName">
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 20px">
                                    <div class="col-md-2">
                                            <label class="required">Tag<span>*</span></label>
                                    </div>
                                    <div class="col-md-10">
                                            <input type="text" class="input" name="tag" id="tagsuggest"/>
                                    </div>
                                        <div id="hiddenTag"></div>
                                </div>
                                <div class="row" style="margin-bottom: 20px">
                                    <div class="col-md-2">
                                            <label class="required">Invite student</label>
                                    </div>
                                    <div class="col-md-10">
                                            <input type="text" class="input" name="studentList" id="tagsuggest1"/>
                                    </div>
                                        <div id="hiddenTag1"></div>
                                </div>
                                <div class="row" style="margin-bottom: 20px">
                                    <div class="col-md-2">
                                        <label class="required">Specialty<span>*</span></label>
                                    </div>
                                    <div class="col-md-10">
									<span class="styled-select" style="width: 40%">
										<select id="professional" name="categoryId"
                                                title="Please select classroom's specialty"
                                                required>
                                            <option value="">Select classroom's specialty</option>
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
                                <div class="row" style="margin-bottom: 20px">
                                    <div class="col-md-2">
                                        <label class="required">Class's Description<span>*</span></label>
                                    </div>
                                    <div class="col-md-10">
                                    <div id="form-textarea">
                                            <textarea id="class-description" aria-required="true" cols="58" rows="8"
                                                      style="width: 100%;" name="classroomDescription"></textarea>
                                    </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-10">
                                        <input type="submit" id="publish-question" value="Create Class"
                                               class="button color small submit">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div><!-- End page-content -->
                </c:if>
            </div><!-- End main -->
            <aside class="col-md-3 sidebar">
                <div class="widget widget_highest_points">
                    <h3 class="widget_title">Class Owner</h3>
                    <ul>
                        <li>
                            <div class="author-img">
                                <a href="#"><img width="60" height="60" src="${user.profileImageURL}" alt=""></a>
                            </div>
                            <h6><a href="#">${user.displayName}</a></h6>
                            <span class="comment">${user.aboutMe}</span>
                        </li>
                    </ul>
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
<c:if test="${sessionScope.user!=null}">
<script src="/resource/assets/js/notification.js"></script>
</c:if>
<!-- End js -->
<c:if test="${classroom==null}">
<script>

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
    $(document).ready(function () {
        $('#classAction').validate({
            ignore: [],
            rules: {
                classroomName: {
                    required: true,
                    minlength: 20,
                    maxlength: 255
                },
                classroomDescription: {
                    required: true,
                    minlength: 20,
                    maxlength: 350
                },
                tag: {
                    required: true
                }
            },
            messages: {
                classroomName: {
                    required: "Please provide the class name.",
                    minlength: "The class name must be between 20 and 255 characters long.",
                    maxlength: "The class name must be between 20 and 255 characters long."
                },
                classroomDescription: {
                    required: "Please provide the description.",
                    minlength: "The description must be between 20 and 350 characters long.",
                    maxlength: "The description must be between 20 and 350 characters long."
                },
                tag: {
                    required: "Please provide at least one tag."
                }
            }
        });

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
        var hiddenTag123 = $('#hiddenTag');
        elt.tagsinput({
            itemValue: 'id',
            itemText: 'name',
            typeaheadjs: {
                name: 'tag',
                displayKey: 'name',
                maxTags: 5,
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

        ///////////////////////////////////////////////
        urlFindStudent = $(location).attr('origin')+"/findAllStudent/%QUERY";
        var student = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            remote: {
                url: urlFindStudent
            }
        });
        student.initialize();
        var elt1 = $('#tagsuggest1');
        var hiddenTag = $('#hiddenTag1');
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
            hiddenTag.append("<input type='hidden' name='tagId' value=" + studentId + " id=tag" + studentId + ">");
        });
        elt1.on('itemRemoved', function (event) {
            var tagId = "#tag" + event.item.id;
            $(tagId).remove();
        });

    });
    function createClass(){
        var classname = $("#question-title").val();
        var tag = $("#tag").val();
        var cate = $("#professional option:selected").val();
        var classDescription = $("#class-description").val();
        var tagList = $("#tagsuggest").val();
        var student = $('#tagsuggest1').val();
        var url = "/createClass1";
        $.ajax({
            type: "GET",
            url: url,
            data: "classroomName="+ classname + "&classroomDescription="+classDescription+"&categoryId="+cate+"&tag="+tagList+"&studentList="+student,
            success: function (data) {
                if(data.status == "OK"){
                    window.location.href = "/classroom/"+data.id;
//                    window.location.href = "/classroomWelcome";
                }else{
                    window.location.href = "/403";
                }

            },
            contentType: "application/json"
        });


    }
</script>
</c:if>
<c:if test="${classroom!=null}">
    <script>

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
        $(document).ready(function () {
            $('#classAction').validate({
                ignore: [],
                rules: {
                    classroomDescription: {
                        required: true,
                        minlength: 20,
                        maxlength: 350
                    },
                    tag: {
                        required: true
                    }
                },
                messages: {
                    classroomDescription: {
                        required: "Please provide the description.",
                        minlength: "The description must be between 20 and 350 characters long.",
                        maxlength: "The description must be between 20 and 350 characters long."
                    },
                    tag: {
                        required: "Please provide at least one tag."
                    }
                }
            });
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
            var hiddenTag123 = $('#hiddenTag');
            elt.tagsinput({
                itemValue: 'id',
                itemText: 'name',
                maxTags: 5,
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
            elt.on('beforeItemAdd', function (event) {
                var idTag = event.item.id;
                var tagName = event.item.name;
                var listItems = new Array();
                listItems = elt.tagsinput('items')
                for(var i = 0 ; i < listItems.length;i++) {
                    if(idTag==listItems[i].id){
                        elt.tagsinput('remove', { id: idTag, text: tagName });
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
            var tagIdUpdate = new Array();
            $("input[name=tagUpdateId]").each(function() {
                tagIdUpdate.push($(this).val());
            });
            var tagNameUpdate = new Array();
            $("input[name=tagUpdateName]").each(function() {
                tagNameUpdate.push($(this).val());
            });
            for(var i = 0 ; i < tagIdUpdate.length ; i++) {
                elt.tagsinput('add', { id: tagIdUpdate[i], name: tagNameUpdate[i] });
            }

        });

    </script>
</c:if>
</body>
</html>