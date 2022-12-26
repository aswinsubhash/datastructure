class Graph {
  final int numVertices;
 late List<List<int>> adjacencyMatrix;

  Graph(this.numVertices) {
    adjacencyMatrix = List.generate(numVertices, (_) => List.filled(numVertices,0));
  }

  void addEdge(int u, int v) {
    adjacencyMatrix[u][v] = 1;
    adjacencyMatrix[v][u] = 1;
  }

  void removeEdge(int u, int v) {
    adjacencyMatrix[u][v] = 0;
    adjacencyMatrix[v][u] = 0;
  }

  bool isAdjacent(int u, int v) {
    return adjacencyMatrix[u][v] == 1;
  }
}

void main() {
  // Create a graph with 4 vertices
  Graph graph = Graph(4);

  // Add an edge between vertices 0 and 1
  graph.addEdge(0, 1);

  // Check if vertices 0 and 1 are adjacent
  print(graph.isAdjacent(0, 1));  // Output: true

  // Remove the edge between vertices 0 and 1
  graph.removeEdge(0, 1);

  // Check if vertices 0 and 1 are adjacent
  print(graph.isAdjacent(0, 1));  // Output: false
}

