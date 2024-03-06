import 'package:surf_flutter_courses_template/style/strings.dart';

String splitBy(int number, [int offset = 3, String separator = StringRes.space]) {
  final List<String> result = [];
  var reversed = number.toString().split('').reversed;

  int length = reversed.length;
  while (length > offset) {
    final String group = reversed.take(offset).toList().reversed.join();
    result.add(group);

    reversed = reversed.skip(offset);
    length -= offset;
  }
  result.add(reversed.toList().reversed.join());

  return result.reversed.join(separator);
}
