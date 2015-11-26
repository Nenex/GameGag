package com.gamegag.dropzone.controller;

import java.io.File;
import java.io.FilenameFilter;

public class FileController {

	private String folder;
	
	public FileController(String folder) {
		this.folder = folder;
	}

	public String getFolder() {
		return folder;
	}

	public void setFolder(String folder) {
		this.folder = folder;
	}

	public String getFileName(final Long id) {

		File root = new File(new java.io.File("").getAbsolutePath() + getLocation());
		FilenameFilter matchId = new FilenameFilter() {
			public boolean accept(File directory, String filename) {
				return filename.startsWith(id + "-");
			}
		};
		String fileName = null;
		File[] files = root.listFiles(matchId);
		for (File f : files) {
			fileName = f.getName();
			break;
		}

		return fileName == null ? "anonyme.jpg" : fileName;
	}
	
	public String getLocation(){
		return "\\src\\main\\webapp\\static\\upload\\"+this.folder+"\\";
	}
	
	public String getRelativePath(){
		return "\\static\\upload\\"+this.folder+"\\";
	}
	
	public void clean(final String idImage){
		File root = new File(new java.io.File("").getAbsolutePath() + getLocation());
		FilenameFilter matchId = new FilenameFilter() {
			public boolean accept(File directory, String filename) {
				return filename.startsWith(idImage + "-");
			}
		};
		File[] files = root.listFiles(matchId);
		for (File f : files) {
			f.delete();
		}
	}
}
