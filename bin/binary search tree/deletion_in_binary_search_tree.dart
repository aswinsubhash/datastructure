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

  void delete(int data) {
    root = _delete(root, data);
  }

  Node? _delete(Node? node, int data) {
    if (node == null) {
      return null;
    } else if (data < node.data) {
      node.left = _delete(node.left, data);
    } else if (data > node.data) {
      node.right = _delete(node.right, data);
    } else {
      if (node.left == null && node.right == null) {
        return null;
      } else if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      } else {
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
