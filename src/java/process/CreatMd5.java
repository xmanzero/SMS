/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package process;

import java.security.MessageDigest;

/**
 *
 * @author smile_000
 */
public class CreatMd5 {
    public static String ArcMd5(String message){
       try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(message.getBytes());
			byte[] bytes = md.digest();
			StringBuffer hexString = new StringBuffer();
			for (byte b: bytes) {
				String hex = Integer.toHexString(0xff & b);
				if (hex.length() == 1) {
					hexString.append("0");
				}
				hexString.append(hex);
			}
			message = hexString.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
    }
    
}
