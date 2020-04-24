import 'package:csv/csv.dart';

import 'models/user.dart';
import './string_util.dart';

class UserHolder with UserUtils {
  Map<String, User> _users = {};

  void registerUser(String username, String phone, String email) {
    User user = User(name: capitalize(username), phone: phone, email: email);
    if (_users.containsKey(user.login)) {
      throw Exception("User with login ${user.login} already exists!");
    }
    _users[user.login] = user;
  }

  User registerUserByEmail(String fullName, String email) {
    if (!email.contains('@')) {
      throw Exception('Incorrect email!');
    }
    User user = User(name: capitalize(fullName), email: email, phone: null);
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

  User findUserInFriends(String login, User user) {
    User toFindFriendOf;
    if (login.contains("@")) {
      toFindFriendOf = _users[login];
    } else {
      toFindFriendOf = _users[capitalize(login)];
    }
    if (toFindFriendOf == null) {
      throw Exception('No user with login $login!');
    } else if (toFindFriendOf.friends.contains(user)) {
      return user;
    }
    throw Exception('${user.login} is not a friend of the login');
  }

  List<User> importUsers(List<String> users) {
    final csvConverter = const CsvToListConverter(fieldDelimiter: ';');
    final List<List<dynamic>> filteredCsvUsers = users
        .map((userData) => csvConverter.convert(userData))
        .toList()[0]
        .map((userData) => userData.map((data) {
              data = data.toString().trim();
              if ((data as String).startsWith(RegExp('\\d'))) {
                data = '+$data';
              }
              return data;
            }).toList())
        .toList();
    filteredCsvUsers.forEach(
        (userData) => userData.removeWhere((stringData) => stringData.isEmpty));

    return filteredCsvUsers
        .map((userData) =>
            User(name: userData[0], phone: userData[2], email: userData[1]))
        .toList();
  }

  void setFriends(String login, List<User> friends) {
    _users[login].friends.clear();
    _users[login].friends.addAll(friends);
  }

  User findUserByFullName(String fullName) {
    fullName = capitalize(fullName);
    final users = Map<String, User>.from(_users);
    users.removeWhere((login, user) => user.name != fullName);
    final filteredUsers = users.values.toList();
    if (filteredUsers.isEmpty) {
      return null;
    } else if (filteredUsers.length > 1) {
      print('Found 2 or more users with same names! Returning the first one!');
    }
    return filteredUsers[0];
  }

  get users => _users;
}
