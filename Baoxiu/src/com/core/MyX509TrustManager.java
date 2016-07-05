package com.core;


  
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.X509TrustManager;  
 
/** 
* @author  LinShiqin: 
* @date 创建时间：2015年12月20日 上午9:31:58 
* @return  
*/
/** 
 * 证书信任管理器（用于https请求） 
 *  
 */  
public class MyX509TrustManager implements X509TrustManager {  
  
    public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {  
    }  
  
    public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {  
    }  
  
    public X509Certificate[] getAcceptedIssuers() {  
        return null;  
    }  
}  