import 'package:bmi/helpers/app_emuns.dart';
import 'package:bmi/models/client_home_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    final clientHomeModel = ClientHomeModel(
      gender: value,
      height: state.height,
      weight: state.weight,
      age: state.age,
    );

    state = clientHomeModel;
  }

  void changeHeight(double value) {
    final clientHomeModel = ClientHomeModel(
      gender: state.gender,
      height: value,
      weight: state.weight,
      age: state.age,
    );

    state = clientHomeModel;
  }

  void incrementWeight() {
    final clientHomeModel = ClientHomeModel(
      gender: state.gender,
      height: state.height,
      weight: state.weight++,
      age: state.age,
    );

    state = clientHomeModel;
  }

  void decrementWeight() {
    final clientHomeModel = ClientHomeModel(
      gender: state.gender,
      height: state.height,
      weight: state.weight--,
      age: state.age,
    );

    state = clientHomeModel;
  }

  void incrementAge() {
    final clientHomeModel = ClientHomeModel(
      gender: state.gender,
      height: state.height,
      weight: state.weight,
      age: state.age++,
    );

    state = clientHomeModel;
  }

  void decrementAge() {
    final clientHomeModel = ClientHomeModel(
      gender: state.gender,
      height: state.height,
      weight: state.weight,
      age: state.age--,
    );

    state = clientHomeModel;
  }
}
