class Car {
  final double mileage;
  final int age;

  Car({this.mileage, this.age});
}

class CarService {
  List<Car> getCars() => [
        Car(mileage: 100000, age: 20),
        Car(mileage: 10000, age: 3),
        Car(mileage: 5000, age: 1),
      ];
}

extension CarExtension on Car {
  double get mileageInKm => .6 * this.mileage;
}

extension CarExtension2 on Car {
  double get mileageInKm => .7 * this.mileage;
}
