import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get dateTimeFormat => DateFormat('yyyy-MM-dd').format(this);
}
