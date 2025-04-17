mixin LimitedLeading {
  String limitToThreeChars(String? text) {
    if (text == null || text.isEmpty) return '';
    return text.length <= 3
        ? text.toUpperCase()
        : text.substring(0, 3).toUpperCase();
  }
}
