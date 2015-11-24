package com.gamegag.dropzone.service.impl;

import java.util.List;

import com.gamegag.dropzone.dao.FileUploadDao;
import com.gamegag.dropzone.model.UploadedFile;
import com.gamegag.dropzone.service.FileUploadService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FileUploadServiceImpl implements FileUploadService {

  @Autowired
  private FileUploadDao dao;

  @Override
  @Transactional(readOnly = true)
  public List<UploadedFile> listFiles() {

    return dao.listFiles();
  }


  @Override
  @Transactional(readOnly = true)
  public UploadedFile getFile(Long id) {
    return dao.getFile(id);
  }

  @Override
  @Transactional
  public UploadedFile saveFile(UploadedFile uploadedFile) {
    return dao.saveFile(uploadedFile);

  }

}
