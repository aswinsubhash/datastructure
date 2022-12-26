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
    // If the data is less than the data at the current node, insert the new node into the left subtree
    else if (data < node.data) {
      node.left = _insert(node.left, data);
    }
    // If the data is greater than the data at the current node, insert it into the right subtree
    else {
      node.right = _insert(node.right, data);
    }
    return node;
  }

  // Method to remove a node with the given data from the BST
  void delete(int data) {
    // Call the _delete() method to find the node to be deleted and remove it
    root = _delete(root, data);
  }

  // Recursive helper function to remove a node with the given data from the BST
  Node? _delete(Node? node, int data) {
    // If the tree is empty, return null
    if (node == null) {
      return null;
    }
    // If the data is less than the data at the current node, recursively call _delete() on the left subtree
    else if (data < node.data) {
      node.left = _delete(node.left, data);
    }
    // If the data is greater than the data at the current node, recursively call _delete() on the right subtree
    else if (data > node.data) {
      node.right = _delete(node.right, data);
    }
    // If the data is equal to the data at the current node, handle the deletion as follows:
    else {
      // If the node has no children (i.e., both left and right are null), return null
      if (node.left == null && node.right == null) {
        return null;
      }
      // If the node has only a left child, return the left child
      else if (node.left == null) {
        return node.right;
      }
      // If the node has only a right child, return the right child
      else if (node.right == null) {
        return node.left;
      }
      // If the node has both left and right children:
      // 1. Find the minimum value
      else {
        var min = _findMin(node.right!);
        node.data = min!.data;
        node.right = _delete(node.right, min.data);
      }
    }
    return node;
  }

  Node? _findMin(Node? node) {
    while (node?.left != null) {
      node = node?.left;
    }
    return node;
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

  tree.delete(8);
  tree.delete(3);
  tree.delete(10);
  tree.delete(1);
  tree.delete(6);
  tree.delete(14);
  tree.delete(4);
  tree.delete(7);
  tree.delete(13);
}
