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

    public static void main6(String[] args) {
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
      sc.close();
    }

    public static void main7(String[] args) {
      Scanner in = new Scanner(System.in);
      int i = 1;
      while(in.hasNext()) {
        String line = in.nextLine();
        System.out.println(i + " " + line);
        i++;
      }
      in.close();
    }

    public static void main8(String[] args) {
      Scanner in = new Scanner(System.in);
      String month = in.next();
      String day = in.next();
      String year = in.next();

      DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
      try {
        Date date = formatter.parse(month + "/" + day + "/" + year);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        System.out.println(cal.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.US).toUpperCase());
      } catch (ParseException e) {
        e.printStackTrace();
      }
      in.close();
    }

    public static void main(String[] args) {
      Scanner in = new Scanner(System.in);
      double payment = in.nextDouble();
      in.close();

      // Map<String,String> countries = new HashMap<String,String>() {{
      //   put("US", "en_US");
      //   put("India", "en_IN");
      //   put("China", "zh_CN");
      //   put("France", "fr_FR");
      // }};

      // for(String country : countries) {
      //   NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.US);
      //   String us = nf.format(payment);
      // }

      // Iterator it = countries.entrySet().iterator();
      // while (it.hasNext()) {
      //     Map.Entry pair = (Map.Entry)it.next();
      //     NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale(pair.getValue().toString()));
      //     System.out.println(pair.getKey() + ": " + nf.format(payment));
      //     it.remove(); // avoids a ConcurrentModificationException
      // }

      NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("en", "US"));
      String us = nf.format(payment);
      System.out.println("US: " + us);

      nf = nf.getCurrencyInstance(new Locale("en", "IN"));
      String india = nf.format(payment);
      System.out.println("India: " + india);

      nf = nf.getCurrencyInstance(Locale.CHINA);
      String china = nf.format(payment);
      System.out.println("China: " + china);

      nf = nf.getCurrencyInstance(Locale.FRANCE);
      String france = nf.format(payment);
      System.out.println("France: " + france);
    }
}
