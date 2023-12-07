import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDateString() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String toHourString() {
    return DateFormat('HH:mm').format(this);
  }
}
