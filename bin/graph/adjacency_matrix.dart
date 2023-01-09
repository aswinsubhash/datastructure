class Graph {
  final int numVertices;
  // adjacencyMatrix is a 2D list that stores the edges in the graph
  // It is initialized with a matrix of size numVertices x numVertices filled with zeros
  late List<List<int>> adjacencyMatrix;

  // Constructor that takes the number of vertices in the graph as a parameter
  Graph(this.numVertices) {
    adjacencyMatrix =
        List.generate(numVertices, (_) => List.filled(numVertices, numVertices));
  }

  // Method that adds an edge between two vertices u and v
  void addEdge(int u, int v) {
    // Set the corresponding entries in the adjacency matrix to 1 to indicate an edge between u and v
    adjacencyMatrix[u][v] = 1;
    adjacencyMatrix[v][u] = 1;
  }

  // Method that removes the edge between two vertices u and v
  void removeEdge(int u, int v) {
    // Set the corresponding entries in the adjacency matrix to 0 to remove the edge between u and v
    adjacencyMatrix[u][v] = 0;
    adjacencyMatrix[v][u] = 0;
  }

  // Method that returns true if two vertices u and v are adjacent, false otherwise
  bool isAdjacent(int u, int v) {
    // Check if the corresponding entry in the adjacency matrix is 1
    return adjacencyMatrix[u][v] == 1;
  }
}

void main() {
  // Create a graph with 4 vertices
  Graph graph = Graph(4);

  // Add an edge between vertices 0 and 1
  graph.addEdge(0, 1);

  // Check if vertices 0 and 1 are adjacent
  print(graph.isAdjacent(0, 1));
  // Output: true

  // Remove the edge between vertices 0 and 1
  graph.removeEdge(0, 1);

  // Check if vertices 0 and 1 are adjacent
  print(graph.isAdjacent(0, 1));
  // Output: false
}
