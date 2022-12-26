// ignore_for_file: curly_braces_in_flow_control_structures

class BuildHeap {
  // Method to heapify a subtree rooted at node i which is
  // an index in arr[]. n is size of heap
  void heapify(List<int> arr, int n, int i) {
    // Initialize largest as root
    int largest = i;

    // Index of left child
    int l = 2 * i + 1;

    // Index of right child
    int r = 2 * i + 2;

    // If left child is larger than root
    if (l < n && arr[l] > arr[largest]) largest = l;

    // If right child is larger than largest so far
    if (r < n && arr[r] > arr[largest]) largest = r;

    // If largest is not root
    if (largest != i) {
      // Swap arr[i] with arr[largest]
      int swap = arr[i];
      arr[i] = arr[largest];
      arr[largest] = swap;

      // Recursively heapify the affected sub-tree
      heapify(arr, n, largest);
    }
  }

  // Method to build a Max-Heap from the Array
  void buildHeap(List<int> arr, int n) {
    // Find the last non-leaf node
    int startIdx = (n ~/ 2) - 1;

    // Perform reverse level order traversal
    // from last non-leaf node and heapify
    // each node
    for (int i = startIdx; i >= 0; i--) {
      heapify(arr, n, i);
    }
  }

  // Method to print the array representation of the heap
  void printHeap(List<int> arr, int n) {
    print("Array representation of Heap is");

    // Print the array
    print(arr);
  }
}

void main() {
  // Create an array of integers
  List<int> arr = [1, 3, 5, 4, 6, 13, 10, 9, 8, 15, 17];

  // Get the size of the array
  int n = arr.length;

  // Create an instance of the BuildHeap class
  BuildHeap buildHeap = BuildHeap();

  // Build a max heap from the array
  buildHeap.buildHeap(arr, n);

  // Print the array representation of the heap
  buildHeap.printHeap(arr, n);
}
