import 'package:intl/intl.dart';

class HumanFormat {
  static String number(double number) {
    final formatternumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en',
    ).format(number);

    return formatternumber;
  }
}