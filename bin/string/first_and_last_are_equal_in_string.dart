class FirstLast{
  int areEqual(String string){
    int n = string.length;
    if(string[0] == string[n-1]){
      return 1;
    }else{
      return 0;
    }
  }
}

void main() {
  String string = 'malayalam';

  FirstLast firstLast = FirstLast();
  firstLast.areEqual(string);

  if(firstLast.areEqual(string)== 1){
    print('equal');
  }else{
    print('not equal');
  }
}