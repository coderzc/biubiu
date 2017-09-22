package com.utils;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.request.UploadFileRequest;
import com.qcloud.cos.sign.Credentials;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Created by zc on 2017/6/16.
 */
public class COSUtil {
    private static final Logger logger = LoggerFactory.getLogger(COSUtil.class);

    private COSClient cosClient;
    private long appId = Long.parseLong(PropertiesUtil.getProperty("appId"));
    private String secretId = PropertiesUtil.getProperty("secretId");
    private String secretKey = PropertiesUtil.getProperty("secretKey");
    // 设置要操作的bucket
    private String bucketName = PropertiesUtil.getProperty("bucketName");

    private COSUtil() {
        // 初始化客户端配置
        ClientConfig clientConfig = new ClientConfig();
        // 设置bucket所在的区域，比如华南园区：gz； 华北园区：tj；华东园区：sh ；
        clientConfig.setRegion(PropertiesUtil.getProperty("region"));
        // 初始化cosClient
        Credentials cred = new Credentials(appId, secretId, secretKey);
        this.cosClient = new COSClient(clientConfig, cred);
    }


    public static Boolean uploadFile(String cosPath, String localPath) {
        COSUtil cosUtil = new COSUtil();

        UploadFileRequest uploadFileRequest = new UploadFileRequest(
                cosUtil.bucketName, cosPath, localPath);
        String uploadFileRet = cosUtil.cosClient.uploadFile(uploadFileRequest);
        JSONObject map = new JSONObject(uploadFileRet);
        if ((int) map.get("code") != 0) {
            logger.info("上传失败码：" + (int) map.get("code") + "原因：" + map.get("message"));
            return false;
        }
        return true;
    }

}
