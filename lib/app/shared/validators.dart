import 'package:app_test1/app/shared/currency_util.dart';

class Validators {
  static String? requiredInputField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static String? requiredValidPrice(String? value) {
    if (value!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      if (CurrencyUtil.parseCurrency(value) < 0.01) {
        return 'Valor muito baixo!';
      } else if (CurrencyUtil.parseCurrency(value) > 100000000000.0) {
        return 'Valor muito alto!';
      }
    }
    return null;
  }
}
