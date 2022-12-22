void main(List<String> args) {
  String string = 'aswinssinin';
  int counnt = 0;

  for(int i=0;i<string.length;i++){
    for(int j=i+1;j<string.length;j++){
      if(string[i]==string[j]){
        print(string[j]);
        counnt++;
        break;
      }
    }
  }
  print(counnt);
}