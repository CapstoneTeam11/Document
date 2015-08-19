
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
    </div>
    <!-- End signup -->

    <div class="panel-pop" id="lost-password">
        <h2>Lost Password<i class="icon-remove"></i></h2>

        <div class="form-style form-style-3">
            <p>Lost your password? Please enter your username and email address. You will receive a link to create a new
                password via email.</p>

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
    </div>
    <!-- End lost-password -->


    <%@include file="header.jsp" %>

    <div class="breadcrumbs" style="margin-top: 86px">
        <section class="container" style="height:70px; display: flex; align-items: center">
            <div class="row">
                <div class="col-md-12">
                    <c:if test="${post==null && posts==null}">
                    <h3 style="margin-top:15px">Create Post</h3>
                    </c:if>
                    <c:if test="${posts!=null}"><h3 style="margin-top:15px">Create new merged question</h3></c:if>
                    <c:if test="${post!=null}"><h3 style="margin-top:15px">Edit post</h3></c:if>
                    <h5 style="margin-top: 15px">
                        <a href="/search?filter=4&searchKey=" style="color: white;">Classroom</a> /
                        <a href="/classroom/${classroom.id}" style="color: white;">${classroom.classroomName}</a> /
                        <c:if test="${post==null && posts==null}">
                        <span style="color: #2f3239;">Create post</span>
                        </c:if>
                        <c:if test="${posts!=null}"><span style="color: #2f3239;">Create new merged question</span></c:if>
                        <c:if test="${post!=null}"><span style="color: #2f3239;">Edit post</span></c:if>
                    </h5>
                </div>
            </div><!-- End row -->
        </section><!-- End container -->
    </div><!-- End breadcrumbs -->

    <section class="container main-content page-left-sidebar">
        <div class="row">
            <div class="col-md-9">

                <div class="page-content ask-question">
                    <c:if test="${post==null && posts==null}">
                    <div class="boxedtitle page-title">
                        <c:if test="${postMerges!=null}">
                            <h2>
                                Merged question
                            <span style="float: right;font-size: 12px;color: black;margin-top: 12px;">
                                (<span style="color:red">*</span>) required filed
                            </span>
                            </h2>
                        </c:if>
                        <c:if test="${postMerges==null}">
                             <h2>
                                 Create new question or article
                                <span style="float: right;font-size: 12px;color: black;margin-top: 12px;">
                                    (<span style="color:red">*</span>) required filed
                                </span>
                            </h2>
                        </c:if>
                    </div>

                    <div class="form-style form-style-3" id="question-submit">
                        <form method="post" action="/post/create" id="formvalidate">
                            <input type="hidden" name="classId" value="${classroom.id}">
                            <div>
                                <div class="row" style="margin-bottom: 20px">
                                    <div class="col-md-2">
                                        <label class="required">Title<span>*</span></label>
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" id="question-title" name="postName" maxlength="255"
                                               style="width: 100%">
                                        <div id="suggestPost"></div>
                                        <%--<span class="form-description">Please choose an appropriate title for the question to answer it even easier .</span>--%>
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
                                    <label class="required">Type<span>*</span></label>
                                    </div>

                                    <div class="col-md-10">
									<span class="styled-select" style="width: 30%">
										<select name="postType" title="Please choose question or article" required>
                                            <option value="">Select a type</option>
                                            <option value="1">Question</option>
                                            <option value="2">Article</option>
                                        </select>
									</span>
                                    </div>
                                    <%--<span class="form-description">Please choose the appropriate section so easily search for your question .</span>--%>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 20px">
                                <div class="col-md-2">
                                    <label class="required">Details<span>*</span></label>
                                </div>
                                <div class="col-md-10">
                                    <div id="form-textarea">
                                        <textarea id="questionDetails" name="questionDetails" aria-required="true" cols="58"
                                                  rows="8"></textarea>
                                    </div>
                                    <input type="hidden" id="postDetail" name="postDetail">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-10">
                                    <input type="submit" id="publish-question" value="Publish Your Post"
                                           class="button color small submit">
                                </div>
                            </div>
                        </form>
                    </div>
                    </c:if>
                    <c:if test="${post!=null}">
                        <div class="boxedtitle page-title">
                            <h2>
                                Edit post
                            <span style="float: right;font-size: 12px;color: black;margin-top: 12px;">
                                (<span style="color:red">*</span>) required filed
                            </span>
                            </h2>
                        </div>

                        <div class="form-style form-style-3" id="question-submit">
                            <form method="post" action="/post/update" id="formvalidate">
                                <input type="hidden" name="id" value="${post.id}">
                                <c:forEach var="tag" items="${post.tagPostList}">
                                    <input type="hidden" name="tagUpdateId" value="${tag.tagId.id}">
                                    <input type="hidden" name="tagUpdateName" value="${tag.tagId.tagName}">
                                </c:forEach>
                                    <div class="row" style="margin-bottom: 20px">
                                        <div class="col-md-2">
                                            <label class="required">Title<span>*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" id="question-title" name="postName"
                                                   value="${post.title}" maxlength="255" style="width: 100%">
                                            <%--<span class="form-description">Please choose an appropriate title for the question to answer it even easier .</span>--%>
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
                                            <label class="required">Type<span>*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <span class="styled-select" style="width: 30%">
                                                <select name="postType" title="Please choose question or article" required>
                                                    <option value="">Select a type</option>
                                                    <c:if test="${post.postType==1}">
                                                    <option value="1" selected>Question</option>
                                                        <option value="2">Article</option>
                                                    </c:if>
                                                    <c:if test="${post.postType==2}">
                                                        <option value="1">Question</option>
                                                        <option value="2" selected>Article</option>
                                                    </c:if>
                                                </select>
                                            </span>
                                        </div>
                                </div>
                                <div class="row" style="margin-bottom: 20px">
                                    <div class="col-md-2">
                                        <label class="required">Details<span>*</span></label>
                                    </div>
                                    <div class="col-md-10">
                                        <div id="form-textarea">
                                            <textarea id="questionDetails" aria-required="true" cols="58"
                                                      name="questionDetails" rows="8">${post.body}</textarea>
                                        </div>
                                        <input type="hidden" id="postDetail" name="postDetail">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-10">
                                        <input type="submit" id="publish-question" value="Save"
                                               class="button color small submit">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:if>
                    <c:if test="${posts!=null}">
                        <div class="boxedtitle page-title">
                            <h2>
                                Create new merged question
                            <span style="float: right;font-size: 12px;color: black;margin-top: 12px;">
                                (<span style="color:red">*</span>) required filed
                            </span>
                            </h2>
                        </div>
                        <c:forEach var="post" items="${posts}">
                            <input type="hidden" id="title${post.id}" name="id" value="${post.title}">
                            <c:forEach var="tag" items="${post.tagPostList}">
                                <input type="hidden" name="tagUpdateId${post.id}"  class="tagUpdateId${post.id}" value="${tag.tagId.id}">
                                <input type="hidden" name="tagUpdateName${post.id}" class="tagUpdateName${post.id}" value="${tag.tagId.tagName}">
                            </c:forEach>
                            <textarea hidden="true" id="detail${post.id}">${post.body}</textarea>
                        </c:forEach>
                        <div class="form-style form-style-3" id="question-submit">
                            <form method="post" action="/post/merge" id="formvalidate">
                                <c:forEach var="post" items="${posts}">
                                <input type="hidden" id="title${post.id}" name="postMerges" value="${post.id}">
                                </c:forEach>
                                <input type="hidden" id="primaryid" name="primaryid" value="${posts[0].id}">
                                <div id="taghiddenlist">
                                <c:forEach var="tag" items="${posts[0].tagPostList}">
                                    <input type="hidden" name="tagUpdateId" value="${tag.tagId.id}">
                                    <input type="hidden" name="tagUpdateName" value="${tag.tagId.tagName}">
                                </c:forEach>
                                </div>
                                <div class="row" style="margin-bottom: 20px">
                                    <div class="col-md-2">
                                        <label class="required">Reused question<span>*</span></label>
                                    </div>
                                    <div class="col-md-10">
                                        <table class="table table-hover" style="margin-left: 10px">
                                            <thead>
                                            <tr>
                                                <th style="border-bottom: none; font-weight: bold"></th>
                                                <th style="border-bottom: none"></th>
                                            </tr>
                                            </thead>
                                            <tbody style="display: block; max-height: 300px; overflow-y: auto">
                                            <c:forEach var="post" items="${posts}">
                                                <tr>
                                                    <td class="col-md-12"><a href="/post/view/${post.id}">${post.title}</a></td>
                                                    <td ><input type="radio" class="radio" name="postMerges" style="width: 30px;"
                                                                value="${post.id}"></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 20px">
                                    <div class="col-md-2">
                                        <label class="required">Title<span>*</span></label>
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" id="question-title" name="postName"
                                               value="${posts[0].title}" maxlength="255" style="width: 100%">
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
                                        <label class="required">Details<span>*</span></label>
                                    </div>
                                    <div class="col-md-10">
                                        <div id="form-textarea">
                                            <textarea id="questionDetails" aria-required="true" cols="58"
                                                      name="questionDetails" rows="8">${posts[0].body}</textarea>
                                        </div>
                                        <input type="hidden" id="postDetail" name="postDetail">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-10">
                                        <input type="submit" id="publish-question" value="Save"
                                               class="button color small submit">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:if>
                </div>
                <!-- End page-content -->
            </div>
            <!-- End main -->
            <aside class="col-md-3 sidebar">
                <div class="widget">
                    <h3 class="widget_title">About class</h3>
                    <ul class="related-posts">
                        <li class="related-item">
                            <p>${classroom.classroomDescription}</p>

                            <div class="clear"></div>

                        </li>
                    </ul>
                    <div class="row">
                        <div class="col-md-8"></div>
                        <div class="col-md-4">

                        </div>
                    </div>
                </div>
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

            </aside>
            <!-- End sidebar -->
        </div>
        <!-- End row -->
    </section>
    <!-- End container -->

    <footer id="footer">
        <section class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="widget widget_contact">
                        <h3 class="widget_title">Where We Are ?</h3>

                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit
                            amet suscipit risus ultrices eu.</p>
                    </div>
                </div>
            </div>
            <!-- End row -->
        </section>
        <!-- End container -->
    </footer>
    <!-- End footer -->
</div>
<!-- End wrap -->
<!-- End wrap -->


<!-- js -->
<%@include file="js.jsp" %>
<c:if test="${sessionScope.user!=null}">
<script src="/resource/assets/js/notification.js"></script>
</c:if>
<c:if test="${post==null && posts==null}">
<script>
    $(document).ready(function () {
        $('#question-title').change(function(e){
            var title = $('#question-title').val();
            if(title.length >= 20 && title.length <= 255) {
                var url = "/post/suggest"
                var data = "title="+title;
                $.ajax({
                    type: "GET",
                    url: url,
                    data: data,
                    success: function (data) {
                        var post = new Array();
                        post = data;
                        if(post.length > 0) {
                            $('#suggestPost').empty();
                            $('#suggestPost').append('<label style="width: 100%">These are the same questions may be help you</label>')
                            $('#suggestPost').append('<div id="listSuggestPost" class="listSuggestPost"></div>')
                            for(var i = 0 ; i < post.length;i++) {
                                $('#listSuggestPost').append('<div><a target="_blank" style="display: block" href="/post/view/'+
                                        post[i].id
                                        +'">'+ post[i].title +'</a><div>');
                            }
                        }
                    }
                })
            }

        })
        $('#formvalidate').validate({
            ignore: [],
            rules: {
                questionDetails: {
                    required: function (){
                        CKEDITOR.instances.questionDetails.updateElement();
                    },
                    minlength: 120
                },
                postName: {
                    required: true,
                    minlength: 20,
                    maxlength: 255
                },
                tag: {
                    required: true
                }
            },
            messages: {
                postName: {
                    required: "Please provide the title.",
                    minlength: "The title must be between 20 and 255 characters long.",
                    maxlength: "The title must be between 20 and 255 characters long."
                },
                questionDetails: {
                    required: "Please provide the details.",
                    minlength: "The details must be at least 120 characters long."
                },
                tag: {
                    required: "Please provide at least one tag."
                }
            },
            errorPlacement: function(error, element)
            {
                if (element.attr("name") == "questionDetails")
                {
                    error.insertAfter("#form-textarea");
                } else {
                    error.insertAfter(element);
                }
            }
        });

        $('#publish-question').click(function (e) {
            var detail = CKEDITOR.instances['questionDetails'].getData()
            var postDetail = $('#postDetail')
            postDetail.val(detail) ;
            $('#question-submit').submit();
        });

        CKEDITOR.replace('questionDetails');
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
</script>
</c:if>
<c:if test="${post!=null}">
    <script>
        $(document).ready(function () {

            $('#formvalidate').validate({
                ignore: [],
                rules: {
                    questionDetails: {
                        required: function (){
                            CKEDITOR.instances.questionDetails.updateElement();
                        },
                        minlength: 120
                    },
                    postName: {
                        required: true,
                        minlength: 20,
                        maxlength: 255
                    },
                    tag: {
                        required: true
                    }
                },
                messages: {
                    postName: {
                        required: "Please provide the title.",
                        minlength: "The title must be between 20 and 255 characters long.",
                        maxlength: "The title must be between 20 and 255 characters long."
                    },
                    questionDetails: {
                        required: "Please provide the details.",
                        minlength: "The details must be at least 120 characters long."
                    },
                    tag: {
                        required: "Please provide at least one tag."
                    }
                },
                errorPlacement: function(error, element)
                {
                    if (element.attr("name") == "questionDetails")
                    {
                        error.insertAfter("#form-textarea");
                    } else {
                        error.insertAfter(element);
                    }
                }
            });

            $('#publish-question').click(function (e) {
                var detail = CKEDITOR.instances['questionDetails'].getData()
                var postDetail = $('#postDetail')
                postDetail.val(detail) ;
                $('#question-submit').submit();
            });

            CKEDITOR.replace('questionDetails');
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
    </script>

</c:if>
<c:if test="${posts!=null}">
    <script>
        $(document).ready(function () {
            $($('input:radio')[0]).attr('checked',true);
            $('#formvalidate').validate({
                ignore: [],
                rules: {
                    questionDetails: {
                        required: function (){
                            CKEDITOR.instances.questionDetails.updateElement();
                        },
                        minlength: 120
                    },
                    postName: {
                        required: true,
                        minlength: 20,
                        maxlength: 255
                    },
                    tag: {
                        required: true
                    }
                },
                messages: {
                    postName: {
                        required: "Please provide the title.",
                        minlength: "The title must be between 20 and 255 characters long.",
                        maxlength: "The title must be between 20 and 255 characters long."
                    },
                    questionDetails: {
                        required: "Please provide the details.",
                        minlength: "The details must be at least 120 characters long."
                    },
                    tag: {
                        required: "Please provide at least one tag."
                    }
                },
                errorPlacement: function(error, element)
                {
                    if (element.attr("name") == "questionDetails")
                    {
                        error.insertAfter("#form-textarea");
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
            $('.radio').click(function(e){
                var id = $(e.currentTarget).val();
                var title = '#title'+id;
                var detail = '#detail'+id;
                $('#question-title').val($(title).val())
                $('#primaryid').val(id)
                CKEDITOR.instances['questionDetails'].setData($(detail).val())
                elt.tagsinput('removeAll');
                $('#hiddenTag').empty();
                var tagIdUpdate = new Array();
                var nameTagUpdateId = '.tagUpdateId'+id;
                var nameTagUpdateName = '.tagUpdateName'+id;
                $(nameTagUpdateId).each(function() {
                    tagIdUpdate.push($(this).val());
                });
                var tagNameUpdate = new Array();
                $(nameTagUpdateName).each(function() {
                    tagNameUpdate.push($(this).val());
                });
                for(var i = 0 ; i < tagIdUpdate.length ; i++) {
                    elt.tagsinput('add', { id: tagIdUpdate[i], name: tagNameUpdate[i] });
                }

            })
            $('#publish-question').click(function (e) {
                var detail = CKEDITOR.instances['questionDetails'].getData()
                var postDetail = $('#postDetail')
                postDetail.val(detail) ;
                $('#question-submit').submit();
            });

            CKEDITOR.replace('questionDetails');
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
            elt.on('itemAdded', function (event) {
                var idTag = event.item.id;
                if(idTag < 0) {
                    var name = event.item.name;
                    hiddenTag.append("<input type='hidden' name='newTag' value='" + name + "' id=tag" + idTag + ">");
                } else {
                    hiddenTag.append("<input type='hidden' name='tagId' value='" + idTag + "' id=tag" + idTag + ">");
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

    </script>

</c:if>

<!-- End js -->

</body>
</html>