// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PersonState {
  PersonStage get stage => throw _privateConstructorUsedError;
  int get numberOfPersons => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonStateCopyWith<PersonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonStateCopyWith<$Res> {
  factory $PersonStateCopyWith(
          PersonState value, $Res Function(PersonState) then) =
      _$PersonStateCopyWithImpl<$Res, PersonState>;
  @useResult
  $Res call({PersonStage stage, int numberOfPersons});
}

/// @nodoc
class _$PersonStateCopyWithImpl<$Res, $Val extends PersonState>
    implements $PersonStateCopyWith<$Res> {
  _$PersonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? numberOfPersons = null,
  }) {
    return _then(_value.copyWith(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as PersonStage,
      numberOfPersons: null == numberOfPersons
          ? _value.numberOfPersons
          : numberOfPersons // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonStateCopyWith<$Res>
    implements $PersonStateCopyWith<$Res> {
  factory _$$_PersonStateCopyWith(
          _$_PersonState value, $Res Function(_$_PersonState) then) =
      __$$_PersonStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PersonStage stage, int numberOfPersons});
}

/// @nodoc
class __$$_PersonStateCopyWithImpl<$Res>
    extends _$PersonStateCopyWithImpl<$Res, _$_PersonState>
    implements _$$_PersonStateCopyWith<$Res> {
  __$$_PersonStateCopyWithImpl(
      _$_PersonState _value, $Res Function(_$_PersonState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? numberOfPersons = null,
  }) {
    return _then(_$_PersonState(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as PersonStage,
      numberOfPersons: null == numberOfPersons
          ? _value.numberOfPersons
          : numberOfPersons // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PersonState implements _PersonState {
  const _$_PersonState(
      {this.stage = PersonStage.LOADED, this.numberOfPersons = 1});

  @override
  @JsonKey()
  final PersonStage stage;
  @override
  @JsonKey()
  final int numberOfPersons;

  @override
  String toString() {
    return 'PersonState(stage: $stage, numberOfPersons: $numberOfPersons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PersonState &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.numberOfPersons, numberOfPersons) ||
                other.numberOfPersons == numberOfPersons));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stage, numberOfPersons);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonStateCopyWith<_$_PersonState> get copyWith =>
      __$$_PersonStateCopyWithImpl<_$_PersonState>(this, _$identity);
}

abstract class _PersonState implements PersonState {
  const factory _PersonState(
      {final PersonStage stage, final int numberOfPersons}) = _$_PersonState;

  @override
  PersonStage get stage;
  @override
  int get numberOfPersons;
  @override
  @JsonKey(ignore: true)
  _$$_PersonStateCopyWith<_$_PersonState> get copyWith =>
      throw _privateConstructorUsedError;
}
