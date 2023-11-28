import 'dart:math';

class PersonModel {
  final String name;
  final double value;
  final double id = Random().nextDouble();

  PersonModel({required this.name, required this.value});
}