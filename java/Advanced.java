import java.io.*;
import java.util.stream.*;
import java.lang.reflect.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;
import static java.lang.System.*;

public class Advanced {

    public static void main1(String[] args) {
       try {
  			BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
  			int n1=Integer.parseInt(br.readLine());
  			int n2=Integer.parseInt(br.readLine());
  			int n3=Integer.parseInt(br.readLine());
  			int n4=Integer.parseInt(br.readLine());
  			int n5=Integer.parseInt(br.readLine());
  			int n6=Integer.parseInt(br.readLine());
  			Add ob=new Add();
  			ob.add(n1,n2);
  			ob.add(n1,n2,n3);
  			ob.add(n1,n2,n3,n4,n5);
  			ob.add(n1,n2,n3,n4,n5,n6);
  			Method[] methods=Add.class.getDeclaredMethods();
  			Set<String> set=new HashSet<>();
  			boolean overload=false;

			for(int i=0;i<methods.length;i++) {
				if(set.contains(methods[i].getName())) {
					overload=true;
					break;
				}
				set.add(methods[i].getName());
			}

			if(overload) { throw new Exception("Overloading not allowed"); }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			int n1 = Integer.parseInt(br.readLine());
			int n2 = Integer.parseInt(br.readLine());
			int n3 = Integer.parseInt(br.readLine());
			int n4 = Integer.parseInt(br.readLine());
			int n5 = Integer.parseInt(br.readLine());

			Prime ob = new Prime();
			ob.checkPrime(n1);
			ob.checkPrime(n1,n2);
			ob.checkPrime(n1,n2,n3);
			ob.checkPrime(n1,n2,n3,n4,n5);

			Method[] methods=Prime.class.getDeclaredMethods();
			Set<String> set=new HashSet<>();

			boolean overload=false;

			for(int i=0;i<methods.length;i++)  {
				if(set.contains(methods[i].getName()))  {
					overload=true;
					break;
				}
				set.add(methods[i].getName());

			}

			if(overload) {
				throw new Exception("Overloading not allowed");
			}
		}
		catch(Exception e)  {
			System.out.println(e);
		}
	}
}

class Add {
  public static int add(int... args) {
    int sum = 0;
    for(int i : args) {
      sum = sum + i;
    }
    String[] sargs = Arrays.stream(args).mapToObj(String::valueOf).toArray(String[]::new);
    System.out.println(String.join("+", sargs) + "=" + sum);
    return sum;
  }
}

class Prime {
	Set<Integer> primes;

	public Prime(){
		this.primes = new HashSet<Integer>();
	}

	public void checkPrimeWithSet(int... args) {
        for(int arg : args) {
        	if(!primes.contains(arg)) {
				boolean is_prime = true;
        		int check = arg;
				if (check == 0 || check == 1) {
					is_prime = false;
				} else if (check == 2 || check == 5) {
					primes.add(check);
				} else {
					int sqrt_check = (int) Math.sqrt(check);

					for (int i = 2; i <= sqrt_check + 1; i++) {
						if (check % i == 0) { is_prime = false;	}
					}
					if(is_prime) { primes.add(check); }
				}
			}
		}

		printSet(primes);
	}

	public void printSet(Set set) {
		if(set.toArray().length == 0) {
			System.out.println();
			return;
		}
		StringBuilder sb = new StringBuilder(256);
		sb.append(set.toArray()[0]);
		for (int j = 1; j < set.toArray().length; j++) sb.append(" ").append(set.toArray()[j]);
		System.out.println(sb);
	}

	public void checkPrime(int... args) {
		List<Integer> primes = new ArrayList<Integer>();
		for(int arg : args) {
			boolean is_prime = true;
			int check = arg;
			if (check == 0 || check == 1) {
				is_prime = false;
			} else if (check == 2 || check == 5) {
				primes.add(check);
			} else {
				int sqrt_check = (int) Math.sqrt(check);

				for (int i = 2; i <= sqrt_check + 1; i++) {
					if (check % i == 0) { is_prime = false;	}
				}
				if(is_prime) { primes.add(check); }
			}
		}

//		String listString = primes.stream().map(Object::toString).collect(Collectors.joining(" ")).toString();
//		System.out.println(listString);

		printArrayList(primes);
	}

	public void printArrayList(List list) {
		if(list.size() == 0) {
			System.out.println();
			return;
		}
		StringBuilder sb = new StringBuilder(256);
		sb.append(list.get(0));
		for (int j = 1; j < list.size(); j++) sb.append(" ").append(list.get(j));
		System.out.println(sb);
	}
}