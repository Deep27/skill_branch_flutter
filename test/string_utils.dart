extension MyString on String {
  String capitalizeName(String s) {
    List splitted = s.split(" ");
    if (splitted.length != 2) {
      throw Exception("Username must consist of first and last names!");
    }
    String firstName = splitted[0][0].toUpperCase() + s[0].substring(1);
    String lastName = splitted[1][0].toUpperCase() + s[1].substring(1);
    return '$firstName $lastName';
  }
}