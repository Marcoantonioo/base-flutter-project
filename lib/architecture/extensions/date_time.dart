import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get formatToDisplay {
    final DateFormat formatter = DateFormat('dd/MM/yyyy \'às\' HH:mm:ss');
    return formatter.format(this);
  }
}
