import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_state.freezed.dart';

@freezed
class PersonState with _$PersonState{
  const factory PersonState({
    @Default(PersonStage.LOADED) PersonStage stage,
    @Default(1) int numberOfPersons
}) = _PersonState;
}
enum PersonStage {
  LOADING,
  LOADED,
}