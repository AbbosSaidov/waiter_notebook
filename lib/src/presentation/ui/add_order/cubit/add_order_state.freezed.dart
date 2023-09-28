// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddOrderState {
  int get stateOfStage => throw _privateConstructorUsedError;
  List<MenuResponseModel>? get menus => throw _privateConstructorUsedError;
  List<MenuResponseModel>? get orders => throw _privateConstructorUsedError;
  int? get currentCount => throw _privateConstructorUsedError;
  MenuResponseModel? get currentProduct => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddOrderStateCopyWith<AddOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOrderStateCopyWith<$Res> {
  factory $AddOrderStateCopyWith(
          AddOrderState value, $Res Function(AddOrderState) then) =
      _$AddOrderStateCopyWithImpl<$Res, AddOrderState>;
  @useResult
  $Res call(
      {int stateOfStage,
      List<MenuResponseModel>? menus,
      List<MenuResponseModel>? orders,
      int? currentCount,
      MenuResponseModel? currentProduct});
}

/// @nodoc
class _$AddOrderStateCopyWithImpl<$Res, $Val extends AddOrderState>
    implements $AddOrderStateCopyWith<$Res> {
  _$AddOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateOfStage = null,
    Object? menus = freezed,
    Object? orders = freezed,
    Object? currentCount = freezed,
    Object? currentProduct = freezed,
  }) {
    return _then(_value.copyWith(
      stateOfStage: null == stateOfStage
          ? _value.stateOfStage
          : stateOfStage // ignore: cast_nullable_to_non_nullable
              as int,
      menus: freezed == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuResponseModel>?,
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<MenuResponseModel>?,
      currentCount: freezed == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      currentProduct: freezed == currentProduct
          ? _value.currentProduct
          : currentProduct // ignore: cast_nullable_to_non_nullable
              as MenuResponseModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddOrderStateCopyWith<$Res>
    implements $AddOrderStateCopyWith<$Res> {
  factory _$$_AddOrderStateCopyWith(
          _$_AddOrderState value, $Res Function(_$_AddOrderState) then) =
      __$$_AddOrderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int stateOfStage,
      List<MenuResponseModel>? menus,
      List<MenuResponseModel>? orders,
      int? currentCount,
      MenuResponseModel? currentProduct});
}

/// @nodoc
class __$$_AddOrderStateCopyWithImpl<$Res>
    extends _$AddOrderStateCopyWithImpl<$Res, _$_AddOrderState>
    implements _$$_AddOrderStateCopyWith<$Res> {
  __$$_AddOrderStateCopyWithImpl(
      _$_AddOrderState _value, $Res Function(_$_AddOrderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateOfStage = null,
    Object? menus = freezed,
    Object? orders = freezed,
    Object? currentCount = freezed,
    Object? currentProduct = freezed,
  }) {
    return _then(_$_AddOrderState(
      stateOfStage: null == stateOfStage
          ? _value.stateOfStage
          : stateOfStage // ignore: cast_nullable_to_non_nullable
              as int,
      menus: freezed == menus
          ? _value._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuResponseModel>?,
      orders: freezed == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<MenuResponseModel>?,
      currentCount: freezed == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      currentProduct: freezed == currentProduct
          ? _value.currentProduct
          : currentProduct // ignore: cast_nullable_to_non_nullable
              as MenuResponseModel?,
    ));
  }
}

/// @nodoc

class _$_AddOrderState implements _AddOrderState {
  const _$_AddOrderState(
      {this.stateOfStage = 0,
      final List<MenuResponseModel>? menus,
      final List<MenuResponseModel>? orders = const [],
      this.currentCount = 0,
      this.currentProduct})
      : _menus = menus,
        _orders = orders;

  @override
  @JsonKey()
  final int stateOfStage;
  final List<MenuResponseModel>? _menus;
  @override
  List<MenuResponseModel>? get menus {
    final value = _menus;
    if (value == null) return null;
    if (_menus is EqualUnmodifiableListView) return _menus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MenuResponseModel>? _orders;
  @override
  @JsonKey()
  List<MenuResponseModel>? get orders {
    final value = _orders;
    if (value == null) return null;
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int? currentCount;
  @override
  final MenuResponseModel? currentProduct;

  @override
  String toString() {
    return 'AddOrderState(stateOfStage: $stateOfStage, menus: $menus, orders: $orders, currentCount: $currentCount, currentProduct: $currentProduct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddOrderState &&
            (identical(other.stateOfStage, stateOfStage) ||
                other.stateOfStage == stateOfStage) &&
            const DeepCollectionEquality().equals(other._menus, _menus) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.currentCount, currentCount) ||
                other.currentCount == currentCount) &&
            (identical(other.currentProduct, currentProduct) ||
                other.currentProduct == currentProduct));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stateOfStage,
      const DeepCollectionEquality().hash(_menus),
      const DeepCollectionEquality().hash(_orders),
      currentCount,
      currentProduct);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddOrderStateCopyWith<_$_AddOrderState> get copyWith =>
      __$$_AddOrderStateCopyWithImpl<_$_AddOrderState>(this, _$identity);
}

abstract class _AddOrderState implements AddOrderState {
  const factory _AddOrderState(
      {final int stateOfStage,
      final List<MenuResponseModel>? menus,
      final List<MenuResponseModel>? orders,
      final int? currentCount,
      final MenuResponseModel? currentProduct}) = _$_AddOrderState;

  @override
  int get stateOfStage;
  @override
  List<MenuResponseModel>? get menus;
  @override
  List<MenuResponseModel>? get orders;
  @override
  int? get currentCount;
  @override
  MenuResponseModel? get currentProduct;
  @override
  @JsonKey(ignore: true)
  _$$_AddOrderStateCopyWith<_$_AddOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}
