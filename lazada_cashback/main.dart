//กำหนดหน้าตาของรูปและพื้นที่ว่าง
final displayBlank = ' ';
final displayTarget = '*';

void main() {
  final int input = 100; //You can change this!
  if (input <= 0) return print('Warning: Invalid input!');

  final discountInPercentList = getDiscountInPercentList(orderSum: input);
  final discountInPercentAverage = getAverage(valueList: discountInPercentList);
  final discountInPercentMax = getMax(valueList: discountInPercentList);
  final discountInPercentMin = getMin(valueList: discountInPercentList);
  final area = getArea(diameter: 100); //กำหนดขนาดภาพ 100x100
  final areaPainted = paintGraph(area: area, discountInPercentList: discountInPercentList);

  showResult(input: input, discountInPercentAverage: discountInPercentAverage, areaPainted: areaPainted, max: discountInPercentMax, min: discountInPercentMin);
}

List<double> getDiscountInPercentList({required int orderSum}) {
  double getDiscountInPercent({required int orderNumber}) => 100 * (orderNumber - 1) / (3 * orderNumber - 1);
  final List<double> discountInPercentList = [];
  for (int orderNumber = 2; orderNumber <= orderSum + 1; orderNumber++) {
    discountInPercentList.add(getDiscountInPercent(orderNumber: orderNumber));
  }
  return discountInPercentList;
}

double getAverage({required List<double> valueList}) {
  return valueList.reduce((value, element) => value + element) / valueList.length;
}

//to show graph in lower than maximum value
double getMax({required List<double> valueList}) {
  return valueList.reduce((value, element) => value > element ? value : element);
}

//to show graph in higher than minimum value
double getMin({required List<double> valueList}) {
  return valueList.reduce((value, element) => value < element ? value : element);
}

List<List<String>> getArea({required int diameter}) {
  List<List<String>> area = [];
  for (int row = 0; row < diameter; row++) {
    area.add([]);
    for (int column = 0; column < diameter; column++) {
      area[row].add(displayBlank);
    }
  }
  return area;
}

//กราฟแกน X มีค่า 0-100 แกน Y มีค่า 0-100
List<List<String>> paintGraph({required List<List<String>> area, required List<double> discountInPercentList}) {
  final discountInPercentListForGraph = discountInPercentList.map((value) => value.round()).toList(); // แปลงเป็น List<int> เพราะกราฟสเกลไม่ละเอียดพอที่จะทำให้แสดงค่าทศนิยมได้
  final List<List<String>> areaWithIndicator = [];
  for (int row = area.length - 1; row >= 0; row--) {
    for (int column = 0; column < area[row].length; column++) {
      final index = column - 2;
      if (index < 0) continue;
      if (row == discountInPercentListForGraph[column]) area[row][column] = displayTarget;
    }
    //paint Y indicator
    areaWithIndicator.add([
      ...['${row.toString().padLeft(3)} '],
      ...area[row]
    ]);
  }
  //paint X indicator
  areaWithIndicator.add([''.padLeft(4), ...List<String>.generate(10, (index) => List<String>.generate(10, (index) => index.toString()).join())]);
  return areaWithIndicator.reversed.toList(); //reverse because sort List from high to low like graph
}

void showResult({required input, required double discountInPercentAverage, required List<List<String>> areaPainted, required double max, required double min}) {
  print('input: $input');
  print('output:');
  print('Discount: ${discountInPercentAverage.toStringAsFixed(2)}%');
  print('Graph:');
  for (int row = areaPainted.length - 1; row >= 0; row--) {
    if (row > max + 1 || row < min - 1) continue;
    print(areaPainted[row].join());
  }
  print(areaPainted[0].join());
}
