class MinHeap {
  List<int> _heap;

  MinHeap() : _heap = [];

  int get size => _heap.length;

  bool get isEmpty => size == 0;

  int get min {
    if (isEmpty) throw Exception("Heap is empty");
    return _heap[0];
  }

  void insert(int value) {
    _heap.add(value);
    _heapifyUp(_heap.length - 1);
  }

  int removeMin() {
    if (isEmpty) throw Exception("Heap is empty");
    int min = _heap[0];
    _heap[0] = _heap[_heap.length - 1];
    _heap.removeLast();
    _heapifyDown(0);
    return min;
  }

  void _heapifyUp(int index) {
    if (index == 0) return;
    int parentIndex = (index - 1) ~/ 2;
    if (_heap[parentIndex] > _heap[index]) {
      _swap(parentIndex, index);
      _heapifyUp(parentIndex);
    }
  }

  void _heapifyDown(int index) {
    int leftChildIndex = 2 * index + 1;
    int rightChildIndex = 2 * index + 2;
    int smallestIndex = index;
    if (leftChildIndex < size && _heap[leftChildIndex] < _heap[smallestIndex]) {
      smallestIndex = leftChildIndex;
    }
    if (rightChildIndex < size &&
        _heap[rightChildIndex] < _heap[smallestIndex]) {
      smallestIndex = rightChildIndex;
    }
    if (smallestIndex != index) {
      _swap(index, smallestIndex);
      _heapifyDown(smallestIndex);
    }
  }

  void _swap(int i, int j) {
    int temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }
}

void main() {
  MinHeap heap = MinHeap();
  heap.insert(5);
  heap.insert(3);
  heap.insert(7);
  print(heap.min);
  heap.removeMin();
  print(heap.min);
}
