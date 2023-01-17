
int mergeSort(List<int> list, int count) {
  if (list.length <= 1) return count;
  
  count++; //increment the counter
  
  // Get the middle index of the list
  var middle = list.length ~/ 2;

  // Split the list into left and right sublists
  var left = list.sublist(0, middle);
  var right = list.sublist(middle);
print(left);
print(right); 
  // Recursively sort the left and right sublists
  count = mergeSort(left, count);
  count = mergeSort(right, count);

  // Initialize variables for merging the sublists back together
  var i = 0;
  var j = 0;
  var k = 0;

  // While there are elements in both sublists
  while (i < left.length && j < right.length) {
    // Compare the first element of the left sublist to the first element of the right sublist
    if (left[i] < right[j]) {
      // If the left element is smaller, add it to the main list
      list[k] = left[i];
      i++;
    } else {
      // If the right element is smaller, add it to the main list
      list[k] = right[j];
      j++;
    }
    k++;
  }

  // If there are remaining elements in the left sublist
  while (i < left.length) {
    // Add them to the main list
    list[k] = left[i];
    i++;
    k++;
  }

  // If there are remaining elements in the right sublist
  while (j < right.length) {
    // Add them to the main list
    list[k] = right[j];
    j++;
    k++;
  }
  return count;
}

void main() {
  int count = 0;
  List<int> list = [7,8,1,5,2,9];
  count = mergeSort(list, count);
  print(list);
  print(count);
}
