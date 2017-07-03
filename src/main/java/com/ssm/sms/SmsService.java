package com.ssm.sms;


import org.apache.log4j.Logger;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

public class SmsService {
	private static SmsService instance;
	private static final Logger logger  = Logger.getLogger(SmsService.class);
	private IAcsClient client;
	private SendSmsRequest request;
	private String phone;
	private String signName;
	private String templateCode;
	private String jsonString;
    public static synchronized SmsService getInstance() {  
	    if (instance == null) {  
	        instance = new SmsService();  
	    }  
	    return instance;  
    }  
    private SmsService(){
    	client = getClient();
	}
    public void init(String phone, String signName, String templateCode, String jsonString){
    	this.phone = phone;
    	this.signName = signName;
    	this.templateCode = templateCode;
    	this.jsonString = jsonString;
    }
    public int sendMessCode(){
    	 
	     //必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为20个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
	     //request.setPhoneNumbers("18114494130");
    	 if(phone != null){
    		 request.setPhoneNumbers(phone);
    	 }else {
    		 request.setPhoneNumbers("18114494130");
    	 }
	     //必填:短信签名-可在短信控制台中找到
    	 if(signName != null){
    		 request.setSignName(signName);
    	 }else {
    		 request.setSignName("帅气的大鹏");
    	 }
	     //必填:短信模板-可在短信控制台中找到
    	 if(templateCode != null){
    		 request.setTemplateCode(templateCode);
    	 }else {
    		 request.setTemplateCode("SMS_75800089");
    	 }
	     //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
    	 if(jsonString != null){
    		 request.setTemplateCode(jsonString);
    	 }else {
    		 request.setTemplateCode("{\"name\":\"帅哥\", \"password\":\"1234\", \"time\":\"2017\"}");
    	 }
	     //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
	     //request.setOutId("yourOutId");
	    //请求失败这里会抛ClientException异常
	    SendSmsResponse sendSmsResponse = null;
		try {
			sendSmsResponse = client.getAcsResponse(request);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		} 
	    if(sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
	    //请求成功
	    	return 1;
	    }else{
	    	return -1;	
	    }
    }
	private IAcsClient getClient() {
		//组装请求对象
   	 	request = new SendSmsRequest();
		 //设置超时时间-可自行调整
	    System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
	    System.setProperty("sun.net.client.defaultReadTimeout", "10000");
	    //初始化ascClient需要的几个参数
	    final String product = "Dysmsapi";//短信API产品名称
	    final String domain = "dysmsapi.aliyuncs.com";//短信API产品域名
	    //替换成你的AK
	    final String accessKeyId = "LTAIuEpLAHdFaZU8";//你的accessKeyId,参考本文档步骤2
	    final String accessKeySecret = "NsNGZbhJAwELmMPFU4EddOygbJXfhj";//你的accessKeySecret，参考本文档步骤2
	    //初始化ascClient,暂时不支持多region
	    IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
	    try {
			DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
		} catch (ClientException e) {
			logger.error(e.getMessage(), e);
		}
	    IAcsClient acsClient = new DefaultAcsClient(profile);
	    return acsClient;
	}
}
