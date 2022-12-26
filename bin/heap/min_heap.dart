class MinHeap {
  // A list to store the elements of the heap
  List<int> heap;

  // Constructor for the MinHeap class
  MinHeap() : heap = [];

  // Property to get the size of the heap
  int get size => heap.length;

  // Property to check if the heap is empty
  bool get isEmpty => size == 0;

  // Property to get the minimum element in the heap
  int get min {
    if (isEmpty) throw Exception("Heap is empty");
    return heap[0];
  }

  // Method to insert a new element into the heap
  void insert(int value) {
    // Add the element to the end of the list
    heap.add(value);
    // Fix the heap property
    _heapifyUp(heap.length - 1);
  }

  // Method to remove the minimum element from the heap
  int removeMin() {
    if (isEmpty) throw Exception("Heap is empty");
    // Save the minimum element
    int min = heap[0];
    // Replace the root node with the last element in the list
    heap[0] = heap[heap.length - 1];
    // Remove the last element from the list
    heap.removeLast();
    // Fix the heap property
    _heapifyDown(0);
    return min;
  }

  // Helper method to fix the heap property when inserting an element
  void _heapifyUp(int index) {
    // Return if the element is already at the root of the heap
    if (index == 0) return;
    // Calculate the index of the parent node
    int parentIndex = (index - 1) ~/ 2;
    // Swap the element with its parent if the parent is greater
    if (heap[parentIndex] > heap[index]) {
      _swap(parentIndex, index);
      // Recursively fix the heap property
      _heapifyUp(parentIndex);
    }
  }

  // Helper method to fix the heap property when removing the minimum element
  void _heapifyDown(int index) {
// Calculate the indices of the left and right children
    int leftChildIndex = 2 * index + 1;
    int rightChildIndex = 2 * index + 2;
// Set the index of the smallest element to the current index
    int smallestIndex = index;
// Check if the left child exists and is smaller than the current smallest element
    if (leftChildIndex < size && heap[leftChildIndex] < heap[smallestIndex]) {
// Update the index of the smallest element
      smallestIndex = leftChildIndex;
    }
// Check if the right child exists and is smaller than the current smallest element
    if (rightChildIndex < size && heap[rightChildIndex] < heap[smallestIndex]) {
// Update the index of the smallest element
      smallestIndex = rightChildIndex;
    }
// If the smallest element is not the current element, swap them and fix the heap property
    if (smallestIndex != index) {
      _swap(index, smallestIndex);
      _heapifyDown(smallestIndex);
    }
  }

//  // Helper method to swap two elements in the heap
  void _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }
}

void main() {
  // Create a new MinHeap object
  MinHeap heap = MinHeap();

  // Insert some elements into the heap
  heap.insert(5);
  heap.insert(3);
  heap.insert(7);

  // Print the minimum element in the heap
  print(heap.min);

  // Remove the minimum element from the heap
  heap.removeMin();

  // Print the new minimum element in the heap
  print(heap.min);
}
