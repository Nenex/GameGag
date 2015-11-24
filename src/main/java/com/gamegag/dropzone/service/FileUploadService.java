package com.gamegag.dropzone.service;

import java.util.List;

import com.gamegag.dropzone.model.UploadedFile;

public interface FileUploadService {

  List<UploadedFile> listFiles();

  UploadedFile getFile(Long id);

  UploadedFile saveFile(UploadedFile uploadedFile);

}
