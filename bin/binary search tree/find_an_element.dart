class Node {
  // Field to store the data at the node
  int data;

  // Fields to store references to the left and right child nodes of the node
  Node? left;
  Node? right;

  // Constructor to create a new Node with the given data
  Node(this.data);
}

class BinarySearchTree {
  // Field to store a reference to the root node of the tree
  Node? root;

  // Method to insert a new node with the given data into the BST
  void insert(int data) {
    // Call the _insert() method to find the appropriate place to insert the new node
    root = _insert(root, data);
  }

  // Recursive helper function to insert a new node with the given data into the BST
  Node? _insert(Node? node, int data) {
    // If the tree is empty, create a new node and return it
    if (node == null) {
      node = Node(data);
    }
    // If the data is less than or equal to the data at the current node, insert the new node into the left subtree
    else if (data <= node.data) {
      node.left = _insert(node.left, data);
    }
    // If the data is greater than the data at the current node, insert it into the right subtree
    else {
      node.right = _insert(node.right, data);
    }
    return node;
  }

  // Method to search the BST for a node with the given data
  bool find(int data) {
    // Call the _find() method to search for the data in the BST
    return _find(root, data);
  }

  // Recursive helper function to search the BST for a node with the given data
  bool _find(Node? node, int data) {
    // If the tree is empty, return false
    if (node == null) {
      return false;
    }
    // If the data is equal to the data at the current node, return true
    else if (data == node.data) {
      return true;
    }
    // If the data is less than the data at the current node, recursively call _find() on the left subtree
    else if (data < node.data) {
      return _find(node.left, data);
    }
    // If the data is greater than the data at the current node, recursively call _find() on the right subtree
    else {
      return _find(node.right, data);
    }
  }
}

void main() {
  var tree = BinarySearchTree();

  tree.insert(8);
  tree.insert(3);
  tree.insert(10);
  tree.insert(1);
  tree.insert(6);
  tree.insert(14);
  tree.insert(4);
  tree.insert(7);
  tree.insert(13);

  print(tree.find(13));
}
