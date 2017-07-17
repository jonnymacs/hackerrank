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

    public static void print() {
        if(head == null) { return; }
        Node current = head;
        while(current != null) {
            System.out.println(current.data);
            current = current.next;
        }
    }

    public static void main(String[] args) {
        head = new Node(1);
        for(int i = 2; i < 5; i++) {
            Node n_node = new Node(i);
            insert(n_node);
        }
        print();

    }
}