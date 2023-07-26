//กำหนดหน้าตาของรูปสามเหลี่ยมและพื้นที่ว่าง
final displayTarget = '*';
final displayBlank = ' ';

void main() {
  final int input = 10; //You can change this!
  if (input < 0) return print('Warning: Invalid input!');

  final triAngle = getTriAngle(input);
  final tower = convertTriAngleToTower(triAngle);
  final towerConverted = convertCharacterOfTower(tower);

  showResult(input: input, tower: towerConverted);
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

List<List<String>> convertTriAngleToTower(List<List<String>> triAngle) {
  final replaceLength = triAngle.first.length - 1;
  final List<List<String>> tower = [];
  bool isReplaceLeft = true;
  for (final row in triAngle) {
    if (isReplaceLeft) {
      for (int index = 0; index < replaceLength; index++) row[index] = displayBlank;
    } else {
      for (int index = row.length - 1; index > replaceLength; index--) row[index] = displayBlank;
    }
    tower.add(row);
    isReplaceLeft = !isReplaceLeft;
  }
  return tower;
}

List<List<String>> convertCharacterOfTower(List<List<String>> tower) {
  final List<List<String>> towerConverted = [];
  int charCodeCount = 0;
  bool isConvertReverse = false; //เพื่อเรียงตัวอักษรไล่จากตรงกลาง
  for (int row = 0; row < tower.length; row++) {
    if (!isConvertReverse) {
      towerConverted.add(tower[row].map((e) => e == displayTarget ? String.fromCharCode(charCodeCount++ % 26 + 65) : e).toList());
    } else {
      charCodeCount += row;
      towerConverted.add(tower[row].map((e) => e == displayTarget ? String.fromCharCode(charCodeCount-- % 26 + 65) : e).toList());
      charCodeCount += row + 2;
    }
    isConvertReverse = !isConvertReverse;
  }
  return towerConverted;
}

void showResult({required input, required List<List<String>> tower}) {
  print('input: $input');
  print('output:');
  print(tower.map((e) => e.join('')).join('\n'));
}
