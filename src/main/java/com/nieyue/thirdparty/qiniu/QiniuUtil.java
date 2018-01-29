package com.nieyue.thirdparty.qiniu;

import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import com.qiniu.util.Auth;

/**
 * 七牛云存储工具
 * @author 聂跃
 * @date 2018年1月10日
 */
@Configuration
public class QiniuUtil {
   @Value("${myPugin.qiniu.accessKey}")
   String accessKey;
   @Value("${myPugin.qiniu.secretKey}")
   String secretKey;
   @Value("${myPugin.qiniu.bucketName}")
   String bucketName;
   @Value("${myPugin.qiniu.privateBucketName}")
   String privateBucketName;
//   static String accessKey="dGJBFJKfsq-c74QCzTSxLAzPgcDw338-__AKWM8n";
//   static String secretKey="yTswXYndF5kVG7LrGb4mX6YqaitNDdjNIpxXIDyk";
//   static String bucketName="laoyeshuo";
//   static String privateBucketName="laoyeshuovideo";
//   static String domain="p2bhwwngu.bkt.clouddn.com";
//   static String privateDomain="p2c30vvva.bkt.clouddn.com";
   /**
    * 获取uploadToken
    * @return
    */
   public String getQiniuUploadToken(){
	   Auth auth = Auth.create(accessKey, secretKey);
	   String token = auth.uploadToken(bucketName);
	   return token;
   }
   /**
    * 获取私有uploadToken
    * @return
    */
   public String getQiniuPrivateUploadToken(){
	   Auth auth = Auth.create(accessKey, secretKey);
	   String token = auth.uploadToken(privateBucketName);
	   return token;
   }
   /**
    * 获取私有DownloadUrl
    * @return
    */
   public String getQiniuPrivateUDownloadUrl(String url,long expires){
	   Auth auth = Auth.create(accessKey, secretKey);
		//String downloadUrl = auth.privateDownloadUrl(url);
		String downloadUrl = auth.privateDownloadUrl(url,expires);
	   return downloadUrl;
   }
   public static void main(String[] args) {
	//System.out.println(new QiniuUtil().getQiniuUploadToken());
	//System.out.println(new QiniuUtil().getQiniuPrivateUDownloadUrl("http://"+privateDomain+"/a.mp4",15));
}
}
