extension StringValidators on String {
  bool get containsUppercase => contains(RegExp(r'[A-Z]'));
  bool get containsLowercase => contains(RegExp(r'[a-z]'));
  bool get containsNumbers => contains(RegExp(r'[0-9]'));
  bool get containsSpecialCharacters => contains(RegExp('(?=.*[@#\$%^&+=])'));
}

class Validator {
  static const mandatoryField = '*Campo Obrigatório';
  static const passwordsDontMatch = '*As senhas não combinam';
  static const invalidEmail = '*Email inválido';
  static const invalidPhone = '*Telefone inválido';
  static const invalidNumberSus = '*Número inválido';

  static String? checkValidFieldSus(String? value) {
    var resolved = value?.replaceAll(RegExp(' '), '');
    if (resolved == null || resolved.isEmpty) {
      return Validator.mandatoryField;
    } else if (!_isValidFieldSus(resolved)) {
      return Validator.invalidNumberSus;
    }
    return null;
  }

  static String? checkEmptyField(String? value, [int minCharacters = 1]) {
    if (value != null && value.length < minCharacters) {
      return Validator.mandatoryField;
    }
    return null;
  }

  static String? confirmPassword(String? password, String? confirmPassword) {
    if (password != null &&
        password.isEmpty &&
        confirmPassword != null &&
        confirmPassword.isEmpty) {
      return Validator.mandatoryField;
    } else if (password != confirmPassword) {
      return Validator.passwordsDontMatch;
    }
    return null;
  }

  static String? checkValidEmail(String? value) {
    if (value != null) {
      if (value.isNotEmpty) {
        bool emailValid =
            RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                .hasMatch(value);
        if (!emailValid) {
          return Validator.invalidEmail;
        } else {
          return null;
        }
      } else {
        return Validator.mandatoryField;
      }
    }
    return null;
  }

  static bool isEmail(String email) =>
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);

  static String? validPhone(String? value) {
    if (value != null) {
      if (value.isNotEmpty) {
        bool phoneValid =
            RegExp(r'^\([0-9]{2}\) [0-9]?[0-9]{4}-[0-9]{4}$').hasMatch(value);
        if (!phoneValid) {
          return Validator.invalidPhone;
        } else {
          return null;
        }
      } else {
        return Validator.mandatoryField;
      }
    }
    return null;
  }

  static String? validPassword(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return Validator.mandatoryField;
      }

      if (value.length < 8) {
        return "*A senha precisa ter no mínimo 8 caracteres";
      }

      if (!value.containsUppercase) {
        return "*A senha precisa conter pelo menos uma letra maiúscula";
      }

      if (!value.containsNumbers) {
        return "*A senha precisa conter pelo menos um número";
      }

      if (!value.containsNumbers) {
        return "*A senha precisa conter pelo menos um número";
      }

      if (!value.containsSpecialCharacters) {
        return "*A senha precisa conter pelo menos um caractere especial";
      }
    }
    return null;
  }

  static bool _isValidFieldSus(String s) {
    var exp1 = RegExp("[1-2]\\d{10}00[0-1]\\d");
    var exp2 = RegExp("[7-9]\\d{14}");
    bool isMatch = exp1.hasMatch(s) || exp2.hasMatch(s);

    if (isMatch) {
      return _somaPonderada(s) % 11 == 0;
    } else {
      return false;
    }
  }

  static int _somaPonderada(String s) {
    var soma = 0;
    for (int i = 0; i < s.length; i++) {
      soma += int.parse(s[i], radix: 10) * (15 - i);
    }
    return soma;
  }
}
