
void main() {
  String string = 'AswinS', reverseString = '';
 
  print(string);

 
  for(int i = string.length-1;i>=0;i--){
    reverseString = reverseString + string[i];
  }
 

  print(reverseString);
}