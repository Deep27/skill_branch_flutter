extension MyString on String {
  String capitalizeName() => this[0].toUpperCase() + this.substring(1).toLowerCase();
}