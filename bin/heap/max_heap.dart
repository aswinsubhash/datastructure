class MaxHeap {
 final List<int> _heap;

  MaxHeap() : _heap = [];

  int get size => _heap.length;

  bool get isEmpty => size == 0;

  int get max {
    if (isEmpty) throw Exception("Heap is empty");
    return _heap[0];
  }
//inserting to heap
  void insert(int value) {
    _heap.add(value);
    _heapifyUp(_heap.length - 1);
  }

  // removing the max
  int removeMax() {
    if (isEmpty) throw Exception("Heap is empty");
    int max = _heap[0];
    _heap[0] = _heap[_heap.length - 1];
    _heap.removeLast();
    _heapifyDown(0);
    return max;
  }

  //here were are heapifying up
  void _heapifyUp(int index) {
    if (index == 0) return;
    int parentIndex = (index - 1) ~/ 2;
    if (_heap[parentIndex] < _heap[index]) {
      _swap(parentIndex, index);
      _heapifyUp(parentIndex);
    }
  }

  //here we are heapifying down
  void _heapifyDown(int index) {
    int leftChildIndex = 2 * index + 1;
    int rightChildIndex = 2 * index + 2;
    int largestIndex = index;
    if (leftChildIndex < size && _heap[leftChildIndex] > _heap[largestIndex]) {
      largestIndex = leftChildIndex;
    }
    if (rightChildIndex < size &&
        _heap[rightChildIndex] > _heap[largestIndex]) {
      largestIndex = rightChildIndex;
    }
    if (largestIndex != index) {
      //using recursively for swap
      _swap(index, largestIndex);
      //using recursiveily for heapifydown
      _heapifyDown(largestIndex);
    }
  }

  void _swap(int i, int j) {
    int temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }
}

void main() {
  MaxHeap heap = MaxHeap();
  heap.insert(5);
  heap.insert(3);
  heap.insert(7);
  print(heap.max);
  heap.removeMax();
  print(heap.max);
}
