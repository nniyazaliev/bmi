import 'package:bmi/helpers/app_emuns.dart';

class ClientHomeModel {
  Gender gender;
  double height;
  int weight;
  int age;

  ClientHomeModel({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });
}
