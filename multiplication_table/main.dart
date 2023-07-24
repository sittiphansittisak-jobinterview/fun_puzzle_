final countStart = 1;
final countStop = 12;

void main() {
  final int input = 99; //You can change this!

  final table = getTable(input);

  showResult(input: input, table: table);
}

List<String> getTable(int number) {
  final table = <String>[];
  for (int count = countStart; count <= countStop; count++) {
    table.add('$count x $number = ${count * number}');
  }
  return table;
}

void showResult({required input, required List<String> table}) {
  print('input: $input');
  print('output:');
  table.forEach(print);
}
