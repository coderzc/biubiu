package com.action;
//package com.action;
//
//import com.opensymphony.xwork2.ActionSupport;
//import org.apache.commons.io.FileUtils;
//import org.apache.struts2.ServletActionContext;
//
//import java.io.File;
//import java.util.List;
//
//public class FileUploadAction extends ActionSupport {
//
//    private List<File> upload;
//
//    public List<File> getUpload() {
//        return upload;
//    }
//
//    public void setUpload(List<File> upload) {
//        this.upload = upload;
//    }
//
//    public List<String> getUploadContentType() {
//        return uploadContentType;
//    }
//
//    public void setUploadContentType(List<String> uploadContentType) {
//        this.uploadContentType = uploadContentType;
//    }
//
//    public List<String> getUploadFileName() {
//        return uploadFileName;
//    }
//
//    public void setUploadFileName(List<String> uploadFileName) {
//        this.uploadFileName = uploadFileName;
//    }
//
//    public String getResult() {
//        return result;
//    }
//
//    public void setResult(String result) {
//        this.result = result;
//    }
//
//    private List<String> uploadContentType;
//
//    private List<String> uploadFileName;
//
//    private String result;
//
//    @Override
//    public String execute() throws Exception {
//        System.out.println(ServletActionContext.getServletContext().getRealPath("/res"));
//        if(upload!=null&&!upload.isEmpty()){
////            String path = "d:/img/";
////            File file = new File(path);
////            if (!file.exists()) {
////                file.mkdir();
////            }
////
////            for (int i = 0; i < upload.size(); i++) {
////                FileUtils.copyFile(upload.get(i), new File(file, uploadFileName.get(i)));
////            }
//
//            result = "ok";
//
//            return SUCCESS;
//        }else {
//            result = "kong";
//
//            return "kong";
//        }
//    }
//}
