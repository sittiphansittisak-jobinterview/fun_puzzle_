import 'dart:math';

//กำหนดหน้าตาของรูปและพื้นที่ว่าง
final n = 3;
final repetition = n + (n % 2 == 1 ? 0 : 1);
final displayBlank = ' ';
final displayTarget = '*' /*'${blank * (repetition - 1)}$target${blank * (repetition - 1)}'*/;

String replaceMiddle({required String originalString, required String replacement}) {
  int middleIndex = originalString.length ~/ 2;
  String firstHalf = originalString.substring(0, middleIndex);
  String secondHalf = originalString.substring(middleIndex + 1);
  return '$firstHalf$replacement$secondHalf';
}

void main() {
  final int input = 10; //You can change this!
  if (input <= 0) return print('Warning: Invalid input!');

  final diameter = input * 2 - 1;
  final area = getArea(diameter);
  final areaPainted = paintCircle(area);

  showResult(input: input, area: areaPainted);
}

List<List<String>> getArea(int diameter) {
  List<List<String>> area = [];
  for (int row = 0; row < diameter; row++) {
    area.add([]);
    for (int column = 0; column < diameter; column++) {
      area[row].add(displayBlank);
    }
  }
  return area;
}

//ใช้ทฤษฎีบทพีทาโกรัส
List<List<String>> paintCircle(List<List<String>> area) {
  final radius = area.length ~/ 2;
  for (int row = 0; row < area.length; row++) {
    final height = (row - radius).abs();
    for (int column = 0; column < area[row].length; column++) {
      final width = (column - radius).abs();
      final currentRadius = sqrt(height * height + width * width).ceil();
      if (currentRadius <= radius) area[row][column] = displayTarget;
    }
  }
  return area;
}

void showResult({required input, required List<List<String>> area}) {
  print('input: $input');
  print('output:');
  for (int row = 0; row < area.length; row++) {
    print(area[row].map((e) => replaceMiddle(originalString: displayBlank * repetition, replacement: e)).join());
  }
}
