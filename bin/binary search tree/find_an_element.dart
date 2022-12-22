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
    } else {
      if (data <= node.data) {
        node.left = _insert(node.left, data);
      } else {
        node.right = _insert(node.right, data);
      }
    }
    return node;
  }

  bool find(int data) {
    return _find(root, data);
  }

  bool _find(Node? node, int data) {
    if (node == null) {
      return false;
    } else {
      if (data == node.data) {
        return true;
      } else if (data < node.data) {
        return _find(node.left, data);
      } else {
        return _find(node.right, data);
      }
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