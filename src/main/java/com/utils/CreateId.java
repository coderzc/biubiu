package com.utils;

import java.util.Random;
/*
* author 朱婷婷
*
* 版权所有
* */

public class CreateId {

    //位数基
    final static int[] sizeTable = { 9, 99, 999, 9999, 99999, 999999, 9999999,    
            99999999, 999999999, Integer.MAX_VALUE };


    //计算数的位数
    public  static  int sizeOfInt(int x) {
        for (int i = 0;; i++)    
            if (x <= sizeTable[i])    
                return i + 1;    
    }


    //生成随机序列码
    public static String OneId(int len){
        Random random=new Random();
        int num=random.nextInt(sizeTable[len-1]+1);//生成一个8位随机数
        String Id="";
        int numDigit= sizeOfInt(num);
        for(int i=0;i<len-numDigit;i++){
            Id=Id+"0";
        }
//        System.out.println("num:"+num+"id:"+Id);
        return Id+num;
    }
}
   
    
            

