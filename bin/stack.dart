class Node {
  int data;
  Node? next;
  Node(this.data);
}

class Stack {
  Node? top;

  void push(int data) {
    Node newNode = Node(data);
    if (top == null) {
      top = newNode;
    } else {
      newNode.next = top;
      top = newNode;
    }
  }

  void pop() {
    if (top == null) {
      print("Stack under flow");
    } else {
      top = top?.next;
    }
  }

  void display() {
    Node? currentNode = top;
    while (currentNode != null) {
      print(currentNode.data);
      currentNode = currentNode.next;
    }
  }
}

void main() {
  Stack stack = Stack();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  stack.pop();
  stack.display();
}
