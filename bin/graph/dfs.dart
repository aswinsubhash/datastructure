class Graph {
  // Adjacency list representation of the graph
  final List<List<int>> adjList;

  Graph(int vertices) : adjList = List.generate(vertices, (_) => []);

  void addEdge(int source, int destination) {
    // Add the edge to the adjacency list of both the source and destination vertices
    adjList[source].add(destination);
    adjList[destination].add(source);
  }

  void dfs(int start) {
    // Set of visited vertices
    final visited = <int>{};

    // Stack to keep track of the vertices being processed
    final stack = <int>[];
    stack.add(start);

    // While there are vertices in the stack
    while (stack.isNotEmpty) {
      // Pop the top vertex from the stack
      final vertex = stack.removeLast();

      // If the vertex has not been visited yet
      if (!visited.contains(vertex)) {
        // Mark it as visited
        visited.add(vertex);

        // Printing
        print(vertex);
      }

      // For each neighbor of the vertex
      for (final neighbor in adjList[vertex]) {
        // If the neighbor has not been visited yet
        if (!visited.contains(neighbor)) {
          // Push it to the stack
          stack.add(neighbor);
        }
      }
    }
  }
}

void main() {
  // Create a graph with 5 vertices
  final graph = Graph(5);

  // Add edges between the vertices
  graph.addEdge(0, 1);
  graph.addEdge(0, 4);
  graph.addEdge(1, 2);
  graph.addEdge(1, 3);
  graph.addEdge(1, 4);
  graph.addEdge(2, 3);
  graph.addEdge(3, 4);

  // Perform a DFS starting from vertex 0
  graph.dfs(0);
}
