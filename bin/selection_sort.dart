class SelectionSort {
  selectionSort(List<int> arr) {
    int temp;
    int minIndex;
    for (int i = 0; i < arr.length - 1; i++) {
      minIndex = i;
      for (int j = i + 1; j < arr.length; j++) {
        if (arr[minIndex] > arr[j]) {
          minIndex = j;
        }
      }
      temp = arr[i];
      arr[i] = arr[minIndex];
      arr[minIndex] = temp;
    }
    return arr;
  }
}

void main() {
  SelectionSort selectionSort = SelectionSort();
  List<int> arr = [64, 25, 12, 22, 11];
  print(arr);
  selectionSort.selectionSort(arr);
  print(arr);
}
