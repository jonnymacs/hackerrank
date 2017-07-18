import java.util.HashMap;

public class LinkedList {

    public static Node head;

    public static class Node {
        int data;
        Node next;
        Node arb;

        Node(int value) {
            data = value;
        }
    }

    public static Node insert(Node n_node) {
        Node current = head;

        if(head == null) {
            head = n_node;
        } else {
            while(current.next != null) {
                current = current.next;
            }
        }
        current.next = n_node;
        return head;
    }

    public static Node get_nth(int n) {
      if(head == null) { return null; }
      int counter = 1;
      Node current = head;
      while(current.next != null && counter < n) {
        current = current.next;
        counter++;
      }
      return current;
    }

    public static void print() {
        if(head == null) { return; }
        Node current = head;
        while(current != null) {
            System.out.println(current.data);
            current = current.next;
        }
    }

    public static void print_from(Node node) {
        if(node == null) { return; }
        Node current = node;
        while(current != null) {
            System.out.println(current.data);
            current = current.next;
        }
    }
    
    public static Node deepCopy() {
      if(head == null) { return null; }
      HashMap<Node,Node> node_map = new HashMap<Node,Node>();
      
      Node copy_head = new Node(head.data);
      //Node copy_head_arb = new Node(head.arb.data)
      
      Node current = head;
      Node current_copy = copy_head;
      
      node_map.put(head, copy_head);

      while(current.next != null) {
        Node copy_next = node_map.get(current.next);
        if(copy_next == null) {
          copy_next = new Node(current.next.data);
          node_map.put(current.next, copy_next);
        }
        current_copy.next = copy_next;
        
        Node copy_arb = node_map.get(current.arb);
        if(copy_arb == null && current.arb != null) {
          copy_arb = new Node(current.arb.data);
          node_map.put(current.arb, copy_arb);
        }
        current_copy.arb = copy_arb;
        
        current = current.next;
        current_copy = current_copy.next;
      }
      return copy_head;
    }
    
    public static void main(String[] args) {
        head = new Node(1);
        for(int i = 2; i < 5; i++) {
            Node n_node = new Node(i);
            insert(n_node);
        }
        
        // for(int i = 1; i < 5; i++) {
        //     if(i == 1) { head.arb = }
        // }
        
        print();
        Node one = get_nth(1);
        Node two = get_nth(2);
        Node three = get_nth(3);
        Node four = get_nth(4);
        
        one.arb = two;
        two.arb = four;
        
        Node copy = deepCopy();
        //System.out.println(get_nth(2).data);
        print_from(copy);

    }
}