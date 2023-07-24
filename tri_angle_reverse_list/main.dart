//กำหนดหน้าตาของรูปสามเหลี่ยมและพื้นที่ว่าง
final displayTriangle = '*';
final displayBlank = ' ';

void main() {
  final List<int> input = [10, 1, 2, 3, 4, 5, 3, 2, 1, 10]; //You can change this!
  final containsNegative = input.any((element) => element <= 0);
  if (input.isEmpty || containsNegative) return print('Warning: Invalid input!');

  final linesList = triangleListBuilder(heightList: input);
  List<List<String>> displayLines = [];
  //รวมแต่ละบรรทัดของลิสต์รูปสามเหลี่ยมเข้าด้วยกัน
  for (final lines in linesList) {
    if (displayLines.isEmpty) {
      displayLines = lines;
    } else {
      for (int index = 0; index < lines.length; index++) {
        displayLines[index] += lines[index];
      }
    }
  }

  showResult(input: input, displayLines: displayLines);
}

List<List<List<String>>> triangleListBuilder({required List<int> heightList}) {
  heightList = heightList.expand((value) => [value, 1]).toList()..removeLast(); //สร้างพื้นที่ว่างให้แต่ละรูปสามเหลี่ยมห่างกัน 1 ช่อง
  final maxHeight = heightList.reduce((max, current) => max > current ? max : current);
  List<List<List<String>>> linesList = [];

  bool showIndicator = true; //เพื่อสลับว่าจะสร้างรูปสามเหลี่ยมหรือพื้นที่ว่าง
  for (final height in heightList) {
    final lines = triAngleBuilder(height: height, isShowIndicator: showIndicator);
    //สร้างพื้นที่ว่างสำหรับรูปสามเหลี่ยมที่สูงน้อยกว่าสามเหลี่ยมที่สูงที่สุด
    if (height < maxHeight) {
      final blankLine = List<String>.generate(height * 2 - 1, (_) => displayBlank);
      final blankLines = List<List<String>>.generate(maxHeight - height, (_) => blankLine);
      lines.addAll(blankLines);
    }
    linesList.add(lines);
    showIndicator = !showIndicator;
  }
  return linesList;
}

List<List<String>> triAngleBuilder({required int height, required bool isShowIndicator}) {
  List<List<String>> lines = [];

  for (int i = 0; i < height; i++) {
    lines.add([]);
    //สร้างพื้นที่ว่างด้านซ้าย
    for (int blankLeftIndex = 0; blankLeftIndex < i; blankLeftIndex++) {
      lines[i].add(displayBlank);
    }
    //สร้างรูปสามเหลี่ยม
    for (int displayIndex = (height - i) * 2 - 1; displayIndex > 0; displayIndex--) {
      lines[i].add(isShowIndicator ? displayTriangle : displayBlank);
    }
    //สร้างพื้นที่ว่างด้านขวา
    for (int blankRightIndex = 0; blankRightIndex < i; blankRightIndex++) {
      lines[i].add(displayBlank);
    }
  }

  //แสดงตัวเลขความสูงของแต่ละรูป
  final indicatorLine = List<String>.generate(height * 2 - 1, (_) => displayBlank);
  if (isShowIndicator) {
    final indicator = height.toString();
    for (int index = 0; index < indicator.length; index++) {
      indicatorLine[(indicatorLine.length / 2).ceil() - 1 + index] = indicator[index];
    }
  }
  lines.add(indicatorLine);
  return lines;
}

void showResult({required input, required List<List<String>> displayLines}) {
  print('input: $input');
  print('output:');
  for (final line in displayLines) {
    print(line.join());
  }
}
