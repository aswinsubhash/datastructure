void main() {
  String string = 'malayalam';
  int flag = 0;

  for (int i = 0; i <= string.length / 2; i++) {
    if (string[i] != string[(string.length) - i - 1]) {
      flag = 1;
      break;
    }
  }

  if (flag == 1) {
    print('not pal');
  } else {
    print('pal');
  }
}
