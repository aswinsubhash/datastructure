linearSearch(int target, List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == target) {
      print("position is $i");
    }
  }
  return -1;
}

void main(List<String> args) {
  List<int> array = [1, 2, 3, 4, 5, 6, 7];
  linearSearch(8, array);
}
