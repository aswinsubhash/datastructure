class MinHeap {
  List<int> heap;

  MinHeap() : heap = [];

  int get size => heap.length;

  bool get isEmpty => size == 0;

  int get min {
    if (isEmpty) throw Exception("Heap is empty");
    return heap[0];
  }

  void insert(int value) {
    heap.add(value);
    _heapifyUp(heap.length - 1);
  }

  int removeMin() {
    if (isEmpty) throw Exception("Heap is empty");
    int min = heap[0];
    heap[0] = heap[heap.length - 1];
    heap.removeLast();
    _heapifyDown(0);
    return min;
  }

  void _heapifyUp(int index) {
    if (index == 0) return;
    int parentIndex = (index - 1) ~/ 2;
    if (heap[parentIndex] > heap[index]) {
      _swap(parentIndex, index);
      _heapifyUp(parentIndex);
    }
  }

  void _heapifyDown(int index) {
    int leftChildIndex = 2 * index + 1;
    int rightChildIndex = 2 * index + 2;
    int smallestIndex = index;
    if (leftChildIndex < size && heap[leftChildIndex] < heap[smallestIndex]) {
      smallestIndex = leftChildIndex;
    }
    if (rightChildIndex < size &&
        heap[rightChildIndex] < heap[smallestIndex]) {
      smallestIndex = rightChildIndex;
    }
    if (smallestIndex != index) {
      _swap(index, smallestIndex);
      _heapifyDown(smallestIndex);
    }
  }

  void _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
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
