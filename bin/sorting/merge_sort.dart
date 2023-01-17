void mergeSort(List<int> list) {
  // Check if the list has a length less than or equal to 1
  if (list.length <= 1) return;

  // Get the middle index of the list
  var middle = list.length ~/ 2;

  // Split the list into left and right sublists
  var left = list.sublist(0, middle);
  var right = list.sublist(middle);

  // Recursively sort the left and right sublists
  mergeSort(left);
  mergeSort(right);

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
}

int countListDivisions(List<int> list) {
  // Initialize a count variable to keep track of the number of divisions
  int count = 0;

  // While the length of the list is greater than 1
  while (list.length > 1) {
    // Get the middle index of the list
    int middle = list.length ~/ 2;

    // Divide the list into two equal sublists
    list = list.sublist(middle);

    // Increment the count for each division
    count++;
  }

  // Return the final count of divisions
  return count;
}



void main() {
  // initialize list to be sorted
  List<int> list = [7,8,1,5,2,9];
  // sort the list
  mergeSort(list);
  //print the sorted list
  print(list);
  print(countListDivisions(list)); 

}
