

// Time complexity of heap sort is O(n log(n)) in all the  cases//


void main() { 
  // Create a list of integers
  List<int> numbers = [4,11,2,7,1];

  // Sort the list using the heapSort function
  heapSort(numbers);

  // Print the sorted list to the console
  print(numbers); 
}

// Definition of the heapSort function
void heapSort(List<int> numbers) {
  // Build a max heap from the list of numbers
  for (int i = (numbers.length / 2).floor() - 1; i >= 0; i--) {
    // heapify the subtree rooted at index i
    heapify(numbers, numbers.length, i);
  }

  // Extract the elements of the heap one by one, building the sorted list
  for (int i = numbers.length - 1; i >= 0; i--) { 
    // Move the current root to the end of the list
    int temp = numbers[0];
    numbers[0] = numbers[i];
    numbers[i] = temp;

    // Call heapify on the reduced heap to restore the max heap property
    heapify(numbers, i, 0);
  }
}

// Definition of the heapify function
void heapify(List<int> numbers, int n, int i) {
  // Find the largest value among the root, left child, and right child
  int largest = i;
  int l = 2 * i + 1; // index of the left child
  int r = 2 * i + 2; // index of the right child

  if (l < n && numbers[l] > numbers[largest]) {
    // If the left child is larger than the root, update largest
    largest = l;
  }

  if (r < n && numbers[r] > numbers[largest]) {
    // If the right child is larger than the root, update largest
    largest = r;
  }

  // If the root is not the largest, swap it with the largest value and continue heapifying
  if (largest != i) {
    int temp = numbers[i];
    numbers[i] = numbers[largest];
    numbers[largest] = temp;
    heapify(numbers, n, largest);
  }
}
