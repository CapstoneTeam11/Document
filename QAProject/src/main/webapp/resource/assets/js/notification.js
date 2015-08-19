/**
 * Created by khangtnse60992 on 6/27/2015.
 */
$(document).ready(function () {

function getNotificationDiv(senderName,content,href,avatar,isView) {
    var notificationDiv
    if(isView==0) {
        notificationDiv = '<li class="notification-li" style="background-color: rgb(194, 214, 220)">';
    } else {
        notificationDiv = '<li class="notification-li">';
    }
        notificationDiv = notificationDiv + '<a href="'+ href +'">' + '<div class="notification-all">';
        notificationDiv = notificationDiv +
        '<div style="min-width: 40px; max-width: 320px">' +
        '<img src="'+avatar+'" class="mail-avatar">' +
        '<span class="notification-user">' + senderName +
        '<span class="notification-action">' + content +
        '</span></span></div></div></a></li>'
    return notificationDiv;
}
function getEmptyNotificationDiv() {
    var notificationDiv = '<li class="notification-li">' +
        '<a>' +
        '<div class="notification-all">' +
        '<div style="min-width: 40px;">' +
        '<span class="notification-action">You dont have any notification'
    '</span></span></div></div></a></li>'
    return notificationDiv;
}
var userId =$('#userIdFlag').val()
$.ajax({
    type : "GET",
    url : '/notification/unview/'+userId,
    success : function(data) {
        var numberView = data;
        if(data > 0) {
            $('#countNotifi').html(data);
        }
}
})

$('#notifiDropdown').click(function(e) {
    if(($(e.currentTarget).attr('aria-expanded'))=='false' || ($(e.currentTarget).attr('aria-expanded'))==undefined) {
        var url = '/notification/'+userId;
        var numberUnview = 0;
        $.ajax({
            type : "GET",
            url : url,
            success : function(data) {
                var notification = new Array();
                notification = data;
                if(notification.length > 0) {
                    for(var i = 0 ; i < notification.length ; i++) {
                        var divAppend = getNotificationDiv(notification[i].senderDisplayName,notification[i].content,notification[i].href,notification[i].senderAvatar,notification[i].isView)
                        $('#notificationAppend').append(divAppend);
                        if(notification[i].isView==0) {
                            numberUnview++;
                        }
                    }
                    var currentCount = $('#countNotifi').html() * 1;
                    var afterView = currentCount - numberUnview;
                    if(afterView==0) {
                        $('#countNotifi').html("");
                    } else {
                        $('#countNotifi').html(afterView);
                    }
                    var url = '/notification/setview/' + userId;
                    $.ajax({
                        type: "POST",
                        url: url,
                        success: function (data) {
                            if(data!='OK') {
                                console.log("Error");
                            }
                        }
                    })

                } else {
                    var divAppend = getEmptyNotificationDiv();
                    $('#notificationAppend').append(divAppend);
                }

            }
        })


    } else {
        $('#notificationAppend').empty();
    }

})
    /**
     * Created by khangtnse60992 on 7/1/2015.
     */
    var socket = new SockJS("/ws");
    var stompClient = Stomp.over(socket);
// Callback function to be called when stomp client is connected to server
    var connectCallback = function () {
        stompClient.subscribe('/topic/notice/'+$('#userIdFlag').val(), notification);
    };

// Callback function to be called when stomp client could not connect to server
    var errorCallback = function (error) {
        alert(error.headers.message);
    };
    stompClient.connect("guest", "guest", connectCallback, errorCallback);
    function notification(notification) {
        var notification = JSON.parse(notification.body);
        var currentCount = $('#countNotifi').html() * 1;
        $('#countNotifi').html(currentCount + 1);
        $.growl.notice({
            message: '<div class="activity-item"> <i class="fa fa-heart text-danger"></i> <div class="activity">' + notification.senderDisplayName + '' +
                '<a href="'+ notification.href +'">' + notification.content  + '</a> <span> few seconds ago</span> </div> </div>',
            location: "bl"
        });
    }
})
$(document).on('click', function(e) {
    if($(e.currentTarget).attr('id')!='notifiDropdown') {
        if($('#notificationAppend').children().length > 0) {
            $('#notificationAppend').empty();
    }
}
});