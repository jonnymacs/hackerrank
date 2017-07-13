#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <set>

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
      Node *current = head;

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
    
    Node* mergeLists(Node *headA, Node*headB) {
      if(headA == NULL && headB == NULL) { return NULL; }
      if(headA != NULL && headB == NULL) { return headA; }
      if(headA == NULL && headB != NULL) { return headB; }
      
      Node *A = headA;
      Node *B = headB;
      Node *head = A;
      
      // ensure A is the merge target
      //
      if(A->data > B->data) {
        Node *temp = A;
        A = B;
        B = temp;
        head = A;
      }
      
      while(A->next != NULL && B != NULL) {
        if(A->next->data < B->data) {
          A = A->next;
        } else {
          Node *tempnext = B->next;
          B->next = A->next;
          A->next = B;
          A = A->next;
          B = tempnext;
        }
      }
      
      if(A->next == NULL) {
        A->next = B;
      }
    
      return head;
      
    }
    
    int getNodeFromTail(Node *head,int positionFromTail) {
      Node *current = head;
      Node *result = head;
      
      int counter = 0;
      while(current->next != NULL) {
        current = current->next;
        if(counter >= positionFromTail) { result = result->next; }
        else { counter++; } 
      }
            
      return result->data;
    }
    
    Node* removeDuplicates(Node *head) {
      if(head == NULL || head->next == NULL) { return head; }
      
      Node *current = head;
      
      while(current != NULL && current->next != NULL) {
        while(current->next != NULL && current->data == current->next->data) {
          current->next = current->next->next;
        }
        current = current->next;
      }
      return head;
    }
    
    bool has_cycle(Node* head) {
      if(head == NULL) { return head; }
      
      set<Node*> visited;
      Node *current = head;
      
      while(current->next != NULL) {
        if(visited.insert(current).second) {
          current = current->next;
        } else {
          return true;
        }
      }
      return false;
    }
    
    int findMergeNode(Node *headA, Node *headB) {
      set<Node*> visited;
      Node *currentA = headA;
      Node *currentB = headB;
      
      while(currentA != NULL || currentB != NULL) {
        if(currentA != NULL) {
          if(visited.insert(currentA).second) {
            currentA = currentA->next;
          } else {
            return currentA->data;
          }
        }
        if(currentB != NULL) {
          if(visited.insert(currentB).second) {
            currentB = currentB->next;
          } else {
            return currentB->data;
          }
        }
      }
      return 0;
    }

};

class DoubleLinkedList {
  public:
    struct Node {
        int data;
        struct Node *prev;
        struct Node *next;
    };
    
    void print(Node *head) {
      Node *current = head;

      while(current != NULL) {
        cout << current->data << "\n";
        current = current->next;
      }
    }
    
    Node* sortedInsert(Node *head,int data) {
      Node *new_node = new Node();
      new_node->data = data;
    
      if(head == NULL) { return new_node; }

      Node *current = head;
      while(current != NULL) {
        if(current->data <= new_node->data) {
          if(current->next == NULL){
            new_node->prev = current;
            current->next = new_node;
            return head;
          }
          current = current->next;
        } else {
          if(current->prev != NULL) { current->prev->next = new_node; }
          new_node->prev = current->prev;
          new_node->next = current;
          current->prev = new_node;
          if(current == head) {
            return new_node;
          } else {
            return head;
          }
        }  
      }
    
      return head;
    }
    
    Node* reverse(Node *head) {
      if(head == NULL || head->next == NULL) { return head; }
      
      Node *current = head;
      Node *next = current->next;
      head->next = NULL;
      
      if(next != NULL) {
        head = reverse(next);
      } else {
        head = next;
      }
      
      next->prev = next->next;
      next->next = current;
      
      current->next = current->prev;
      current->prev = next;
      
      head->prev = NULL;
      
      return head;
    }

};

int main () {
  // LinkedList ll = LinkedList();
  // ll.reversePrint(NULL);
  // LinkedList::Node *head = ll.insert_head(NULL, 1);
  // LinkedList::Node *head2 = ll.insert_head(NULL, 2);
  // 
  // head = ll.insert_tail(head, 2);
  // head = ll.insert_tail(head, 3);
  // //ll.print(head);
  // head2 = ll.insert_tail(head2, 3);
  // head2 = ll.insert_tail(head2, 5);  
  
  //ll.insert_tail(ll.getNodeFromTail)
  
  //ll.print(head);
  //ll.print(head2);
  // LinkedList::Node *merged = ll.mergeLists(head2,head);
  // 
  // ll.getNodeFromTail(merged, 6);
  // 
  // ll.print(merged);
  // cout << "\n\n";
  // merged = ll.removeDuplicates(merged);
  // ll.print(merged);
  // 
  
  
  //cout << ll.has_cycle(head3) << "\n";
  
  DoubleLinkedList dll = DoubleLinkedList();
  DoubleLinkedList::Node *head = dll.sortedInsert(NULL, 2);  
  head = dll.sortedInsert(head, 1);
  head = dll.sortedInsert(head, 4);
  head = dll.sortedInsert(head, 3);
  
  dll.print(head);
  DoubleLinkedList::Node *reversed = dll.reverse(head);
  dll.print(reversed);
  
}
