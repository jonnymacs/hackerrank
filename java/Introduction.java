import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;
import java.util.Arrays;
import java.util.ArrayList;

public class Introduction {

    public static void main1(String[] args) {
    
      Scanner sc=new Scanner(System.in);
    
      int n=sc.nextInt();
      String ans="";
    
      ans = "Not Weird";
    
      if(n%2==1){ ans = "Weird"; }
      else if (n > 5 && n <= 20) { ans = "Weird"; }
    
      System.out.println(ans);
    
    }
    
    public static void main2(String[] args) {
      Scanner scan = new Scanner(System.in);
      int i = scan.nextInt();
      double d = scan.nextDouble();
      scan.nextLine();
      String s = scan.nextLine();
    
      System.out.println("String: " + s);
      System.out.println("Double: " + d);
      System.out.println("Int: " + i);
    }
    
    public static void main3(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("================================");
        for(int i=0;i<3;i++)
        {
            String s1=sc.next();
            int x=sc.nextInt();
            System.out.printf("%-15s%03d%n", s1, x);
        }
        System.out.println("================================");
    }
    
    public static void main4(String[] args) {
      Scanner sc = new Scanner(System.in);
      int i = sc.nextInt();
      for(int j=1; j<=10; j++) {
          int x = i * j;
          System.out.printf("%d x %d = %d%n", i, j, x);
      }
    }

    public static void main5(String[] args){
      Scanner in = new Scanner(System.in);
      int t=in.nextInt();
      for(int i=0;i<t;i++){
          int a = in.nextInt();
          int b = in.nextInt();
          int n = in.nextInt();

          int[] res = new int[n];
          res[0] = a + b;

          for(int j=1; j<n; j++) {
            double di = Math.pow(2, (double)j);
            int val = (int) di;
            res[j] = res[j-1] + val * b;
          }

          StringBuilder builder = new StringBuilder();
          for (int value : res) { builder.append(value + " "); }
          String text = builder.toString();
          System.out.println(text);
      }
      in.close();
    }
    
    public static void main(String[] args) {
      Scanner sc = new Scanner(System.in);
      int t = sc.nextInt();
      for(int i=0; i<t; i++) {
        List<String> types = new ArrayList<String>(Arrays.asList("byte", "short", "int", "long"));
        String value = sc.next();
        
        try { byte val = Byte.valueOf(value);
        } catch(NumberFormatException ebyte) {
          types.remove(0);
          try { short val = Short.valueOf(value);
          } catch(NumberFormatException eshort) {
            types.remove(0);
            try { int val = Integer.valueOf(value);
            } catch(NumberFormatException eint) {
              types.remove(0);
              try { long val = Long.valueOf(value);
              } catch(NumberFormatException elong) {
                types.remove(0);
              }
            }
          }
        }
        
        if(types.size() == 0) { System.out.printf("%s can't be fitted anywhere.%n", value); }
        else {
          System.out.printf("%s can be fitted in:%n", value);
          for(String type : types) {
            System.out.printf("* %s%n", type);
          }  
        }
        
        // try {
        //   long x = sc.nextLong();
        //   System.out.println(x+" can be fitted in:");
        //   if(x >= -128 && x < 128) System.out.println("* byte");
        //   if(x >= -32768 && x < 32768) System.out.println("* short");
        //   if(x >= -Math.pow(2,31) && x < Math.pow(2,31)) System.out.println("* int");
        //   if(x >= -Math.pow(2,63) && x < Math.pow(2,64)) System.out.println("* long");
        // } catch(Exception e) {
        //   System.out.println(sc.next()+" can't be fitted anywhere.");
        // }
      }
      
    }
}
