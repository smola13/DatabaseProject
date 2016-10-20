package Lab3;

import java.security.spec.KeySpec; import javax.crypto.*;
import javax.crypto.spec.DESedeKeySpec;

import sun.misc.BASE64Decoder; import sun.misc.BASE64Encoder;
public class PWCrypto
{
private static final String cipher = "DESede";
private static String key = "d07d f25b a2c8 fa76 061c a7e3 22ef a39d";
 private static SecretKey ky = null; private static Cipher c = null;
public static void init (String keyString_p) throws Exception {
 if
(keyString_p!=null) key = keyString_p
;
byte[] enc = key.getBytes("UTF-8");
KeySpec ks = null; SecretKeyFactory kf = null;
ks = new DESedeKeySpec(enc);
kf = SecretKeyFactory.getInstance(cipher);
ky = kf.generateSecret
(ks);
c = Cipher.getInstance(cipher);

}
public static String encrypt(String originalMsg_p)throws Exception {
if (c==null) init(null);
c.init
(Cipher.ENCRYPT_MODE, ky);
byte[] utf8 = originalMsg_p.getBytes("UTF-8");
byte [] enc1 = c.doFinal(utf8);
BASE64Encoder encoder = new BASE64Encoder();
return encoder.encode(enc1);
}
public static String decrypt(String encryptedMsg_p)throws Exception {
if (c==null) init(null);
BASE64Decoder decoder = new BASE64Decoder();
byte[] enc3 = decoder.decodeBuffer
(encryptedMsg_p);
c.init
(Cipher.DECRYPT_MODE, ky);
 String result = new String(c.doFinal(enc3),"UTF-8");
 return result; }
}
