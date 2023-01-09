class InsertionSort {
  insertionSort(List<int> arr) {
    int n = arr.length;
    int space;

    for (int i = 1; i < n; i++) {
      int key = arr[i];
      space = i;

      for (int j = space - 1; j >= 0; j--) {
        if (arr[j] > key) {
          arr[j + 1] = arr[j];
          space = j;
          continue;
        }
        break;
      }
      arr[space] = key;
    }

    return arr;
  }
}
void main() {
  InsertionSort insertionSort = InsertionSort();
  List<int>arr = [12,11,13,5,6];
  print(arr);
  insertionSort.insertionSort(arr);
  print(arr);
}