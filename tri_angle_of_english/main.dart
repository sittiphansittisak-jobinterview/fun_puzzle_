//กำหนดหน้าตาของรูปสามเหลี่ยมและพื้นที่ว่าง
final displayTarget = '*';
final displayBlank = ' ';

void main() {
  final int input = 10; //You can change this!
  if (input < 0) return print('Warning: Invalid input!');

  final triAngle = getTriAngle(input);
  final triAngleConverted = convertCharacterToEnglish(triAngle);

  showResult(input: input, triAngle: triAngleConverted);
}

List<List<String>> getTriAngle(int height) {
  final List<List<String>> triAngle = [];
  for (int row = 0; row < height; row++) {
    final List<String> rowDisplay = [];
    rowDisplay.addAll(List<String>.generate(height - row - 1, (index) => displayBlank));
    rowDisplay.addAll(List<String>.generate(row * 2 + 1, (index) => displayTarget));
    triAngle.add(rowDisplay);
  }
  return triAngle;
}

List<List<String>> convertCharacterToEnglish(List<List<String>> triAngle) {
  final List<List<String>> triAngleConverted = [];
  int charCodeCount = 0;
  for (final row in triAngle) {
    triAngleConverted.add(row.map((e) => e == displayTarget ? String.fromCharCode(charCodeCount++ % 26 + 65) : e).toList());
  }
  return triAngleConverted;
}

void showResult({required input, required List<List<String>> triAngle}) {
  print('input: $input');
  print('output:');
  print(triAngle.map((e) => e.join('')).join('\n'));
}
