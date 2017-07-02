#include <map>
#include <cstdio>
#include <cstdlib>
#include <iostream>

using namespace std;

// Class def for Trie
//
// Constructor builds a root
// node with the @ character.
// Ideally we construct without
// a letter...
//
class Trie {

  private:
    // Class def for Node in the Trie
    //
    // Constructor builds a Node with
    // the supplied letter and
    // initializes a counter.
    // num_partial_for holds the value
    // for how many words the node
    // is a substring for
    //
    class Node {
      public:
        char letter;
        map<char, Node> children;
        int num_partial_for;
        bool makes_word;
        string word;

        Node(char l) {
          letter = l;
          num_partial_for = 0;
        }
    };

    Node root;

  public:
    Trie() : root('@') { }

    // Public add_contact method
    // takes a string and adds it
    // to the trie
    //
    void add_contact(string input) {
      Node * parent = &root;

      for(int i = 0; i < input.length(); i++) {
        if(parent->children.count(input[i]) == 0) {
          Node child = Node(input[i]);
          parent->children.insert(pair<char, Node>(input[i], child));
        }
        parent = &(parent->children.find(input[i])->second);
        parent->num_partial_for++;
      }
      parent->makes_word = true;
    }

    // Public find_num_contacts method
    // takes a string and returns an int
    // for how many words the string is a
    // substring for in the trie
    //
    int find_num_contacts(string input) {
      Node * parent = &root;

      for(int i = 0; i < input.length(); i++) {
        if(parent->children.count(input[i]) == 0) { return 0; }
        parent = &(parent->children.find(input[i])->second);
      }
      return parent->num_partial_for;
    }
};

// read stdin
// either add contact
// or print how many contacts
// the string input is a
// substring for
// ex in:
// 4 - number of entries
// add hack
// add hackerrank
// find hac
// find hak
//
int main(){
    int n;
    cin >> n;
    Trie trie = Trie();
    for(int a0 = 0; a0 < n; a0++){
        string op;
        string contact;
        cin >> op >> contact;
        if(op == "add") { trie.add_contact(contact); }
        else { cout << trie.find_num_contacts(contact) << "\n"; }
    }
    return 0;
}
