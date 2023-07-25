void main() {
  final dynamic input = null; //You can change this!
  //if(input validation) return print('Warning: Invalid input!');

  final dynamic value = doSomething(input);

  showResult(input: input, value: value);
}

dynamic doSomething(dynamic input) {
  return input;
}

void showResult({required input, required dynamic value}) {
  print('input: $input');
  print('output:');
  print(value);
}
