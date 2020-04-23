extension UserUtils on String {
  String capitalizeName(String s) => s[0].toUpperCase() + s.substring(1).toLowerCase();
}