package com.saw.good.common.encrypt;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class AESEncrypt {
	
	private static SecretKey key;
	private String path;
	
	public AESEncrypt() {
		
		String path = AESEncrypt.class.getResource("/").getPath();
		//logger.debug(path);
		System.out.println(path);
		//this.path=path.substring(0, path.indexOf("target"))+"src/main/webapp/WEB-INF";
		this.path=path.substring(0, path.indexOf("classes"));
		System.out.println(this.path);
		File f = new File(this.path+"/secret.bs");
		if(f.exists()) {
			try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(f));){
				key = (SecretKey)ois.readObject();
			}catch(ClassNotFoundException e) {
				e.printStackTrace();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				generateKey();
				
			}catch(NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}
	}
	//키를 생성하는 메소드 
	private void generateKey() throws NoSuchAlgorithmException {
		
		SecureRandom sr = new SecureRandom();
		KeyGenerator keygen = KeyGenerator.getInstance("AES");
		keygen.init(128,sr);
		key = keygen.generateKey();
		
		File f = new File(path+"/secret.bs");
		try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(f));){
			oos.writeObject(key);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		
	}
	//암호화 메소드 만들기 
		//필요한 곳에서 사용할 수 있게 static으로 작성
		public static String encrypt(String str) {
			//Cipher객체를 이용하여 암호화를 진행
			byte [] enStr = null;
			try {
				Cipher cipher = Cipher.getInstance("AES");//chiper설정(암호화 방식 지정)
				cipher.init(Cipher.ENCRYPT_MODE, key);//암호화 모드적용하고 키를 넣어줌(key값 지정)
				//암호화는 비트로 진행됨 ?? 
				enStr = cipher.doFinal(str.getBytes());//암호화 처리 
			}catch(Exception e) {
				e.printStackTrace();

				//NoSuchAlgorithmException : 알고리즘 자체가 없을 때 , NoSuchPaddingException : 암호화 할때, 
				//IllegalBlockSizeException: 암호화 할때, BadPaddingExeption:암호화 할때
				//InvalidKeyException :잘못된 키를 가져왔을때 
				return str;
			}
			//암호화된 비트를 base64인코더를 이용하여 문자열 처리 
			return enStr!=null?Base64.getEncoder().encodeToString(enStr):str;

		}

		//복호화 메소드 만들기 
		public static String decrypt(String str) throws UnsupportedEncodingException{
			byte [] decryptStr = null;
			try {
				Cipher cipher = Cipher.getInstance("AES");
				cipher.init(Cipher.DECRYPT_MODE,key);
				//base64를 이용하여 문자열로 인코딩을 한 원본값을 가져온다 
				//base64 디코더를 이용하여 원본 byte[]값으로 만들어줌 
				byte [] decodeStr = Base64.getDecoder().decode(str.getBytes());
				decryptStr = cipher.doFinal(decodeStr);
			}catch(Exception e) {
				e.printStackTrace();
				return str;
			}
			return new String(decryptStr,"UTF-8");
		}
	

}
