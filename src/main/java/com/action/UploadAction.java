package com.action;

import com.entity.Users;
import com.service.UploadService;
import com.utils.PropertiesUtil;
import org.apache.struts2.ServletActionContext;

import java.io.File;

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
        //定义临时文件夹
        String tmp_path = request.getSession().getServletContext().getRealPath("tmp");

        String videoURL = null;

        String videoCoverURL = null;

        String targetVideoURI = null;

        String targetVideoCoverURI = null;

        boolean isVideoOK = false;
        boolean isCoverOk = false;
        if (file != null && fileContentType.contains("video")) {

            String thumbnailExtend = ".jpg";
            //提取并上传封面
            try {
                targetVideoCoverURI = UploadService.extractAndUplaod(file, thumbnailExtend, tmp_path, PropertiesUtil.getProperty("video_cover.prefix"));
                videoCoverURL = PropertiesUtil.getProperty("cos.server.http.prefix") + targetVideoCoverURI;
                isCoverOk = true;
            } catch (Exception e) {
                success = false;
                e.printStackTrace();
            }

            //上传视频
            try {
                targetVideoURI = UploadService.upload(file, fileFileName, tmp_path, PropertiesUtil.getProperty("video.prefix"));
                videoURL = PropertiesUtil.getProperty("cos.server.http.prefix") + targetVideoURI;
                isVideoOK = true;
            } catch (Exception e) {
                success = false;
                e.printStackTrace();
            }

        }

        if (isVideoOK && isCoverOk) {
            success = true;
            resp_json.put("videoURL", videoURL);
            resp_json.put("videoCoverURL", videoCoverURL);
            resp_json.put("videoURI", targetVideoURI);
            resp_json.put("videoCoverURI", targetVideoCoverURI);
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