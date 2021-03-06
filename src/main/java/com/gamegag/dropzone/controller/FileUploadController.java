package com.gamegag.dropzone.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gamegag.common.controller.HomeController;
import com.gamegag.dropzone.model.UploadedFile;
import com.gamegag.security.util.SecurityUtil;
import com.gamegag.user.model.Post;
import com.gamegag.user.model.User;
import com.gamegag.user.repository.PostRepository;
import com.gamegag.user.repository.UserRepository;

@Controller 
public class FileUploadController {


@Autowired
private PostRepository repo_post;

//  @Autowired
//  private FileUploadService uploadService;
	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired private UserRepository repository_user;
	
	//private RepositoryUserDetailsService reposervice;
	
  @RequestMapping("/")
  public String home() {

    return "fileUploader";
  }

  @RequestMapping(value = "/upload", method = RequestMethod.POST)
  public @ResponseBody List<UploadedFile> upload(MultipartHttpServletRequest request,
      HttpServletResponse response,HttpServletRequest requestS) throws IOException {

	LOGGER.debug("lancement upload");
    // Getting uploaded files from the request object
    Map<String, MultipartFile> fileMap = request.getFileMap();

    // Maintain a list to send back the files info. to the client side
    List<UploadedFile> uploadedFiles = new ArrayList<UploadedFile>();
    String target = requestS.getParameter("target");
    String idImage = requestS.getParameter("imgId");
    
    
    // Iterate through the map
    for (MultipartFile multipartFile : fileMap.values()) {

      // Save the file to local disk
     saveFileToLocalDisk(multipartFile,target,idImage);

    }
    
    switch (target) {
	case "post":
		Long id 	= Long.parseLong(idImage,10);
		Post post = repo_post.findOne(id);
		FileController file = new FileController(target);
		String fileName = file.getRelativePath()+file.getFileName(id);
		post.setFilename(fileName);
		repo_post.save(post);
		break;
	case "profil":
		LOGGER.debug(this.getClass().toString()+" try profil");
		Long idProfil 	= Long.parseLong(idImage,10);
		LOGGER.debug(this.getClass().toString()+" try profil id");
		UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		LOGGER.debug(this.getClass().toString()+" try profil 1");
		final User user = repository_user.findByEmail(userDetails.getUsername());
		LOGGER.debug(this.getClass().toString()+" try profil 2");
		FileController fileProfil = new FileController(target);
		LOGGER.debug(this.getClass().toString()+" try profil 3");
		String fileNameProfil = fileProfil.getRelativePath()+fileProfil.getFileName(idProfil);
		LOGGER.debug(this.getClass().toString()+" try profil 4");
		user.setFilename(fileNameProfil);
		LOGGER.debug(this.getClass().toString()+" try profil 5");
		repository_user.save(user);
		break;
	default:
		break;
	}
     UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
     User user = repository_user.findByEmail(userDetails.getUsername());
     SecurityUtil.logInUser(user);
    //userDetails =  reposervice.loadUserByUsername(userDetails.getUsername());
    
    return uploadedFiles;
  }
//
//
//  @RequestMapping(value = {"/list"})
//  public String listBooks(Map<String, Object> map) {
//
//    map.put("fileList", uploadService.listFiles());
//
//    return "/listFiles";
//  }
//
//  @RequestMapping(value = "/get/{fileId}", method = RequestMethod.GET)
//  public void getFile(HttpServletResponse response, @PathVariable Long fileId) {
//
//    UploadedFile dataFile = uploadService.getFile(fileId);
//
//    File file = new File(dataFile.getLocation(), dataFile.getName());
//
//    try {
//      response.setContentType(dataFile.getType());
//      response.setHeader("Content-disposition", "attachment; filename=\"" + dataFile.getName()
//          + "\"");
//
//      FileCopyUtils.copy(FileUtils.readFileToByteArray(file), response.getOutputStream());
//
//    } catch (IOException e) {
//      e.printStackTrace();
//    }
//  }


  private void saveFileToLocalDisk(MultipartFile multipartFile,String target,String idImage) throws IOException,
      FileNotFoundException {

    String outputFileName = getOutputFilename(multipartFile,target,idImage);

    FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(outputFileName));
  }

//  private UploadedFile saveFileToDatabase(UploadedFile uploadedFile) {
//
//    return uploadService.saveFile(uploadedFile);
//
//  }

  private String getOutputFilename(MultipartFile multipartFile,String target,String idImage) {
	  LOGGER.debug("target location is : " + getDestinationLocation(target,idImage)+ multipartFile.getOriginalFilename());
    return getDestinationLocation(target,idImage) +  idImage + "-" + multipartFile.getOriginalFilename();
  }

//  private UploadedFile getUploadedFileInfo(MultipartFile multipartFile) throws IOException {
//
//    UploadedFile fileInfo = new UploadedFile();
//    fileInfo.setName(multipartFile.getOriginalFilename());
//    fileInfo.setSize(multipartFile.getSize());
//    fileInfo.setType(multipartFile.getContentType());
//    fileInfo.setLocation(getDestinationLocation());
//
//    return fileInfo;
//  }

  private String getDestinationLocation(String target,String idImage) {
	FileController file = new FileController(target);
	file.clean(idImage);
    return new java.io.File("").getAbsolutePath()+file.getLocation();
  }
}
