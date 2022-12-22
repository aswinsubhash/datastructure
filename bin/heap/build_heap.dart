class BuildHeap {

  //using the max heap
  void heapify(List<int> arr, int n, int i) {
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;

    // If left child is larger than root
    if (l < n && arr[l] > arr[largest]) largest = l;

    // If right child is larger than largest so far
    if (r < n && arr[r] > arr[largest]) largest = r;

    // If largest is not root
    if (largest != i) {
      int swap = arr[i];
      arr[i] = arr[largest];
      arr[largest] = swap;
      // Recursively heapify the affected sub-tree
      heapify(arr, n, largest);
    }
  }

  // build a Max-Heap from the Array
  void buildHeap(List<int> arr, int n) {
    int startIdx = (n ~/ 2) - 1;

    for (int i = startIdx; i >= 0; i--) {
      heapify(arr, n, i);
    }
  }

  void printHeap(List<int> arr, int n) {
    print("Array representation of Heap is");

    for (int i = 0; i < n; ++i);
    print(arr);
  }
}

void main() {
  List<int> arr = [1, 3, 5, 4, 6, 13, 10, 9, 8, 15, 17];
  int n = arr.length;
  BuildHeap buildHeap = BuildHeap();

  buildHeap.buildHeap(arr, n);
  buildHeap.printHeap(arr, n);
}
