import './models/user_holder.dart';

void main() => UserTest().test();

class UserTest {
  void test() {
    UserHolder userHolder = UserHolder();
    userHolder.registerUser("Hugh Jackman", "+79999999999", "nonEmptyEmail");
  }
}
