class Validator {
  static String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return "The Title is empty!";
    }
    return null;
  }

  static String? validateDesc(String? value) {
    if (value == null || value.isEmpty) {
      return "The note is empty!";
    }
    return null;
  }
}
