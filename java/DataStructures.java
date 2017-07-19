import java.io.*;
import java.util.*;
import java.util.HashMap;
import java.util.stream.*;
import java.text.*;
import java.math.*;
import java.lang.reflect.Method;

public class DataStructures {

   //2d array
   public static void main2(String[] args) {
     Scanner in = new Scanner(System.in);
     int[][] arr = new int[6][6];
     int largest_hourglass = -9*7;

     for(int i=0; i < 6; i++){
       for(int j=0; j < 6; j++){
         arr[i][j] = in.nextInt();
       }
     }

     for(int i = 0; i < 4; i++) {
       for(int j = 0; j < 4; j++) {
         int hourglass_size = IntStream.of(Arrays.copyOfRange(arr[i], j, j+3)).sum() +
                              arr[i+1][j+1] +
                              IntStream.of(Arrays.copyOfRange(arr[i+2], j, j+3)).sum();
         largest_hourglass = hourglass_size > largest_hourglass ? hourglass_size : largest_hourglass;
       }
     }
     System.out.println(largest_hourglass);
   }

   // subarrays
   public static void main3(String[] args) {
     Scanner in = new Scanner(System.in);
     int n = in.nextInt();
     int[] nums = new int[n];
     for(int i = 0; i < n; i++) { nums[i] = in.nextInt(); }

     // ways to parse string to array of ints
     // String s = in.next();
     // int[] array = Arrays.asList(s.split(" ")).stream().mapToInt(Integer::parseInt).toArray();
     // int[] array = Arrays.stream(s.split(" ")).mapToInt(Integer::parseInt).toArray();

     // import java.util.stream.*;
     // conver to Integer not primitve int)
     // Integer[] array1 = Stream.of(s.split(" ")).map(Integer::valueOf).toArray(Integer[]::new);

     //int[] nums = Arrays.stream(in.nextLine().split(" ")).mapToInt(Integer::parseInt).toArray();
     in.close();

     int num_negative_subs = 0;

     for(int i = 0; i < n; i++) {
       for(int j = i; j < n; j++) {
         int subarray_sum = IntStream.of(Arrays.copyOfRange(nums,i,j+1)).sum();
         if(subarray_sum < 0) { num_negative_subs++; }
       }
     }
     System.out.println(num_negative_subs);
   }

   // Dynamic ArrayLists
   public static void main4(String[] args) {
     Scanner in = new Scanner(System.in);
     int num_arrays = in.nextInt();
     List<List<Integer>> arrays = new ArrayList<List<Integer>>(num_arrays);

     for(int i = 0; i < num_arrays; i++) {
       int size = in.nextInt();
       List<Integer> nums = new ArrayList<Integer>();
       for(int j = 0; j < size; j++) {
         nums.add(in.nextInt());
       }
       arrays.add(nums);
     }

     int q = in.nextInt();
     for(int i = 0; i < q; i++) {
       int x = in.nextInt();
       int y = in.nextInt();

       try {
         System.out.println(arrays.get(x-1).get(y-1));
       } catch(IndexOutOfBoundsException e) {
         System.out.println("ERROR!");
       }
     }
   }

  // 1d array game
  // https://www.hackerrank.com/challenges/java-1d-array
  public static void main5(String[] args) {
      Scanner scan = new Scanner(System.in);
      int q = scan.nextInt();
      while (q-- > 0) {
          int n = scan.nextInt();
          int leap = scan.nextInt();

          int[] game = new int[n];
          for (int i = 0; i < n; i++) {
              game[i] = scan.nextInt();
          }
          System.out.println( (canWin(leap, game)) ? "YES" : "NO" );
      }
      scan.close();
  }
  public static boolean canWin(int leap, int[] game) {
        // find all spaces that we can win the game from
        //
        List<Integer> winnable_i = new ArrayList<Integer>();
        // if leap is 0, we only need to check if the last index is 0
        // if leap is great than the size of the list, we need to check all elements
        // if leap is less than the size, check every index greater than length - leap
        //
        int start_chk = leap == 0 ? game.length - 1 : (game.length - leap < 0 ? 0 : game.length - leap);
        for(int i = start_chk; i < game.length; i++) { if(game[i] == 0) { winnable_i.add(i); } }

        // short if there are no winnable spaces, then we can't win :(
        //
        if(winnable_i.size() == 0) { return false; }

        // call recursive function to see if we can actually win
        // from any of the winnable index
        //
        // build a hashmap to memoize when we have already checked an index
        //
        HashMap<Integer,Boolean> memo = new HashMap<Integer, Boolean>();
        for(int i : winnable_i) { if(canWin(i, leap, game, memo)) { return true; } }
        return false;
  }

  public static boolean canWin(int i, int leap, int[] game, HashMap<Integer,Boolean> memo) {
      if (i >= 0) { memo.put(i, true); }
      // if i is negative
      // if the current space is 1
      if (i < 0 || i >= game.length || game[i] == 1) { return false; }
      // if we made it to space 0 or 1
      // or we can leap back to space 0 from here
      // we can win
      //
      if (i == 0) { return true; }

      return (memo.get(i - 1) == null && canWin(i - 1, leap, game, memo)) ||
              (memo.get(i - leap) == null && canWin(i - leap, leap, game, memo)) ||
              (memo.get(i + 1) == null && canWin(i + 1, leap, game, memo));
  }

  // add and remove from a list
  public static void main7(String[] args) {
       Scanner in = new Scanner(System.in);
       int n = in.nextInt();
       List<Integer> array = new ArrayList<Integer>();
       for(int i = 0; i < n; i++) { array.add(in.nextInt()); }
       int q = in.nextInt();

       for(int i = 0; i < q; i++) {
           String command = in.next();
           int x = in.nextInt();
           if(command.equals("Insert")) {
             int y = in.nextInt();
             array.add(x, y);
           } else {
             array.remove(x);
           }
       }

       StringBuilder builder = new StringBuilder();
       for (int value : array) { builder.append(value + " "); }
       String text = builder.toString();
       System.out.println(text);
  }

  //hash map phone book
  public static void main8(String []argh)  {
    Scanner in = new Scanner(System.in);
    int n = in.nextInt();
    in.nextLine();

    HashMap<String,Integer> phone_book = new HashMap<String,Integer>();

    for(int i = 0; i < n; i++) {
        String name = in.nextLine();
        int phone = in.nextInt();
        in.nextLine();
        Integer number = phone_book.get(name);
        if(number == null) { phone_book.put(name, phone); }
    }

    while(in.hasNext()) {
        String s = in.nextLine();
        Integer number = phone_book.get(s);
        String output = number != null ? s + "=" + number : "Not found";
        System.out.println(output);
    }
  }

  // balanced brackets with a Stack
  public static void main9(String []argh) {
     Scanner sc = new Scanner(System.in);

     while (sc.hasNext()) {
        String input = sc.next();
        String result = is_balanced(input) ? "true" : "false";
        System.out.println(result);
     }
  }

  public static Boolean is_balanced(String input) {
    //StackOfCharacters stack = new StackOfCharacters();
    // or do it with the native java stack class
    //
    Stack<Character> stack = new Stack<Character>();
    for(int i = 0; i < input.length(); i++ ) {
      Character bracket = input.charAt(i);
      if(bracket == "{".charAt(0)) { stack.push("}".charAt(0)); }
      else if(bracket == "(".charAt(0)) { stack.push(")".charAt(0)); }
      else if(bracket == "[".charAt(0)) { stack.push("]".charAt(0)); }
      else { if(stack.pop() != bracket) { return false; } }
    }
    return stack.empty();
  }

  public static class StackOfCharacters {
    private ArrayList<Character> items;

    public StackOfCharacters() {
      items = new ArrayList<Character>();
    }

    public void push(Character el) {
      items.add(el);
    }

    public Character pop() {
      if(empty()) { return null; }
      return items.remove(size() - 1);
    }

    public Character tail() {
      if(empty()) { return null; }
      return items.get(size()-1);
    }

    public Boolean empty() {
      return size() == 0;
    }

    private int size() {
      return items.size();
    }
  }

  // Hash set
  // don't concat data to make a key if it might not be uniq!
  public static void main10(String[] args) {
     Scanner s = new Scanner(System.in);
     int t = s.nextInt();
     String [] pair_left = new String[t];
     String [] pair_right = new String[t];

     for (int i = 0; i < t; i++) {
         pair_left[i] = s.next();
         pair_right[i] = s.next();
     }

     HashSet<String> names = new HashSet<String>();
     int count_uniqs = 0;

     for(int i = 0; i < t; i++) {
         String name = pair_left[i] + " " + pair_right[i];
         if(names.add(name)) { ++count_uniqs; } 
         System.out.println(count_uniqs);
     }
  }
  
  // Generic Functions
  public static void main11( String args[] ) {
    Printer myPrinter = new Printer();
    Integer[] intArray = { 1, 2, 3 };
    String[] stringArray = {"Hello", "World"};
    myPrinter.printArray(intArray);
    myPrinter.printArray(stringArray);
    int count = 0;
  
    for (Method method : Printer.class.getDeclaredMethods()) {
        String name = method.getName();
  
        if(name.equals("printArray"))
            count++;
    }
  
    if(count > 1)System.out.println("Method overloading is not allowed!");
  
  }
 
 // custom comparator
  public static void main12(String[] args) {
      Scanner scan = new Scanner(System.in);
      int n = scan.nextInt();

      Player[] player = new Player[n];
      Checker checker = new Checker();
      
      for(int i = 0; i < n; i++){
          player[i] = new Player(scan.next(), scan.nextInt());
      }
      scan.close();

      Arrays.sort(player, checker);
      for(int i = 0; i < player.length; i++){
          System.out.printf("%s %s\n", player[i].name, player[i].score);
      }
  }

  public static void main(String[] args){
      Scanner in = new Scanner(System.in);
      int testCases = Integer.parseInt(in.nextLine());
      
      List<Student> studentList = new ArrayList<Student>();
      while(testCases>0){
         int id = in.nextInt();
         String fname = in.next();
         double cgpa = in.nextDouble();
         
         Student st = new Student(id, fname, cgpa);
         studentList.add(st);
         
         testCases--;
      }
         
      studentList.sort((l,r) -> {
        if(l.getCgpa() > r.getCgpa()) { return -1; }
        else if(l.getCgpa() < r.getCgpa()) { return 1; }
        else {
          int compare_names = l.getFname().compareTo(r.getFname()); 
          if(compare_names == 0) { return l.getId() < l.getId() ? -1 : 1; }
          return compare_names;
        }
      });
   
      for(Student st: studentList){
        System.out.println(st.getFname());
      }
   }  
}

class Player{
    String name;
    int score;
    
    Player(String name, int score){
        this.name = name;
        this.score = score;
    }
}

class Checker implements Comparator<Player> {
  
  public int compare(Player a, Player b) {
    if(a.score > b.score) { return -1; }
    else if(a.score < b.score ) { return 1; }
    return a.name.compareTo(b.name);
  }
  
}

class Printer {
   //Write your code here
   public <T> void printArray(T[] array) {
     for(int i = 0; i < array.length; i++) {
       System.out.println(array[i]);
     }
   }
}

class Student{
   private int id;
   private String fname;
   private double cgpa;
   public Student(int id, String fname, double cgpa) {
      super();
      this.id = id;
      this.fname = fname;
      this.cgpa = cgpa;
   }
   public int getId() {
      return id;
   }
   public String getFname() {
      return fname;
   }
   public double getCgpa() {
      return cgpa;
   }
}
