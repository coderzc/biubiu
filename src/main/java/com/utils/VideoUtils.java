package com.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


public class VideoUtils {
    public static final String FFMPEG_EXECUTOR = PropertiesUtil.getProperty("ffmpeg_executor");
    public static final int THUMBNAIL_WIDTH = 320;
    public static final int THUMBNAIL_HEIGHT = 200;

    public static boolean extractThumbnail(File inputFile, String thumbnailOutput) {
        System.out.println(new File(thumbnailOutput).getAbsolutePath() );
        List<String> command = new ArrayList<String>();
        File ffmpegExe = new File(FFMPEG_EXECUTOR);
        if (!ffmpegExe.exists()) {
            System.out.println("转码工具不存在");
            return false;
        }

        System.out.println(ffmpegExe.getAbsolutePath());
        System.out.println(inputFile.getAbsolutePath());
        command.add(ffmpegExe.getAbsolutePath());
        command.add("-ss");
        command.add("10");
        command.add("-t");
        command.add("0.001");
        command.add("-i");
        command.add(inputFile.getAbsolutePath());
        command.add("-f");
        command.add("image2");
        command.add("-y");
        command.add("-s");
        command.add(THUMBNAIL_WIDTH + "*" + THUMBNAIL_HEIGHT);
        command.add(thumbnailOutput);

        ProcessBuilder builder = new ProcessBuilder();
        builder.command(command);
        builder.redirectErrorStream(true);
        try {
            long startTime = System.currentTimeMillis();
            Process process = builder.start();
            process.waitFor();
            System.out.println("启动耗时" + (System.currentTimeMillis() - startTime));
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}