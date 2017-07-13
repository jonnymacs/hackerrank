#include <cstdio>
#include <cstdlib>
#include <iostream>

using namespace std;

class LinkedList {
  //void print(Node);

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

    int compareLists(Node *headA, Node* headB) {
      if(headA == NULL && headB == NULL) { return 1; }
      if((headA == NULL && headB != NULL) ||
         (headB == NULL && headA != NULL)) {
           return 0;
         }

      if(headA->data == headB->data) {
        return compareLists(headA->next, headB->next);
      } else {
        return 0;
      }
    }

    Node* mergeLists(Node *headA, Node* headB) {
      if(headA == NULL && headB == NULL) { return NULL; }
      if(headA != NULL && headB == NULL) { return headA; }
      if(headA == NULL && headB != NULL) { return headB; }

      Node *left = headA;
      Node *right = headB;
      Node *merged = new Node();
      Node *current = merged;

      while(left != NULL && right != NULL) {
        if(left->data < right->data) {
          current->data = left->data;
          left = left->next;
        } else {
          current->data = right->data;
          right = right->next;
        }
        current->next = new Node();
        current = current->next;
      }

      if(left == NULL) {
        current->data = right->data;
        if(right->next != NULL) { current->next = right->next; }
      } else {
        current->data = left->data;
        if(left->next != NULL) { current->next = left->next; }
      }

      return merged;
    }
};

int main () {
  LinkedList ll;
  LinkedList::Node *head = ll.insert_head(NULL, 1);

  LinkedList ll2 = LinkedList();
  LinkedList::Node *head2 = ll2.insert_head(NULL, 2);


  ll.insert_tail(head, 3);
  ll.insert_tail(head, 5);
  ll.insert_tail(head, 6);

  ll.insert_tail(head2, 4);
  ll.insert_tail(head2, 7);

  // ll.print(head);
  // ll2.print(head2);

  LinkedList::Node *merged_head = ll.mergeLists(head, head2);
  ll.print(merged_head);
}
