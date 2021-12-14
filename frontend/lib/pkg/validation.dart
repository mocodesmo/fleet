class Validation {
  static bool isNumeric(String s) {
    try {
      double.parse(s);
      return true;
    } catch (e) {}
    return false;
  }

  static bool isPhoneNumber(String phone) {
    final number = phone.split(' ').last;
    if (phone.startsWith('+') && isNumeric(number) && number.length > 7) {
      return true;
    }
    return false;
  }
}
