public class main {   // Save as "Hello.java" under "~/myProject"
   public static void main(String[] args) {
      System.out.println("Hello, world from Mac!");

      LinkedList ll = new LinkedList();
      LinkedList::Node head = LinkedList::Node.new();
      head.data = 5;
      ll.print(head);
   }


  class LinkedList {
    public class Node {
      int data;
      Node next;
    }

    public static void print(Node head) {
      if(head == NULL) { return head; }

      Node current = head;
      while(current != NULL) {
        System.out.println(current.data);
        current = current.next;
      }
    }

  }

}
