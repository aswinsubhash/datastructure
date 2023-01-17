// ? Time complexity of merger sort is O(nlogn)  in all the cases
//* Worst case scenario is when the array is sorted in descending order.

void mergeSort(List<int> list) {
  // Check if the list has a length less than or equal to 1
  if (list.length <= 1) return;

  // Get the middle index of the list
  var middle = list.length ~/ 2;

  // Split the list into left and right sublists
  var leftList = list.sublist(0, middle);
  var rightList = list.sublist(middle, list.length);
  print(leftList);
  print(rightList);

  // Recursively sort the left and right sublists
  mergeSort(leftList);
  mergeSort(rightList);

  // Initialize variables for merging the sublists back together
  var i = 0;
  var j = 0;
  var k = 0;

  // While there are elements in both sublists
  while (i < leftList.length && j < rightList.length) {
    // Compare the first element of the left sublist to the first element of the right sublist
    if (leftList[i] < rightList[j]) {
      // If the left element is smaller, add it to the main list
      list[k] = leftList[i];
      i++;
    } else {
      // If the right element is smaller, add it to the main list
      list[k] = rightList[j];
      j++;
    }
    k++;
  }

  // If there are remaining elements in the left sublist
  while (i < leftList.length) {
    // Add them to the main list
    list[k] = leftList[i];
    i++;
    k++;
  }

  // If there are remaining elements in the right sublist
  while (j < rightList.length) {
    // Add them to the main list
    list[k] = rightList[j];
    j++;
    k++;
  }
}

void main() {
  List<int> list = [7, 8, 1, 5, 2, 9];
  mergeSort(list);
  print(list);
}
