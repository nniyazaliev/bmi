import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:bmi/helpers/app_emuns.dart';
import 'package:bmi/models/client_home_model.dart';

part 'home_screen_provider.g.dart';

@riverpod
class HomeScreenNotifier extends _$HomeScreenNotifier {
  @override
  ClientHomeModel build() {
    return ClientHomeModel(
      gender: Gender.female,
      height: 170,
      weight: 50,
      age: 18,
    );
  }

  void changeGender(Gender value) {
    state = ClientHomeModel(
      gender: value,
      height: state.height,
      weight: state.weight,
      age: state.age,
    );
  }

  void changeHeight(double value) {
    state = ClientHomeModel(
      gender: state.gender,
      height: value,
      weight: state.weight,
      age: state.age,
    );
  }

  void incrementWeight() {
    var latestWeight = state.weight;
    latestWeight++;

    state = ClientHomeModel(
      gender: state.gender,
      height: state.height,
      weight: latestWeight,
      age: state.age,
    );
  }

  void decrementWeight() {
    var latestWeight = state.weight;
    latestWeight--;

    state = ClientHomeModel(
      gender: state.gender,
      height: state.height,
      weight: latestWeight,
      age: state.age,
    );
  }

  void incrementAge() {
    var latestAge = state.age;
    latestAge++;

    state = ClientHomeModel(
      gender: state.gender,
      height: state.height,
      weight: state.weight,
      age: latestAge,
    );
  }

  void decrementAge() {
    var latestAge = state.age;
    latestAge--;

    state = ClientHomeModel(
      gender: state.gender,
      height: state.height,
      weight: state.weight,
      age: latestAge,
    );
  }
}
