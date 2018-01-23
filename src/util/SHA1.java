package util;

import java.io.UnsupportedEncodingException;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
  
public class SHA1 {
  
 private String convertToHex(byte[] data) {
      StringBuffer buffer = new StringBuffer();
      for (int i=0; i<data.length; i++)
      {
          if (i % 4 == 0 && i != 0)
              buffer.append("");
          int x = (int) data[i];
          if (x<0)
              x+=256;
          if (x<16)
              buffer.append("0");
          buffer.append(Integer.toString(x,16));
      }
      return buffer.toString();
 }
  
    public String getSHA1(String text)
        throws NoSuchAlgorithmException, UnsupportedEncodingException  {
 
        MessageDigest md;
        md = MessageDigest.getInstance("SHA-1");
 
        byte[] sha1hash = new byte[40];
             
        md.update(text.getBytes("iso-8859-1"), 0, text.length());
        sha1hash = md.digest();
     
        return convertToHex(sha1hash);
    }
     
    public static void main(String[] args)
    {
      SHA1 mysha1 = new SHA1();
        try {
            System.out.println(mysha1.getSHA1("123"));
        } catch (NoSuchAlgorithmException e)
        {
        System.out.println("SHA1 Algorithm not supported !");
        e.printStackTrace();
        } catch (UnsupportedEncodingException e )
        {
        System.out.println("Unsupported encoding");
        e.printStackTrace();
        }
    }
}