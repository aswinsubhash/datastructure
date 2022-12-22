class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BinarySearchTree {
  Node? root;

  void insert(int data) {
    root = _insert(root, data);
  }

  Node? _insert(Node? node, int data) {
    if (node == null) {
      node = Node(data);
    } else if (data <= node.data) {
      node.left = _insert(node.left, data);
    } else {
      node.right = _insert(node.right, data);
    }
    return node;
  }

  void printData() {
    _printData(root);
  }

  void _printData(Node? node) {
    if (node != null) {
      print(node.data);
      _printData(node.left);
      _printData(node.right);
    }
  }
}

void main() {
  var bst = BinarySearchTree();

  bst.insert(5);
  bst.insert(3);
  bst.insert(7);
  bst.insert(2);
  bst.insert(4);
  bst.insert(6);
  bst.insert(8);

  bst.printData();
}
