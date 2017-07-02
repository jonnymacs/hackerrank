#include <map>
#include <cstdio>
#include <cstdlib>
#include <iostream>

using namespace std;

class Trie {

  private:
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

    void add_contact(string input) {
      Node * parent = &root;

      for(int i = 0; i < input.length(); i++) {
        // for(map<char, Node >::const_iterator it = root.children.begin(); it != root.children.end(); ++it) {
        //     cout << it->first << " " << it->second.letter << "\n";
        // }
        if(parent->children.count(input[i]) == 0) {
          Node child = Node(input[i]);
          parent->children.insert(pair<char, Node>(input[i], child));
        }
        parent = &(parent->children.find(input[i])->second);
        parent->num_partial_for++;
      }
      parent->makes_word = true;
    }

    int find_num_contacts(string input) {
      Node * parent = &root;

      for(int i = 0; i < input.length(); i++) {
        if(parent->children.count(input[i]) == 0) { return 0; }
        parent = &(parent->children.find(input[i])->second);
      }
      return parent->num_partial_for;
    }
};

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
