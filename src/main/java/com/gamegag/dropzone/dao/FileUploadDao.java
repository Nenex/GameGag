package com.gamegag.dropzone.dao;

import java.util.List;

import com.gamegag.dropzone.model.UploadedFile;

public interface FileUploadDao {

  List<UploadedFile> listFiles();

  UploadedFile getFile(Long id);

  UploadedFile saveFile(UploadedFile uploadedFile);

}
