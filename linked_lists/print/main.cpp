#include <cstdio>
#include <cstdlib>
#include <iostream>

using namespace std;

class LinkedList {
  public:
    struct Node
    {
      int data;
      struct Node *next;
    };

    void print(Node *head) {
      Node *current = new Node();
      current = head;

      while(current != NULL) {
        cout << current->data << "\n";
        current = current->next;
      }
    }

    Node* insert_tail(Node *head, int data) {
      Node *new_node = new Node();
      new_node->data = data;
      new_node->next = NULL;
      
      if(head == NULL) {
        head = new_node;
      } else {
        Node *current = head;
        while(current->next != NULL) { current = current->next; }
        current->next = new_node;
      }

      return head;
    }
    
    Node* insert_head(Node *head, int data) {
      Node *new_node = new Node();
      new_node->data = data;
      new_node->next = NULL;
      
      if(head == NULL) {
        head = new_node;
      } else {
        Node *current = new_node;
        current->next = head;
        head = current;
      }

      return head;
    }
    
    Node* insert_nth(Node *head, int data, int position) {
      Node *new_node = new Node();
      new_node->data = data;

      if(head == NULL) {
        head = new_node;
      } else if(position == 0) {
        new_node->next = head;
        head = new_node;
      } else {
        Node *current = head;
        for(int i=0; i<position-1; i++) { current = current->next; }
        new_node->next = current->next;
        current->next = new_node;
      }
      return head;
    }
    
    Node* delete_nth(Node *head, int position) {
      if(head == NULL) { return head; }
      Node *current = head;
      if(position == 0) { 
        //delete and return head
        head = current->next;
        current = NULL;
      } else {
        for(int i=0; i<position-1; i++) {
          current = current->next; 
        }
        Node *del_node = current->next;
        current->next = del_node->next;
        del_node = NULL;
      }
      return head;
    }

    void reversePrint(Node *head) {
      Node *current = head;
      if(current == NULL) { return; }
      if(current->next != NULL) {
        reversePrint(current->next);
      }
      cout << current->data << "\n";
    }
    
    Node* reverse(Node *head) {
      if(head == NULL || head->next == NULL) { return head; }

      Node *current = head;
      Node *next = current->next;  
      head->next = NULL;
      
      if(next->next != NULL) {
        head = reverse(next);
      } else {
        head = next;
      }
      next->next = current;
      return head;
    }
};

int main () {
  LinkedList ll = LinkedList();
  //ll.reversePrint(NULL);
  LinkedList::Node *head = ll.insert_head(NULL, 1);
  ll.insert_tail(head, 2);
  ll.insert_tail(head, 3);
  //ll.print(head);
  
  head = ll.insert_head(head, 4);
  //ll.print(head);
  head = ll.insert_nth(head, 5, 1);
  //ll.print(head);
  head = ll.delete_nth(head, 0);
  ll.print(head);
  // ll.reversePrint(head);
  head = ll.reverse(head);
  ll.print(head);
}
