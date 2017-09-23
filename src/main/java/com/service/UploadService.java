package com.service;

import com.utils.COSUtil;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.util.UUID;

public class UploadService {

    public static String upload(File file, String fileName, String tmp_path, String cosPathPrefix) throws Exception {
        //扩展名
        //abc.jpg
        String fileExtend = fileName.substring(fileName.lastIndexOf("."));
        String uploadFileName = UUID.randomUUID().toString() + fileExtend;

        File fileDir = new File(tmp_path);
        if (!fileDir.exists()) {
            fileDir.setWritable(true);
            fileDir.mkdirs();
        }
        File targetFile = new File(tmp_path, uploadFileName);

        FileUtils.copyFile(file, targetFile);//复制到服务器


        Boolean aBoolean = COSUtil.uploadFile(cosPathPrefix + uploadFileName, targetFile.getAbsolutePath());
        if (!aBoolean) {
            throw new Exception("COS上传失败");
        }
        //已经上传到Cos

        targetFile.delete();


        //  /img/ -> img/
        return cosPathPrefix.substring(1, cosPathPrefix.length()) + targetFile.getName();
    }
}
