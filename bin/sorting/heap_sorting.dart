void main() {
  List<int> numbers = [3, 7, 4, 9, 5, 2, 6, 1];

  heapSort(numbers);

  print(numbers); // [1, 2, 3, 4, 5, 6, 7, 9]
}

void heapSort(List<int> numbers) {
  // Build max heap
  for (int i = (numbers.length / 2).floor() - 1; i >= 0; i--) {
    heapify(numbers, numbers.length, i);
  }

  // Extract elements from the heap one by one
  for (int i = numbers.length - 1; i >= 0; i--) {
    // Move current root to the end
    int temp = numbers[0];
    numbers[0] = numbers[i];
    numbers[i] = temp;

    // Call max heapify on the reduced heap
    heapify(numbers, i, 0);
  }
}

void heapify(List<int> numbers, int n, int i) {
  // Find largest among root, left child and right child
  int largest = i;
  int l = 2 * i + 1;
  int r = 2 * i + 2;

  if (l < n && numbers[l] > numbers[largest]) {
    largest = l;
  }

  if (r < n && numbers[r] > numbers[largest]) {
    largest = r;
  }

  // Swap and continue heapifying if root is not largest
  if (largest != i) {
    int temp = numbers[i];
    numbers[i] = numbers[largest];
    numbers[largest] = temp;
    heapify(numbers, n, largest);
  }
}
