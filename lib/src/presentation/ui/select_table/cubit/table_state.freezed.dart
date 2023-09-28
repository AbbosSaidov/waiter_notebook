// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TableState {
  List<HallResponseModel>? get halls => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TableStateCopyWith<TableState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableStateCopyWith<$Res> {
  factory $TableStateCopyWith(
          TableState value, $Res Function(TableState) then) =
      _$TableStateCopyWithImpl<$Res, TableState>;
  @useResult
  $Res call({List<HallResponseModel>? halls});
}

/// @nodoc
class _$TableStateCopyWithImpl<$Res, $Val extends TableState>
    implements $TableStateCopyWith<$Res> {
  _$TableStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? halls = freezed,
  }) {
    return _then(_value.copyWith(
      halls: freezed == halls
          ? _value.halls
          : halls // ignore: cast_nullable_to_non_nullable
              as List<HallResponseModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TableStateCopyWith<$Res>
    implements $TableStateCopyWith<$Res> {
  factory _$$_TableStateCopyWith(
          _$_TableState value, $Res Function(_$_TableState) then) =
      __$$_TableStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<HallResponseModel>? halls});
}

/// @nodoc
class __$$_TableStateCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$_TableState>
    implements _$$_TableStateCopyWith<$Res> {
  __$$_TableStateCopyWithImpl(
      _$_TableState _value, $Res Function(_$_TableState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? halls = freezed,
  }) {
    return _then(_$_TableState(
      halls: freezed == halls
          ? _value._halls
          : halls // ignore: cast_nullable_to_non_nullable
              as List<HallResponseModel>?,
    ));
  }
}

/// @nodoc

class _$_TableState implements _TableState {
  const _$_TableState({final List<HallResponseModel>? halls}) : _halls = halls;

  final List<HallResponseModel>? _halls;
  @override
  List<HallResponseModel>? get halls {
    final value = _halls;
    if (value == null) return null;
    if (_halls is EqualUnmodifiableListView) return _halls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TableState(halls: $halls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TableState &&
            const DeepCollectionEquality().equals(other._halls, _halls));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_halls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TableStateCopyWith<_$_TableState> get copyWith =>
      __$$_TableStateCopyWithImpl<_$_TableState>(this, _$identity);
}

abstract class _TableState implements TableState {
  const factory _TableState({final List<HallResponseModel>? halls}) =
      _$_TableState;

  @override
  List<HallResponseModel>? get halls;
  @override
  @JsonKey(ignore: true)
  _$$_TableStateCopyWith<_$_TableState> get copyWith =>
      throw _privateConstructorUsedError;
}
