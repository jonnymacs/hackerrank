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

    void print(Node *head)
    {
      // This is a "method-only" submission.
      // You only need to complete this method.
      Node *current = head;
      //cout << head->data << "data\n";
      while(current != NULL) {
          cout << current->data << "\n";
          current = current->next;
      }
    }

    Node* insert(Node *head, int data)
    {
      if(head != NULL) {  cout << head->data << "foo"; }

      Node new_node = Node();
      new_node.data = data;



      if(head == NULL) {
        head = &new_node;
        //cout << head->data << "headdata\n";

      } else {
        //cout << head->data << "123headdata\n";

        Node *current = head;

        cout << head->data << "bar";

        while(current->next != NULL) {
          cout << current->data << "here\n";
          current = current->next;
        }
        //cout << current->data << "nextdata\n";
        current->next = &new_node;
        // cout << head->data << "headdata\n";
        // cout << head->next->data << "nextdata\n";
        // cout << current->next->data << "nextdatanext\n";

      }

      return head;
    }
};

int main () {
  LinkedList ll = LinkedList();
  LinkedList::Node *head = ll.insert(NULL, 1);

  cout << head->data << "headdata\n";


  ll.insert(head, 2);

  cout << head->data << "headdata\n";

  ll.insert(head, 3);
  ll.print(head);
}
