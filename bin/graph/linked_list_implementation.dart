// Define an interface for a graph node
abstract class Node {
  // Return the value of the node
  dynamic get value;

  // Return a list of the node's neighbors
  List<Node> get neighbors;
}

// Define a class for a graph node that uses a linked list to store its neighbors
class LinkedListNode implements Node {
  LinkedListNode(this._value);

  final dynamic _value;
  final List<Node> _neighbors = [];

  @override
  dynamic get value => _value;

  @override
  List<Node> get neighbors => _neighbors;
}

// Define a class for a graph
class Graph {
  // Add a node to the graph
  void addNode(Node node) {
    _nodes.add(node);
  }

  // Add an edge between two nodes in the graph
  void addEdge(Node node1, Node node2) {
    node1.neighbors.add(node2);
    node2.neighbors.add(node1);
  }

  final List<Node> _nodes = [];
}

void main() {
  // Create some nodes
  final node1 = LinkedListNode(1);
  final node2 = LinkedListNode(2);
  final node3 = LinkedListNode(3);

  // Create a graph and add the nodes
  final graph = Graph();
  graph.addNode(node1);
  graph.addNode(node2);
  graph.addNode(node3);

  // Add some edges between the nodes
  graph.addEdge(node1, node2);
  graph.addEdge(node2, node3);

  // Iterate over the neighbors of node 1
  for (final neighbor in node1.neighbors) {
    print(neighbor.value);
  }
}
