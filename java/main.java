import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;
import java.util.Arrays;

public class main {

    // public static void main(String[] args) {
    //
    //   Scanner sc=new Scanner(System.in);
    //
    //   int n=sc.nextInt();
    //   String ans="";
    //
    //   ans = "Not Weird";
    //
    //   if(n%2==1){ ans = "Weird"; }
    //   else if (n > 5 && n <= 20) { ans = "Weird"; }
    //
    //   System.out.println(ans);
    //
    // }

    // public static void main(String[] args) {
    //   Scanner scan = new Scanner(System.in);
    //   int i = scan.nextInt();
    //   double d = scan.nextDouble();
    //   scan.nextLine();
    //   String s = scan.nextLine();
    //
    //   System.out.println("String: " + s);
    //   System.out.println("Double: " + d);
    //   System.out.println("Int: " + i);
    // }

    // public static void main(String[] args) {
    //     Scanner sc=new Scanner(System.in);
    //     System.out.println("================================");
    //     for(int i=0;i<3;i++)
    //     {
    //         String s1=sc.next();
    //         int x=sc.nextInt();
    //         System.out.printf("%-15s%03d%n", s1, x);
    //     }
    //     System.out.println("================================");
    // }

    // public static void main(String[] args) {
    //   Scanner sc = new Scanner(System.in);
    //   int i = sc.nextInt();
    //   for(int j=1; j<=10; j++) {
    //       int x = i * j;
    //       System.out.printf("%d x %d = %d%n", i, j, x);
    //   }
    // }

    public static void main(String []args){
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
}
