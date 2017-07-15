import java.io.*;
import java.util.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.*;

public class Strings {
  // compare lexigraphically
  public static void main7(String[] args) {
    Scanner in = new Scanner(System.in);
    String A = in.next();
    String B = in.next();
    in.close();

    int length = A.length() + B.length();
    System.out.println(length);

    String b_smaller;
    b_smaller = A.compareTo(B) > 0 ? "Yes" : "No";
    System.out.println(b_smaller);

    String cap_a = A.substring(0, 1).toUpperCase() + A.substring(1);
    String cap_B = B.substring(0, 1).toUpperCase() + B.substring(1);
    System.out.println(cap_a + " " + cap_B);

  }

  // print a substring
  public static void main8(String[] args) {
      Scanner in = new Scanner(System.in);
      String S = in.next();
      int start = in.nextInt();
      int end = in.nextInt();
      in.close();

      System.out.println(S.substring(start,end));
  }

  public static String getSmallestAndLargest(String s, int k) {
    String smallest = "";
    String largest = "";
    List<String> k_length_substrings = new ArrayList<String>();

    for(int i = 0; i < s.length() - k + 1; i++) {
      String substring = s.substring(i,i+k);
      k_length_substrings.add(substring);
    }

    k_length_substrings.sort((o1, o2) -> o1.compareTo(o2));
    smallest = k_length_substrings.get(0);
    largest =  k_length_substrings.get(k_length_substrings.size() - 1);

    return smallest + "\n" + largest;
  }

  // find smallest and larget string in list
  public static void main9(String[] args) {
      Scanner scan = new Scanner(System.in);
      String s = scan.next();
      int k = scan.nextInt();
      scan.close();

      System.out.println(getSmallestAndLargest(s, k));
  }

  // identify string is pallendrom
  public static void main10(String[] args) {
      Scanner sc = new Scanner(System.in);
      String A = sc.next();
      int length = A.length();
      String answer = "Yes";
      for(int i = 0; i < A.length() / 2; i++ ){ if(A.charAt(i) != A.charAt(length - 1 - i)) answer = "No"; }
      System.out.println(answer);
  }

  // identify anagrams
  static boolean isAnagram(String a, String b) {
    int length_a = a.length();
    int length_b = b.length();
    if(length_a != length_b) { return false; }

    Map<Character,Integer> letters_a = new HashMap<Character,Integer>();

    for(int i = 0; i < length_a; i++) {
      char c = Character.toLowerCase(a.charAt(i));
      try {
        int count = letters_a.get(c);
        letters_a.put(c, ++count);
      } catch(NullPointerException e) {
        letters_a.put(c,1);
      }
    }

    for(int i = 0; i < length_b; i++) {
      char c = Character.toLowerCase(b.charAt(i));
      try {
        int count = letters_a.get(c);
        letters_a.put(c, --count);
        if(count == 0) { letters_a.remove(c); }
      } catch(NullPointerException e) {
        return false;
      }
    }
    return true;
  }

  // identify anagrams
  public static void main11(String[] args) {
      Scanner scan = new Scanner(System.in);
      String a = scan.next();
      String b = scan.next();
      scan.close();
      boolean ret = isAnagram(a, b);
      System.out.println( (ret) ? "Anagrams" : "Not Anagrams" );
  }

  // validate a username
  public static void main12(String[] args) {
    Scanner scan = new Scanner(System.in);
    String s = scan.nextLine();
    scan.close();
    s = s.trim();
    if(s.length() != 0) {
      String[] tokens = s.trim().split("[,|!|\\?|\\.|_|'|@| ]+");
      System.out.println(tokens.length);
      for(String token : tokens) { System.out.println(token); }
      return;
    } else {
      System.out.println("0");
      return;
    }
  }

  // compile a regex pattern
  public static void main13(String[] args) {
    Scanner in = new Scanner(System.in);
    int testCases = Integer.parseInt(in.nextLine());
    while(testCases>0){
       String pattern = in.nextLine();
       String valid;
       try { Pattern.compile(pattern); valid = "Valid"; } catch(PatternSyntaxException e) { valid = "Invalid"; }
       System.out.println(valid);
       if(!in.hasNext()) { break; }
    }
  }

  // parse IP address with a custom matcher class
  public static void main14(String[] args){
    Scanner in = new Scanner(System.in);
    while(in.hasNext()){
        String IP = in.next();
        System.out.println(IP.matches(new MyRegex().pattern));
    }
  }

  // remove repeated words
  public static void main15(String[] args) {

        String regex = "\\b(\\w+)(\\b\\W+\\b\\1\\b)+";
        Pattern p = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);

        Scanner in = new Scanner(System.in);
        int numSentences = Integer.parseInt(in.nextLine());

        while (numSentences-- > 0) {
            String input = in.nextLine();
            Matcher m = p.matcher(input);

            // Check for subsequences of input that match the compiled pattern
            while (m.find()) {
              String value = m.group();
              input = input.replaceAll(value, value.split(" ")[0].trim());
            }

            // Prints the modified sentence.
            System.out.println(input);
        }

        in.close();
    }

    // parse html
    public static void main(String[] args) {
      Scanner in = new Scanner(System.in);
      int testCases = Integer.parseInt(in.nextLine());
      List<String> results = new ArrayList<String>();

      while(testCases>0){
          String line = in.nextLine();
          int count=0;
          Pattern r = Pattern.compile("<(.+?)>([^<>]+)</\\1>");
          Matcher m = r.matcher(line);
          while(m.find()) {
             if (m.group(2).length() !=0) {
               System.out.println(m.group(2));
               count++;
             }
          }
          if (count == 0) System.out.println("None");
          testCases--;
      }
    }
}

//used for main14
class MyRegex {
  public static String pattern = "\\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\\.|$)){4}\\b";
}
