import java.io.*;
import java.util.*;
import java.util.HashMap;
import java.util.stream.*;
import java.text.*;
import java.math.*;

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
  public static void main(String[] args) {
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
    //System.out.println(i);
    if(i >=0) { memo.put(i, true); }
    // if i is negative
    // if the current space is 1
    if(i < 0 || i >= game.length || game[i] == 1) { return false; }
    // if we made it to space 0 or 1
    // or we can leap back to space 0 from here
    // we can win
    //
    if(i == 0) { return true; }
    return (memo.get(i - 1) == null && canWin(i - 1, leap, game, memo)) ||
           (memo.get(i - leap) == null && canWin(i - leap, leap, game, memo)) ||
           (memo.get(i + 1) == null && canWin(i + 1, leap, game, memo));
  }

}