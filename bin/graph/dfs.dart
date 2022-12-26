// ignore_for_file: prefer_for_elements_to_map_fromiterable

import 'dart:collection';

class Graph {
  // Adjacency list representation of the graph
  final Map<int, List<int>> adjList;

  Graph(int vertices) : adjList = Map.fromIterable(
        Iterable.generate(vertices),
        key: (v) => v,
        value: (_) => [],
      );

  void addEdge(int source, int destination) {
    adjList[source]!.add(destination);
    adjList[destination]!.add(source);
  }

  void bfs(int start) {
    // Set of visited vertices
    final visited = <int>{};

    // Queue to keep track of the vertices being processed
    final queue = Queue<int>();
    queue.add(start);

    while (queue.isNotEmpty) {
      final vertex = queue.removeFirst();
      if (!visited.contains(vertex)) {
        visited.add(vertex);
        print(vertex);
      }

      for (final neighbor in adjList[vertex]!) {
        if (!visited.contains(neighbor)) {
          queue.add(neighbor);
        }
      }
    }
  }
}

void main() {
  final graph = Graph(5);
  graph.addEdge(0, 1);
  graph.addEdge(0, 4);
  graph.addEdge(1, 2);
  graph.addEdge(1, 3);
  graph.addEdge(1, 4);
  graph.addEdge(2, 3);
  graph.addEdge(3, 4);
  graph.bfs(0);
}
