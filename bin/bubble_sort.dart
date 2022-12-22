
class BubbleSort {
  bubbleSort(List<int> arr) {
    int n = arr.length;
    int temp;

    for (int i = n - 1; i >= 1; i--) {
      for (int j = 0; j < i; j++) {
        if (arr[j] > arr[j + 1]) {
          temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        }
      }
    }
    return arr;
  }
}

void main() {
  BubbleSort bubbleSort = BubbleSort();
  List<int> arr = [5, 1, 4, 2, 8];
  print('before sorting');
  print(arr);
  bubbleSort.bubbleSort(arr);
  print('after sorting');
  print(arr);
}
