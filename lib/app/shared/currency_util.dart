import 'package:intl/intl.dart';

class CurrencyUtil {
  static String doubleToReal(double value) {
    final NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(value);
  }
}
