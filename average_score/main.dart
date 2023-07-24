void main() {
  final List<int> input = [50, 60, 70, 80]; //You can change this!

  final average = getAverage(input);
  final grade = getGrade(average);

  showResult(input: input, average: average, grade: grade);
}

double getAverage(List<int> scoreList) {
  int sum = 0;
  for (int score in scoreList) {
    sum += score;
  }
  return (sum / scoreList.length);
}

String getGrade(double score) {
  if (score >= 80) return 'A';
  if (score >= 70) return 'B';
  if (score >= 60) return 'C';
  if (score >= 50) return 'D';
  return 'F';
}

void showResult({required input, required double average, required String grade}) {
  print('input: $input');
  print('output:');
  print('คะแนนเฉลี่ย: ${average.toStringAsFixed(2)}');
  print('เกรด: $grade');
}
