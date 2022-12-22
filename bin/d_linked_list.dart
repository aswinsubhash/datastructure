class Node {
  int data;
  Node? prev;
  Node? next;
  Node(this.data);
}

class DoublyLinkedList {
  Node? head;
  Node? tail;

  void addNode(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      tail?.next = newNode;
      newNode.prev = tail;
    }
    tail = newNode;
  }

  void display() {
    if (head == null) {
      print('empty');
    } else {
      Node? temp = head;
      while (temp != null) {
        print(temp.data);
        temp = temp.next;
      }
    }
  }

  void displayReverse() {
    Node? temp = tail;
    while (temp != null) {
      print(temp.data);
      temp = temp.prev;
    }
  }

  void removeDuplicates() {
    Node? temp = head;

    while (temp?.next != null) {
      if (temp?.next?.data == temp?.data) {
        temp?.next = temp.next?.next;
      } else {
        temp = temp?.next;
      }
    }
  }

  //nexto insert
  void insertAfter(int nextTo, int data) {
    Node newNode = Node(data);
    Node? temp = head;

    while (temp != null && temp.data != nextTo) {
      temp = temp.next;
    }
    if (temp == tail) {
      tail?.next = newNode;
      tail?.prev = temp;
      tail = newNode;
      return;
    }

    newNode.next = temp?.next;
    newNode.prev = temp;
    temp?.next = newNode;
  }

  // end insert
  void insertEnd(int data) {
    Node newNode = Node(data);
    if (tail != null) {
      tail?.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

// insert begin
  void insertBegin(int data) {
    Node newNode = Node(data);
    Node? temp = head;

    if (head != null) {
      head = newNode;
      head?.prev = null;
      head?.next = temp;
      head?.next?.prev = newNode;
      newNode.next = head?.next;
    }
  }
  //end delete
  void deleteEnd() {
    if(head!= null){
      Node? temp = head;
      while (temp?.next != tail) {
        temp = temp?.next;
      }
      tail = temp;
      tail?.prev = temp;
      tail?.next = null;
    }
  }
  // delete begin
  void deleteBeg(){
    if(head!=null){
      head = head?.next;
      head?.prev = null;
    }
  }
}

void main() {
  DoublyLinkedList dl = DoublyLinkedList();
  print('values');
 dl.addNode(10);
 dl.addNode(20);
dl.insertAfter(10, 111);

 dl.display();
}
