class UserUtils {
  String capitalize(String s) {
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
//    List<String> fullName = s.split(" ");
//    if (fullName.length != 2) {
//      throw Exception("Fullname shoild consist of first and lastnames!");
//    }
//    String firstName = fullName[0][0].toUpperCase() + fullName[0].substring(1).toLowerCase();
//    String lastName = fullName[1][0].toUpperCase() + fullName[1].substring(1).toLowerCase();
//    return '$firstName $lastName';
  }
}
