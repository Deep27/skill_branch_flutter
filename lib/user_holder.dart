import 'models/user.dart';
import './string_util.dart';

class UserHolder {
  Map<String, User> _users = {};

  void registerUser(String username, String phone, String email) {
    User user =
        User(name: username.capitalizeName(), phone: phone, email: email);
    if (_users.containsKey(user.login)) {
      throw Exception("User with login ${user.login} already exists!");
    }
    _users[user.login] = user;
  }

  User registerUserByEmail(String fullName, String email) {
    User user =
        User(name: fullName.capitalizeName(), email: email, phone: null);
    if (_users.containsKey(user.login)) {
      throw Exception('A user with this email already exists');
    }
    _users[user.login] = user;
    return user;
  }

  User registerUserByPhone(String fullName, String phone) {
    if (phone == null || phone.isEmpty) {
      throw Exception("Enter don't empty number");
    }
    User user = User(name: fullName, phone: phone);
    if (_users.containsKey(user.login)) {
      throw Exception('A user with this phone already exists');
    }
    _users[user.login] = user;
    return user;
  }

  User getUserByLogin(String login) => _users[login];

  User findUserInFriends(String fullName, User user) {
    User toFindFriendOf = _users[fullName.capitalizeName()];
    if (toFindFriendOf == null) {
      throw Exception('No user with name ${fullName.capitalizeName()}!');
    }
    if (toFindFriendOf.friends.contains(user)) {
      return user;
    }
    throw Exception('${user.login} is not a friend of the login');
  }

  List<User> importUsers(List<String> users) {

  }

  void setFriends(String login, List<User> friends) {
    _users.clear();
    friends.forEach((user) => _users[user.login] = user);
  }

  get users => _users;
}
