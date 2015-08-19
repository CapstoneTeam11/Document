package com.qaproject.controller;

import com.qaproject.dao.*;
import com.qaproject.dto.FolderDto;
import com.qaproject.entity.*;
import com.qaproject.util.Constant;
import com.qaproject.util.ConvertEntityDto;
import com.qaproject.util.Utilities;
import com.sun.deploy.net.HttpResponse;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.file.FileAlreadyExistsException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by khangtnse60992 on 6/6/2015.
 */
@Controller
public class MaterialController implements HandlerExceptionResolver {

    @Autowired
    FolderDao folderDao;
    @Autowired
    MaterialDao materialDao;
    @Autowired
    ClassroomDao classroomDao;
    @Autowired
    HttpSession session;
    @Autowired
    TagDao tagDao;

    @RequestMapping(value = "/material", method = RequestMethod.GET)
    public String material(ModelMap model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("currentPage","redirect:/material");
            return "redirect:/";
        }
        if(user.getRoleId().getId()==2) {
            return "403";
        }
        List<Folder> folders = folderDao.findByUser(user);
        model.addAttribute("folders", folders);
        return "material";
    }
    @RequestMapping(value = "/material/delete", method = RequestMethod.POST,produces = "application/json")
    public @ResponseBody  String deleteMaterial(ModelMap model,@RequestParam Integer materialId) {
        User user = (User) session.getAttribute("user");
        int flag = 0;
        int classId = 0;
        if (user == null) {
            return "NG";
        }
        Material material = materialDao.find(materialId);
        if(material==null) {
            return "NG";
        }
        //if material is class's material
        if(material.getOwnerClassId()!=null) {
            classId = material.getOwnerClassId().getId();
            //authorize user is classroom's teacher
            if(user.getId()!=material.getOwnerClassId().getOwnerUserId().getId()) {
                return "NG";
            }
        }
        //if material is user's material
        if(material.getFolderId()!=null) {
            flag =1;
            if(material.getFolderId().checkUser(user)==false) {
                return "NG";
            }
        }
        try{
            File file = new File(material.getFileURL());
            if(file.delete()){
                System.out.println(file.getName() + " is deleted!");
            }else{
                System.out.println("Delete operation is failed.");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        materialDao.remove(material);
        if(flag==1) {
            return "OK";
        }
        return "OK";
    }


    @RequestMapping(value = "/folder/{id}", method = RequestMethod.GET)
    public String material(@PathVariable Integer id,
                           ModelMap model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("currentPage","redirect:/folder/"+id);
            return "redirect:/";
        }
        if(user.getRoleId().getId()== Constant.TEACHER) {
            return "403";
        }
        Folder folder = folderDao.find(id);
        if (folder == null) {
            return "redirect:/";
        }
        if (folder.checkUser(user) == false) {
            return "redirect:/";
        }
        List<Material> materials = folder.getMaterialList();
        for (int i = 0 ; i < materials.size() ; i++) {

        }
        model.addAttribute("folderName",folder.getName());
        model.addAttribute("materials", materials);
        return "materialList";
    }

    @RequestMapping(value = "/folder/create", method = RequestMethod.POST,produces = "application/json")
    public @ResponseBody String addFolder(@RequestParam String name,
                            ModelMap model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("currentPage","redirect:/material");
            return "NG";
        }
        if(user.getRoleId().getId()== Constant.TEACHER) {
            return "403";
        }
        if(folderDao.checkFolderExists(name,user)==true) {
            return "exist";
        }
        Folder folder = null;
        try {
            folder = new Folder();
            folder.setManagerId(user);
            folder.setName(name);
            folderDao.persist(folder);
        } catch(Exception e) {
            return "NG";
        }
        return String.valueOf(folder.getId());
    }
    @RequestMapping(value = "/folder/remove", method = RequestMethod.POST,produces = "application/json")
    public @ResponseBody String addFolder(@RequestParam Integer id,
                            ModelMap model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "NG";
        }
        if(user.getRoleId().getId()== Constant.TEACHER) {
            return "403";
        }
        Folder folder = folderDao.find(id);
        if(folder==null) {
            return "NG";
        }
        folderDao.remove(folder);
        return "OK";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String upload(@RequestParam Integer classId,
                         @RequestParam List<Integer> tagId,
                         @RequestParam(required = false) List<String> newTag,
                         @RequestParam CommonsMultipartFile[] fileUpload,
                         ModelMap model) {
        Classroom classroom = classroomDao.find(classId);
        User user = (User) session.getAttribute("user");
        Material material = new Material();
        if (user == null) {
            session.setAttribute("currentPage","redirect:/classroom/"+classId);
            return "redirect:/";
        }
        if (classroom.getOwnerUserId().getId() != user.getId()) {
            return "redirect:/";
        }
        if (classroom.getStatus()==0) {
            return "redirect:/classroom/"+classId+"?tab=material";
        }
        List<TagMaterial> tagMaterials = new ArrayList<TagMaterial>();
        if(tagId!=null) {
            for (int i = 0; i < tagId.size(); i++) {
                TagMaterial tagMaterial = new TagMaterial();
                tagMaterial.setMaterialId(material);
                Tag tagfind = tagDao.find(tagId.get(i));
                if(tagfind==null) {
                    return "redirect:/";
                }
                tagMaterial.setTagId(tagfind);
                tagMaterials.add(tagMaterial);
            }
        }

        if (newTag != null) {
            for (int i = 0; i < newTag.size(); i++) {
                TagMaterial tagMaterial = new TagMaterial();
                tagMaterial.setMaterialId(material);
                Tag tag = new Tag();
                tag.setTagName(newTag.get(i));
                tag.setTagCount(0);
                tagDao.persist(tag);
                tagMaterial.setTagId(tag);
                tagMaterials.add(tagMaterial);
            }
        }
        if (fileUpload != null && fileUpload.length > 0) {
            int error = 0;
            for (CommonsMultipartFile aFile : fileUpload) {
                File dir = new File("C:\\Classroom\\" + classId);
                if (dir.exists() == false) {
                    if(!dir.mkdirs()) {
                        System.out.println("Cant create folder");
                    }
                }
                try {
                    File fileServer = new File(dir.getAbsolutePath() + File.separator + aFile.getOriginalFilename());
                    if(fileServer.exists()) {
                        error = 1;
                    }
                    BufferedOutputStream stream = new BufferedOutputStream(
                            new FileOutputStream(fileServer));
                    stream.write(aFile.getBytes());
                    stream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    error = 1;
                }
                System.out.println("Saving file: " + aFile.getOriginalFilename());
                if (error == 0) {
                    material.setName(aFile.getOriginalFilename());
                    material.setFileURL(dir.getAbsolutePath() + File.separator + aFile.getOriginalFilename());
                    material.setOwnerClassId(classroom);
                    material.setSize(((Long) aFile.getSize()).doubleValue());
                    material.setCreationDate(new Date());
                    material.getTagMaterials().addAll(tagMaterials);
                    materialDao.persist(material);
                }

            }
        }
        return "redirect:/classroom/"+classId+"?tab=material";
    }
    @RequestMapping(value = "/download/check/{materialId}", method = RequestMethod.GET,produces = "application/json")
    public @ResponseBody String checkMaterial(@PathVariable Integer materialId) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "error";
        }
        Material material = materialDao.find(materialId);
        if(material==null){
            return "error";
        }
        File downloadFile = new File(material.getFileURL());
        if(downloadFile.exists()==false) {
            return "error";
        }

        return "OK";
    }

    @RequestMapping(value = "/download/{materialId}", method = RequestMethod.GET)
    public String downloadMaterialClass(@PathVariable Integer materialId,HttpServletResponse response ,HttpServletRequest request) {
        //validate and authorize
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/error";
        }
        Material material = materialDao.find(materialId);
        if(material==null){
            return "redirect:/error";
        }
        File downloadFile = new File(material.getFileURL());
        ServletContext context = request.getServletContext();
        FileInputStream inputStream = null;
        OutputStream outStream = null;
        try {
            inputStream = new FileInputStream(downloadFile);

            response.setContentLength((int) downloadFile.length());
//            response.setContentType(context.getMimeType(material.getFileURL()));

            // response header
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"",downloadFile.getName());
            response.setHeader(headerKey, headerValue);

            // Write response
            outStream = response.getOutputStream();
            IOUtils.copy(inputStream, outStream);
        } catch (IOException io) {
            return "redirect:/error";
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                if (null != inputStream)
                    inputStream.close();
                if (null != inputStream)
                    outStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        return "redirect:/error";
    }
    @RequestMapping(value = "/library/add/{folderId}/{materialId}", method = RequestMethod.POST,produces = "application/json")
    public @ResponseBody String copyMaterial(@PathVariable Integer folderId,
                                        @PathVariable Integer materialId) {
        User user = (User) session.getAttribute("user");
        Material material = materialDao.find(materialId);
        if(material==null){
            return "NG";
        }
        if(user.getRoleId().getId()== Constant.TEACHER) {
            return "NG";
        }
        int error = 0;
        if (user == null) {
            session.setAttribute("currentPage","redirect:/classroom/"+material.getOwnerClassId().getId());
            return "NG";
        }
        Folder folder = folderDao.find(folderId);
        if(folder==null) {
            return  "NG";
        }
        if(folder.getManagerId().getId()!=user.getId()) {
            return "NG";
        }
        List<Material> materials = folder.getMaterialList();
        if(materials != null) {
            for(int i = 0 ; i < materials.size() ; i++) {
                if(material.getName().equals(materials.get(i).getName())) {
                    return "Exist";
                }
            }
        }

        //validate
//        String destPath = "C:\\User"+"\\"+user.getId()+"\\"+folderId;
//        String dest = "C:\\User"+"\\"+user.getId()+"\\"+folderId + "\\" + material.getName();
//        try {
//            File filePath = new File(destPath);
//            if(!filePath.exists()) {
//                filePath.mkdirs();
//            }
//            File fileDest = new File(dest);
//            File fileSource = new File(material.getFileURL());
//            Utilities.copyFileUsingJava7Files(fileSource, fileDest);
//        } catch (FileAlreadyExistsException f) {
//            f.printStackTrace();
//            error = 1;
//            return "Exist";
//        } catch (IOException e) {
//            e.printStackTrace();
//            error = 1;
//            return "NG";
//        }
        //Send error to User
        Material materialCopy = new Material();
        materialCopy.setName(material.getName());
        materialCopy.setCreationDate(new Date());
        materialCopy.setFolderId(folder);
        materialCopy.setFileURL(material.getFileURL());
        materialCopy.setSize(material.getSize());
        materialDao.persist(materialCopy);
        return "OK";
    }
    @RequestMapping(value = "/folders", method = RequestMethod.GET,produces = "application/json")
    public @ResponseBody List<FolderDto> listFolder(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) session.getAttribute("user");
        List<FolderDto> folderDtos = null;
        if(user==null) {
            try {
                request.getRequestDispatcher("/WEB-INF/view/404.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return folderDtos;
        }
        List<Folder> folders = folderDao.findByUser(user);
        folderDtos = new ArrayList<FolderDto>();
        for (int i = 0; i < folders.size();i++) {
            folderDtos.add(ConvertEntityDto.convertFolderToFolderDto(folders.get(i)));
        }
        return folderDtos;
    }

    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        return null;
    }
}
