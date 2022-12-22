class Node {
  int data;
  Node? next;
  Node(this.data);
}

class SinglyLinkedList {
  Node? head;
  Node? tail;
  void addNode(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      tail?.next = newNode;
      newNode.next = null;
    }
    tail = newNode;
  }

  void display() {
    if (head == null) {
      print("Empty");
      return;
    }
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void delete(int data) {
    Node? temp = head;
    Node? prev;

    //delete from the beginning
    if (temp != null && temp.data == data) {
      head = temp.next;
      return;
    }

    //search and delete
    while (temp != null && temp.data != data) {
      prev = temp;
      temp = temp.next;
    }
    prev?.next = temp?.next;

    //delete from the end
    if (temp == tail) {
      tail = prev;
      tail?.next = null;
      return;
    }

    //if value not found
    if (temp == null) {
      print('no such value found to delete');
    }
  }

  //added nextto
  void insertAfter(int nextTo, int data) {
    Node newNode = Node(data);
    Node? temp = head;

    while (temp != null && temp.data != nextTo) {
      temp = temp.next;
    }
    if (temp == tail) {
      tail?.next = newNode;
      tail = newNode;
      return;
    }

    newNode.next = temp?.next;
    temp?.next = newNode;
  }

  //begining insert
  void insertBegin(int data) {
    Node newNode = Node(data);
    Node? temp = head;

    if (head == null) {
      head = newNode;
      tail == newNode;
    } else {
      head = newNode;
      head?.next = temp;
    }
  }

  //end insert
  void insertEnd(int data) {
    Node newNode = Node(data);
    if (tail != null) {
      tail?.next = newNode;
      tail = newNode;
    }
  }

  //end delete
  void deleteEnd() {
    if (head != tail) {
      Node? temp = head;
      while (temp?.next != tail) {
        temp = temp?.next;
      }
      tail = temp;
      tail?.next = null;
    }
  }

  void deleteBeg() {
    if (head != null) {
      head?.next = head;
    }
  }

//remove duplicate
  void removeDuplicates() {
    Node? temp = head;

    while (temp?.next != null) {
      if (temp?.next?.data != temp?.data) {
        temp = temp?.next;
      }
      temp?.next = temp.next?.next;
    }
  }

  //reverse
  void reverse() {
    Node? pre;
    Node? curr = head;

    while (curr != null) {
      Node? cnex = curr.next;
      curr.next = pre;
      pre = curr;
      curr = cnex;
    }
    head = pre;
  }
}

void main() {
  SinglyLinkedList sl = SinglyLinkedList();
  print('values');
  sl.addNode(10);
  sl.addNode(20);
  sl.addNode(30);
  sl.addNode(40);
  sl.insertAfter(30, 111);
  sl.display();
}
