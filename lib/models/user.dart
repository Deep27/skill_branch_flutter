class User {
  final String _firstName;
  final String _lastName;
  final _LoginType _loginType;
  String _email;
  String _phone;

  final List<User> _friends = [];

  User._(this._firstName, this._lastName, this._email, this._phone)
      : _loginType = _email != null ? _LoginType.email : _LoginType.phone;

  factory User({String name, String email, String phone}) {
    if (name.split(" ").length != 2) {
      throw Exception('User name must have first and last name!');
    }

    return User._(_getFirstName(name), _getLastName(name), _checkEmail(email),
        _checkPhone(phone));
  }

  @override
  int get hashCode =>
      _firstName.hashCode +
      _lastName.hashCode +
      _loginType.hashCode +
      _email?.hashCode +
      _phone?.hashCode;

  @override
  bool operator ==(other) {
    if (other == null) {
      return false;
    }
    if (other is User) {
      // other.runtimeType == User
      return _firstName == other._firstName &&
          _lastName == other._lastName &&
          (_phone == other._phone || _email == other.email);
    }
    return false;
  }

  @override
  String toString() => '''
      Firstname: $_firstName
      Lastname: $_lastName
      Email: $_email
      Phone: $_phone
      Friends: ${_friends.toList()}
    ''';

  void addFriends(Iterable<User> newFriends) => _friends.addAll(newFriends);

  void removeFriend(User friend) => _friends.remove(friend);

  void removeFriends(Iterable<User> friends) => _friends.forEach((user) => {
        if (_friends.contains(user)) {_friends.remove(user)}
      });

  static String _getFirstName(String username) => username.split(" ")[0];

  static String _getLastName(String username) => username.split(" ")[1];

  static String _checkPhone(String phone) {
    if (phone == null) {
      return null;
    }
    phone = phone.replaceAll(RegExp("[^+\\d]"), "");
    final String pattern = r"^(?:[+0])?[0-9]{11}";
    if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception(
          'Enter a valid phone number starting with a + and containing 11 digits.');
    }
    return phone;
  }

  static String _checkEmail(String email) {
    if (email != null && email.isEmpty) {
      throw Exception("Email must not be null or empty!");
    }
    return email;
  }

  String get email => _email;

  String get phone => _phone;

  String get name => '$_firstName $_lastName';

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get login => _loginType == _LoginType.email ? _email : _phone;

  List<User> get friends => _friends;

  set phone(String value) => _phone = value;

  set email(String value) => _email = value;
}

enum _LoginType { email, phone }
