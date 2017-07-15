import java.io.*;
import java.util.*;
import java.math.*;

public class BigNumber {

  public static void main1(String[] args) {
    Scanner in = new Scanner(System.in);

    BigInteger a = in.nextBigInteger();
    BigInteger b = in.nextBigInteger();

    BigInteger c = a.add(b);
    BigInteger d = a.multiply(b);

    System.out.print(c + "\n");
    System.out.print(d + "\n");
  }

  // sort string decimals and maintain string format
  public static void main2(String[] args) {
    //Input
    Scanner sc= new Scanner(System.in);
    int n = sc.nextInt();
    String[] s = new String[n + 2];
    for(int i = 0; i < n; i++) { s[i] = sc.next(); }
    sc.close();

    // this does not work, b/c the array is initialized
    // with n+2 space so there are NULL values
    //
    // Arrays.sort(s, (String o1, String o2) -> {
    //   BigDecimal l = new BigDecimal(o1);
    //   BigDecimal r = new BigDecimal(o2);
    //
    //   System.out.println(l);
    //   System.out.println(r);
    //
    //   System.out.println(l.compareTo(r));
    //
    //   return l.compareTo(r);
    // });

    // perform a bubble sort
    //
    for(int i = 0; i < s.length; i++) {
      for(int j = 1; j < s.length; j++ ) {
        if(s[j] == null) { break; }
        BigDecimal l = new BigDecimal(s[j-1]);
        BigDecimal r = new BigDecimal(s[j]);
        if(l.compareTo(r) < 0) {
          String tmp = s[j-1];
          s[j-1] = s[j];
          s[j] = tmp;
        }
      }
    }

    //Output
    for(int i=0;i<n;i++) { System.out.println(s[i]); }
  }

  // check primality
  //
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    BigInteger n = in.nextBigInteger();
    in.close();
    String output = n.isProbablePrime(1) ? "prime" : "not prime";
    System.out.println(output);
   }
}
