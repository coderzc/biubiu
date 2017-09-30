package com.action;

import com.entity.Users;
import com.service.UploadService;
import com.utils.PropertiesUtil;
import com.utils.VideoUtils;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

/**
 * Created by admin on //.
 */
public class UploadAction extends JsonActionSupport implements ServiceSupport {
    private String saveBasePath;
    private String imagePath;
    private String videoPath;
    private String audioPath;
    private String thumbnailPath;


    private File file;
    private String fileFileName;
    private String fileContentType;

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getThumbnailPath() {
        return thumbnailPath;
    }

    public void setThumbnailPath(String thumbnailPath) {
        this.thumbnailPath = thumbnailPath;
    }

    public String getAudioPath() {
        return audioPath;
    }

    public void setAudioPath(String audioPath) {
        this.audioPath = audioPath;
    }

    public String getVideoPath() {
        return videoPath;
    }

    public void setVideoPath(String videoPath) {
        this.videoPath = videoPath;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getSaveBasePath() {
        return saveBasePath;
    }

    public void setSaveBasePath(String saveBasePath) {
        this.saveBasePath = saveBasePath;
    }


    public String video() {
        //服务器本地绝对根路径
        String servesRealPath = ServletActionContext.getServletContext().getRealPath("/");

        System.out.println(file);
        System.out.println(fileFileName);
        System.out.println(fileContentType);

        String fileExtend = fileFileName.substring(fileFileName.lastIndexOf("."));

        String fileSign = fileFileName.substring(0, fileFileName.lastIndexOf("."));

        String newFileName = fileSign + (System.currentTimeMillis());

        String save_final_videoPath = null;

        String save_final_videoCoverPath = null;

        String thumbnailName = null,
                thumbnailFile_path = null;
        boolean needThumb = false,
                extractOk = false;
        if (fileContentType.contains("video")) {

            // 提取缩量图
            needThumb = true;
            thumbnailName = newFileName + ".jpg";
            thumbnailFile_path
                    = servesRealPath + saveBasePath + thumbnailPath + thumbnailName;

            save_final_videoCoverPath = "/" + saveBasePath + thumbnailPath + thumbnailName;

            File thumbnailFile = new File(thumbnailFile_path);
            if (!thumbnailFile.getParentFile().exists()) {
                thumbnailFile.getParentFile().mkdirs();
            }

            String realPath = servesRealPath + saveBasePath + videoPath;
            File saveFile = new File(realPath, newFileName + fileExtend);

            save_final_videoPath = "/" + saveBasePath + videoPath + newFileName + fileExtend;

            // 存在同名文件，跳过
            if (!saveFile.exists()) {
                if (!saveFile.getParentFile().exists()) {
                    saveFile.getParentFile().mkdirs();
                }
                try {
                    FileUtils.copyFile(file, saveFile);
                    if (needThumb) {
                        extractOk = VideoUtils.extractThumbnail(saveFile, thumbnailFile_path);
                        System.out.println("提取缩略图成功:" + extractOk);
                    }
                    success = true;

                } catch (IOException e) {
                    System.out.println(e.getMessage());
                }
            } else {
                success = true;
            }
        }

        if (success) {
            resp_json.put("videoPath", save_final_videoPath);
            resp_json.put("videoCoverPath", save_final_videoCoverPath);
        }

        put_issuccess();

        return SUCCESS;
    }

    public String head_pic() {
        String userId = ServletActionContext.getRequest().getParameter("userId");//要修改头像的用户id
        String final_url = null;

        if (file != null && fileContentType.contains("image")) {
            //定义临时文件夹
            String tmp_path = request.getSession().getServletContext().getRealPath("tmp");
            String targetFileName = null;
            try {
                targetFileName = UploadService.upload(file, fileFileName, tmp_path, PropertiesUtil.getProperty("avatar.prefix"));
            } catch (Exception e) {
                success = false;
                e.printStackTrace();
            }
            final_url = PropertiesUtil.getProperty("cos.server.http.prefix") + targetFileName;

            Users user_ = USER_SERVICE.get(userId);
            if (user_ != null) {
                user_.setUserPicPath(targetFileName);
                if (USER_SERVICE.update(user_)) {//保存修改；
                    user_.setUserPicPath(final_url);
                    request.getSession().setAttribute("user", user_);
                    success = true;
                } else {
                    success = false;
                }
            } else {
                success = false;
            }

        } else {
            success = false;
        }


        if (success) {
            resp_json.put("userPicPath", final_url);
        }

        put_issuccess();

        return SUCCESS;
    }

}