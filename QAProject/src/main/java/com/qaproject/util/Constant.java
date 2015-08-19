package com.qaproject.util;

/**
 * Created by khangtnse60992 on 6/9/2015.
 */
public class Constant {
    public static final int NUMBER_PAGE = 10;
    public static final int ACCEPT_ANSWER = 1;
    public static final int UNACCEPT_ANSWER = 0;
    public static final int CLOSE_POST = 0 ;
    public static final int OPEN_POST = 1 ;
    public static final int TEACHER = 2;
    public static final int STUDENT = 1;
    public static final int ADMIN = 3;

    // NT = Notification Type
    public static final int NT_TEACHER_CREATE_CLASS = 1;
    public static final int NT_TEACHER_CREATE_POST = 2;
    public static final int NT_STUDENT_CREATE_POST = 3;
    public static final int NT_USER_REPLY = 4;
    public static final int NT_REQUEST_TO_JOIN_CLASS = 5;
    public static final int NT_INVITE_TO_JOIN_CLASS = 6;
    public static final int NT_INVITE_TO_ANSWER_POST =7;
    public static final int NT_ACCEPT_TO_JOIN_CLASS =8;
    // HR = Href
    public static final String HR_CLASSROOM_VIEW = "/classroom/";
    public static final String HR_POST_VIEW = "/post/view/";
    // IV = Is View
    public static final int IV_FALSE = 0;
    public static final int IV_TRUE = 1;
    // UR = User Role
    public static final int UR_STUDENT_ROLE = 1;
    public static final int UR_TEACHER_ROLE = 2;
    //Invite - accept
    public static final int IA_TYPE_INVITE_STUDENT = 2;
    public static final int IA_TYPE_REQUEST_CLASS = 1;
    public static final int IA_NOT_APPROVAL = 0;
    public static final int IA_APPROVAL = 1;

}
