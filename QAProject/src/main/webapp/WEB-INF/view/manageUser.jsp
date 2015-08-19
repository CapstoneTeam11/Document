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
                    <h3>Manage User</h3>
                </div>
            </div><!-- End row -->
        </section><!-- End container -->
    </div><!-- End breadcrumbs -->

    <section class="container main-content page-left-sidebar">
        <div class="row">
            <div class="col-md-9" style="float: left">
                <form action="/manage/parent" method="POST">
                    <label>Create parent category</label>
                    <div style="display: flex">
                        <input type="text" name="name"><input type="submit" class="button color small submit" value="create" style="margin-left: 3px;margin-top: 0%;height: 3%">
                    </div>

                </form>
                <form action="/manage/child" method="POST">
                    <label>Create child category</label>
                    <div style="display: flex">
                    <select name="parentId" style="width: 30%;height: 36px">
                       <c:forEach var="category" items="${categories}">
                           <option value="${category.id}">${category.categoryName}</option>
                       </c:forEach>
                    </select>
                    <input type="text" name="name"><input type="submit" class="button color small submit" value="create" style="margin-left: 3px;margin-top: 0%;height: 3%">
                    </div>
                </form>
                <label>Manage User</label>
                <table class="table table-hover">
                    <tr>
                        <th>id</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th></th>
                    </tr>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.displayName}</td>
                            <td>${user.email}</td>
                            <td><input type="hidden" name="userId" value="${user.id}"><c:if test="${user.status==0}">
                                <a class="unlock actionUser"  style="font-size: 23px"><i class="icon-unlock"></i></a>
                            </c:if><c:if test="${user.status!=0}">
                               <a class="lock actionUser"  style="font-size: 23px"><i class="icon-lock"></i></a>
                            </c:if></td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="col-lg-12 text-center ">
                <div class="gigantic pagination" style="float: left;margin-left: 18%">
                    <a href="#" class="first" data-action="first">&laquo;</a>
                    <a href="#" class="previous" data-action="previous">&lsaquo;</a>
                    <input type="text" readonly="readonly"/>
                    <a href="#" class="next" data-action="next">&rsaquo;</a>
                    <a href="#" class="last" data-action="last">&rsaquo;</a>
                </div>
                </div>
            </div><!-- End main -->


        </div><!-- End row -->
    </section><!-- End container -->

    <%@include file="footer.jsp" %>
</div><!-- End wrap -->
<!-- End wrap -->
<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<%@include file="js.jsp" %>
<script src="/resource/assets/js/jquery.jqpagination.js"></script>
<script>
    $(document).ready(function () {
        $('.urlPath').val($(location).attr('href'));
        var urls = $(location).attr('pathname').split("/")
        var urlPath = "";
        for (i = 1; i < urls.length - 1; i++) {
            urlPath = urlPath + "/" + urls[i];
        }
        var origin = $(location).attr('origin');
        $('.pagination').jqPagination({
            link_string: origin + urlPath + '/{page_number}',
            max_page: ${maxpage},
            current_page: ${currentPage},
            paged: function (page) {
                window.location = origin + urlPath + '/' + page;
            }
        });
        $('.actionUser').click(function(e) {
            var id =  $(e.currentTarget).prev('input').val();
            if($(e.currentTarget).hasClass('unlock')) {
                var url = "/manage/lock"
                $.ajax({
                    type: "POST",
                    url: url,
                    data : "id="+id,
                    success: function (data) {
                        if(data != "NG" ){
                            var lockIcon =  $(e.currentTarget).children().first();
                            lockIcon.removeClass('icon-unlock');
                            lockIcon.addClass('icon-lock');
                            $(e.currentTarget).removeClass('unlock');
                            $(e.currentTarget).addClass('lock')
                        } else {
                            console.log("Error");
                        }
                    }
                });
            } else {
                var url = "/manage/unlock"
                $.ajax({
                    type: "POST",
                    url: url,
                    data : "id="+id,
                    success: function (data) {
                        if(data != "NG" ){
                            var lockIcon =  $(e.currentTarget).children().first();
                            lockIcon.removeClass('icon-lock');
                            lockIcon.addClass('icon-unlock');
                            $(e.currentTarget).removeClass('lock');
                            $(e.currentTarget).addClass('unlock')
                        } else {
                            console.log("Error");
                        }
                    }
                });
            }
        })
    })

</script>