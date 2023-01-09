void main() {
  List<int> numbers = [3, 7, 4, 9, 5, 2, 6, 1];

  quickSort(numbers, 0, numbers.length - 1);

  print(numbers); // [1, 2, 3, 4, 5, 6, 7, 9]
}

void quickSort(List<int> numbers, int low, int high) {
  if (low < high) {
    int pi = partition(numbers, low, high);

    quickSort(numbers, low, pi - 1);
    quickSort(numbers, pi + 1, high);
  }
}

int partition(List<int> numbers, int low, int high) {
  int pivot = numbers[high];
  int i = low - 1;

  for (int j = low; j < high; j++) {
    if (numbers[j] < pivot) {
      i++;
      int temp = numbers[i];
      numbers[i] = numbers[j];
      numbers[j] = temp;
    }
  }

  int temp = numbers[i + 1];
  numbers[i + 1] = numbers[high];
  numbers[high] = temp;

  return i + 1;
}
