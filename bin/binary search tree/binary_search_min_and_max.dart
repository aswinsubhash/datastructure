// Defines a node in the binary search tree
class Node {
  int data; // stores the value of the node
  Node? left; // reference to the left child node
  Node? right; // reference to the right child node

  Node(this.data); // constructor that initializes the data field
}

// Defines the binary search tree
class BinarySearchTree {
  Node? root; // reference to the root node of the tree

  // Inserts a new node with the given data value into the tree
  void insert(int data) {
    root = _insert(root, data); // call the helper method to insert the new node
  }

  // Helper method for inserting a new node into the tree
  // Uses recursion to traverse the tree and find the correct position for the new node
  Node? _insert(Node? node, int data) {
    if (node == null) {
      // base case: if the current node is null, create a new node
      node = Node(data);
    } else {
      if (data <= node.data) {
        // if the data value is less than or equal to the value of the current node
        node.left =
            _insert(node.left, data); // insert the new node as the left child
      } else {
        // if the data value is greater than the value of the current node
        node.right =
            _insert(node.right, data); // insert the new node as the right child
      }
    }
    return node; // return the node (either the original node or the newly created one)
  }

  // Finds the node with the minimum value in the tree
  int findMin() {
    var node = root; // start at the root node
    while (node?.left != null) {
      // while there is a left child node
      node = node?.left; // move to the left child node
    }
    return node!.data; // return the data value of the leaf node
  }

  // Finds the node with the maximum value in the tree
  int findMax() {
    var node = root; // start at the root node
    while (node?.right != null) {
      // while there is a right child node
      node = node?.right; // move to the right child node
    }
    return node!.data; // return the data value of the leaf node
  }
}

void main() {
  var tree = BinarySearchTree(); // create a binary search tree

  // Insert some values into the tree
  tree.insert(8);
  tree.insert(3);
  tree.insert(10);
  tree.insert(1);
  tree.insert(6);
  tree.insert(14);
  tree.insert(4);
  tree.insert(7);
  tree.insert(13);

  print(tree.findMin()); // print the minimum value in the tree
  print(tree.findMax()); // print the maximum value in the tree
}
