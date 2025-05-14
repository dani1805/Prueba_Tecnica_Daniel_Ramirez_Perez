// ignore_for_file: lines_longer_than_80_chars, no_leading_underscores_for_local_identifiers

class Validators {
  static String? validateEmail(String? email, String emptyError, String error) {
    final _pattern = RegExp(
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$",
    );

    if (email == null || email.isEmpty) return emptyError;
    if (!_pattern.hasMatch(email.toLowerCase())) return error;
    return null;
  }

  static String? validatePassword(
    String? password,
    String emptyError,
    String error,
  ) {
    if (password == null || password.isEmpty) return emptyError;
    if (password.length < 8 || password.length > 20) return error;
    if (!_checkPassword(password)) return error;
    return null;
  }

  static bool _checkPassword(String? password) {
    if (!password!.contains(RegExp('[A-Z]'))) return false;
    if (!password.contains(RegExp('[a-z]'))) return false;
    if (!password.contains(RegExp('[0-9]'))) return false;

    return true;
  }

  static String? validateEmpty(String? field, String error) {
    if (field == null || field.isEmpty) return error;
    return null;
  }

  static String? validatePhone(String? phone, String emptyError, String error) {
    final _pattern = RegExp(r'^[0-9]+$');

    if (phone == null || phone.isEmpty) return emptyError;
    if (phone.length >= 14 || phone.length <= 8) return error;
    if (!_pattern.hasMatch(phone)) return error;

    return null;
  }

  static String? validateRepeatPassword(
    String? repeatPassword,
    String password,
    String emptyError,
    String invalidError,
    String error,
  ) {
    if (repeatPassword == null || repeatPassword.isEmpty) return emptyError;
    if (repeatPassword.length < 8 || repeatPassword.length > 20)
      return invalidError;
    if (repeatPassword != password) return error;
    if (!_checkPassword(repeatPassword)) return error;
    return null;
  }
}
