import 'models/car.dart' hide CarExtension2;
import 'package:flutter_test/flutter_test.dart'
    show expect, group, isA, setUp, tearDownAll, test, throwsA;

extension<T extends num> on T {
  T increase() => this + 1;
}

extension<T extends num> on List<T> {
  T get sum {
    num acc = 0;
    return this.fold(acc, (a, b) => a + b);
  }
}

extension<R, F, S> on R Function(F, S) {
  R Function(S) simplify(F first) {
    return (S second) => this(first, second);
  }
}

bool login(String email, String password) {
  // ...
  return true;
}

void main() {
  test('testExtensions', () {

    var passwords = ['aaa', 'bbb', 'ccc'];
    var email = 'email@email.com';
    
    passwords.forEach((pwd) => login(email, pwd));
    passwords.forEach(login.simplify(email));

    print(10.increase());
    print(10.0.increase());

    print([1, 2, 3, 4, 5].sum);

    CarService carService = CarService();
    carService.getCars().forEach((car) => print(car.mileageInKm));
  });
}
