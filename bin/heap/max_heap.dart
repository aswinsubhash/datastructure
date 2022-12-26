class MaxHeap {
  final List<int> _heap;

  MaxHeap() : _heap = [];
// getter for the size of the heap
  int get size => _heap.length;
// getter for whether the heap is empty
  bool get isEmpty => size == 0;
// returns the maximum value in the heap (the root node)
  int get max {
    if (isEmpty) throw Exception("Heap is empty");
    return _heap[0];
  }

//inserting to heap
  void insert(int value) {
    // add the value to the end of the heap
    _heap.add(value);
    // restore the heap property by moving the value up the tree
    _heapifyUp(_heap.length - 1);
  }

  // removing the max
  int removeMax() {
    if (isEmpty) throw Exception("Heap is empty");
    // store the maximum value (the root node)
    int max = _heap[0];
    // move the last element in the heap to the root position
    _heap[0] = _heap[_heap.length - 1];
    // remove the last element from the heap
    _heap.removeLast();
    // restore the heap property by moving the element at the root position down the tree
    _heapifyDown(0);
    // return the maximum value
    return max;
  }

  //here were are heapifying up
  void _heapifyUp(int index) {
    // if the element is at the root of the tree, it can't be moved up furtherF
    if (index == 0) {
      return;
    }
    // calculate the index of the parent node
    int parentIndex = (index - 1) ~/ 2;
    // if the value of the parent node is smaller than the value at the current index
    if (_heap[parentIndex] < _heap[index]) {
      // swap the values
      _swap(parentIndex, index);
      // continue moving the element up the tree
      _heapifyUp(parentIndex);
    }
  }

  //here we are heapifying down
  void _heapifyDown(int index) {
    // calculate the index of the left child
    int leftChildIndex = 2 * index + 1;
    // calculate the index of the right child
    int rightChildIndex = 2 * index + 2;
    // assume that the current element has the largest value
    int largestIndex = index;
    // if the left child has a larger value
    if (leftChildIndex < size && _heap[leftChildIndex] > _heap[largestIndex]) {
      // update the index of the largest value
      largestIndex = leftChildIndex;
    }
    // if the right child has a larger value
    if (rightChildIndex < size &&
        _heap[rightChildIndex] > _heap[largestIndex]) {
      // update the index of the largest value
      largestIndex = rightChildIndex;
    }
    // if the largest value is not at the current index
    if (largestIndex != index) {
      //using recursively for swap
      _swap(index, largestIndex); // swap the values
      //using recursiveily for heapifydown
      // continue moving the element down the tree
      _heapifyDown(largestIndex);
    }
  }

  // Helper method to swap two elements in the heap
  void _swap(int i, int j) {
    int temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }
}

void main() {
  // Create a new MaxHeap object
  MaxHeap heap = MaxHeap();

  // Insert some elements into the heap
  heap.insert(5);
  heap.insert(3);
  heap.insert(7);

  // Print the maximum element in the heap
  print(heap.max);

  // Remove the maximum element from the heap
  heap.removeMax();

  // Print the new maximum element in the heap
  print(heap.max);
}
