package com.qaproject.util;

import com.qaproject.entity.Post;
import com.qaproject.entity.User;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.VelocityException;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.stereotype.Component;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import java.io.StringWriter;
import java.net.ConnectException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Created by Minh on 7/9/2015.
 */
@Component
public class SendMailUtilities{
    /*User user = new User();

    private VelocityEngine velocityEngine = new VelocityEngine();
    private JavaMailSender mail;

    public void sendMail(){
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("bookstorewithazure@gmail.com","Matkhau@123");
                    }
                });
        try {
            //String path = servletContext.getRealPath("/WEB-INF/template/emailTemplate.vm");
            Map model = new HashMap();
            model.put("user", "a");
           *//* *//**//*  first, get and initialize an engine  *//**//*
            VelocityEngine ve = new VelocityEngine();
            ve.setProperty("file.resource.loader.class", ClasspathResourceLoader.class.getName());
            ve.init();
        *//**//*  next, get the Template  *//**//*
            Template t = ve.getTemplate( "template/emailTemplate.vm" );
        *//**//*  create a context and add data *//**//*
            VelocityContext context = new VelocityContext();
            context.put("name", "World");
        *//**//* now render the template into a StringWriter *//**//*
            StringWriter writer = new StringWriter();
            t.merge( context, writer );
        *//**//* show the World *//**//*
            System.out.println( writer.toString() );*//*
            velocityEngine.setProperty("file.resource.loader.class", ClasspathResourceLoader.class.getName());
            String test =ClasspathResourceLoader.class.getName();
            velocityEngine.init();
            String text = VelocityEngineUtils.mergeTemplateIntoString(
                    velocityEngine, "template/emailTemplate.vm", "UTF-8",model);
            MimeMessage mimeMessage = new MimeMessage(session);
            MimeMessageHelper message = new MimeMessageHelper(mimeMessage,true);
            message.setFrom(new InternetAddress("byonls.hcm@gmail.com"));
            message.setTo(new InternetAddress("byonls.hcm@gmail.com"));
            message.setSubject("Testing Subject");
            message.setText(text);

            mail.send(mimeMessage);

            System.out.println("Done");

        } catch (MessagingException e) {

        } catch (Exception e){
            e.printStackTrace();
        }
    }


    public void setMail(JavaMailSender mail) {
        this.mail = mail;
    }*/
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private VelocityEngine velocityEngine;


    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void setVelocityEngine(VelocityEngine velocityEngine) {
        this.velocityEngine = velocityEngine;
    }

    public void sendEmail(Post question) {
        try {
            sendNotificationEmail(question);
        } catch (ConnectException e){
            e.printStackTrace();
        } finally {
            return;
        }

    }

    private void sendNotificationEmail(final Post question) throws ConnectException{
        final User user = question.getOwnerUserId();
        final String teacherEmail = question.getOwnerClassId().getOwnerUserId().getEmail();
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception{
                    MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
                    message.setTo(teacherEmail);
                    message.setFrom("askme.youaskweanswer@gmail.com");
                    message.setSubject("AskMe: " + user.getDisplayName() + " has asked a question.");
                    Map model = new HashMap();
                    model.put("user", user);
                    model.put("question", question);
                    String text = VelocityEngineUtils.mergeTemplateIntoString(
                            velocityEngine, "template/emailTemplate.vm", "UTF-8",model);
                    message.setText(text, true);
                }
        };
        this.mailSender.send(preparator);
    }
}
