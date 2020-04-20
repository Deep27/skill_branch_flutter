import 'user.dart';
import '../string_utils.dart';

class UserHolder {
  Map<String, User> _users = {};

  void registerUser(String username, String phone, String email) {
    User user = User(
        name: username.capitalizeName(username), phone: phone, email: email);
    if (_users.containsKey(user.login)) {
      throw Exception("User with login ${user.login} already exists!");
    }
    _users[user.login] = user;

    User user2 = User(
        name: username.capitalizeName(username), phone: phone, email: email);
    print('user == user2: ${user == user2}');
  }
}
