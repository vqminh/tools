package com.ato;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.util.Base64;
import android.util.Log;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Iterator;


public class Zalo {
  public static String getHashKey(Context context) {
    try {
      PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), PackageManager.GET_SIGNATURES);
      for (Signature signature : info.signatures) {
        MessageDigest md = MessageDigest.getInstance("SHA");
        md.update(signature.toByteArray());
        String sig = Base64.encodeToString(md.digest(), Base64.DEFAULT).trim();
        if (sig.trim().length() > 0) {
          Log.i("hash key", sig);
          return sig;
        }
      }
    } catch (java.lang.Throwable e) {
      Log.i("e", "hash key", e);
    }
    return "";
  }
}