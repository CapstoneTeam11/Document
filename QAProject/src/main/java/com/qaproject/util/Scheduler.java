package com.qaproject.util;
import com.qaproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Minh on 6/14/2015.
 */
@Component("scheduler")
public class Scheduler {

    @Autowired
    NewsFeedUtilities newsFeedUtilities;

    @Autowired
    SendMailUtilities sendMailUtilities;

    public void updateRedisDB() {
        System.out.println("Start scheduler");
        newsFeedUtilities.setNewsFeed();
        System.out.println("End scheduler");
    }
}

