import 'package:intl/intl.dart';

import './duration_extension.dart';

extension DateTimeExtension on DateTime {
  int getAge() => DateTime.now().difference(this).inYears;
  String format() => DateFormat('dd/MM/yyyy').format(this);
}