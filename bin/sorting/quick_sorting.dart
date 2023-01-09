
 // Timecomplexity of quicksort in best and worst case is O(n log(n)) and in worst case its O(n^2)//


void main() {
  // Declare a list of integers
  List<int> numbers = [3, 7, 4, 9, 5, 2, 6, 1];

  // Sort the list using the quick sort algorithm
  quickSort(numbers, 0, numbers.length - 1);

  // Print the sorted list
  print(numbers); 
}

// The quick sort function that sorts the list between the low and high indices
void quickSort(List<int> numbers, int low, int high) {
  // If the low index is less than the high index, there is a possibility to partition the list
  if (low < high) {
    // Get the pivot index by partitioning the list between the low and high indices
    int pivotIndex = partition(numbers, low, high);

    // Recursively sort the list before the pivot index
    quickSort(numbers, low, pivotIndex - 1);
    // Recursively sort the list after the pivot index
    quickSort(numbers, pivotIndex + 1, high);
  }
}

// The partition function that finds the pivot index for the quick sort algorithm
int partition(List<int> numbers, int low, int high) {
  // Select the last element as the pivot
  int pivot = numbers[high];
  // Initialize the index of the "smaller" element
  int smallerIndex = low - 1;

  // Iterate through the list between the low and high indices
  for (int currentIndex = low; currentIndex < high; currentIndex++) {
    // If the current element is smaller than the pivot
    if (numbers[currentIndex] < pivot) {
      // Increment the index of the "smaller" element
      smallerIndex++;
      // Swap the current element with the element at the "smaller" index
      int temp = numbers[smallerIndex];
      numbers[smallerIndex] = numbers[currentIndex];
      numbers[currentIndex] = temp;
    }
  }

  // Swap the pivot element with the element at the "smaller" index + 1
  int temp = numbers[smallerIndex + 1];
  numbers[smallerIndex + 1] = numbers[high];
  numbers[high] = temp;

  // Return the pivot index
  return smallerIndex + 1;
}
