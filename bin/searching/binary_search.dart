binarySearchIter(int target, List<int> arr) {
  var startIndex = 0;
  var endIndex = arr.length-1;
  while (startIndex <= endIndex) {
    var mid = (startIndex + endIndex) / 2;
    int midPos = mid.floor();
    if (target == arr[midPos]) {
      return midPos;
    } else if (arr[midPos] > target) {
      endIndex = midPos - 1;
    } else if (arr[midPos] < target) {
      startIndex = midPos + 1;
    }
  }
  return "target not found";
}

void main() {
  List<int> array = [1, 2, 3, 4, 5, 6, 7];
  print(binarySearchIter(8, array));
}
