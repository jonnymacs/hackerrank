import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;
import java.security.*;

public class solution {
  // private static final int B;
  // private static final int H;
  // private static final Boolean flag;
  //
  // static {
  //   Scanner in = new Scanner(System.in);
  //   B = in.nextInt();
  //   H = in.nextInt();
  //   if(B > 0 && H > 0) {
  //     flag = true;
  //   } else {
  //     //throw new java.lang.Error("this is very bad");
  //     flag = false;
  //     System.out.println("java.lang.Exception: Breadth and height must be positive");
  //   }
  //   in.close();
  // }
  //
  // public static void main(String[] args){
  // 	if(flag){
  // 	  int area=B*H;
  // 		System.out.print(area);
  //   }
  // }//end of main

  public static void main(String[] args) {

    DoNotTerminate.forbidExit();

    try {
       Scanner in = new Scanner(System.in);
       int n = in.nextInt();
       in.close();

       String s = Integer.toString(n);

       if (n == Integer.parseInt(s)) {
         System.out.println("Good job");
       } else {
         System.out.println("Wrong answer.");
       }
    } catch (DoNotTerminate.ExitTrappedException e) {
        System.out.println("Unsuccessful Termination!!");
    }
  }
}

//The following class will prevent you from terminating the code using exit(0)!
class DoNotTerminate {

    public static class ExitTrappedException extends SecurityException {
      private static final long serialVersionUID = 1;
    }

    public static void forbidExit() {
      final SecurityManager securityManager = new SecurityManager() {
        @Override
        public void checkPermission(Permission permission) {
          if (permission.getName().contains("exitVM")) {
            throw new ExitTrappedException();
          }
        }
      };
      System.setSecurityManager(securityManager);
    }
}
