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
    // Otherwise, insert it into the right subtree
    else {
      node.right = _insert(node.right, data);
    }
    return node;
  }

  // Method to print the data at each node in the BST, in an in-order traversal
  void printData() {
    // Call the _printData() method to perform the traversal and print the data at each node
    _printData(root);
  }

  // Recursive helper function to perform an in-order traversal of the tree and print the data at each node
  void _printData(Node? node) {
    // Base case: if the current node is null, return
    if (node != null) {
      // Print the data at the current node
      print(node.data);
      // Recursively call _printData() on the left subtree
      _printData(node.left);
      // Recursively call _printData() on the right subtree
      _printData(node.right);
    }
  }
}

void main() {
  // Create a new BinarySearchTree object
  var bst = BinarySearchTree();

  // Insert some data into the tree
  bst.insert(5);
  bst.insert(3);
  bst.insert(7);
  bst.insert(2);
  bst.insert(4);
  bst.insert(6);
  bst.insert(8);

  // Print the data in the tree, in an in-order traversal
  bst.printData();
}
