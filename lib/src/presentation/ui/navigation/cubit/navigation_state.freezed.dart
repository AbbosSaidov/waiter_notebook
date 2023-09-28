// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationState {
  NavigationStage get stage => throw _privateConstructorUsedError;
  NavigationTabs get tabs => throw _privateConstructorUsedError;
  List<CategoryResponseModel>? get categories =>
      throw _privateConstructorUsedError;
  List<MenuResponseModel>? get menus => throw _privateConstructorUsedError;
  List<TableResponseModel>? get tables => throw _privateConstructorUsedError;
  List<HallResponseModel>? get halls => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationStateCopyWith<NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res, NavigationState>;
  @useResult
  $Res call(
      {NavigationStage stage,
      NavigationTabs tabs,
      List<CategoryResponseModel>? categories,
      List<MenuResponseModel>? menus,
      List<TableResponseModel>? tables,
      List<HallResponseModel>? halls});
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res, $Val extends NavigationState>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? tabs = null,
    Object? categories = freezed,
    Object? menus = freezed,
    Object? tables = freezed,
    Object? halls = freezed,
  }) {
    return _then(_value.copyWith(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as NavigationStage,
      tabs: null == tabs
          ? _value.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as NavigationTabs,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryResponseModel>?,
      menus: freezed == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuResponseModel>?,
      tables: freezed == tables
          ? _value.tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<TableResponseModel>?,
      halls: freezed == halls
          ? _value.halls
          : halls // ignore: cast_nullable_to_non_nullable
              as List<HallResponseModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NavigationStateCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$$_NavigationStateCopyWith(
          _$_NavigationState value, $Res Function(_$_NavigationState) then) =
      __$$_NavigationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NavigationStage stage,
      NavigationTabs tabs,
      List<CategoryResponseModel>? categories,
      List<MenuResponseModel>? menus,
      List<TableResponseModel>? tables,
      List<HallResponseModel>? halls});
}

/// @nodoc
class __$$_NavigationStateCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res, _$_NavigationState>
    implements _$$_NavigationStateCopyWith<$Res> {
  __$$_NavigationStateCopyWithImpl(
      _$_NavigationState _value, $Res Function(_$_NavigationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? tabs = null,
    Object? categories = freezed,
    Object? menus = freezed,
    Object? tables = freezed,
    Object? halls = freezed,
  }) {
    return _then(_$_NavigationState(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as NavigationStage,
      tabs: null == tabs
          ? _value.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as NavigationTabs,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryResponseModel>?,
      menus: freezed == menus
          ? _value._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuResponseModel>?,
      tables: freezed == tables
          ? _value._tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<TableResponseModel>?,
      halls: freezed == halls
          ? _value._halls
          : halls // ignore: cast_nullable_to_non_nullable
              as List<HallResponseModel>?,
    ));
  }
}

/// @nodoc

class _$_NavigationState implements _NavigationState {
  const _$_NavigationState(
      {this.stage = NavigationStage.LOADING,
      this.tabs = NavigationTabs.TABLE,
      final List<CategoryResponseModel>? categories,
      final List<MenuResponseModel>? menus,
      final List<TableResponseModel>? tables,
      final List<HallResponseModel>? halls})
      : _categories = categories,
        _menus = menus,
        _tables = tables,
        _halls = halls;

  @override
  @JsonKey()
  final NavigationStage stage;
  @override
  @JsonKey()
  final NavigationTabs tabs;
  final List<CategoryResponseModel>? _categories;
  @override
  List<CategoryResponseModel>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MenuResponseModel>? _menus;
  @override
  List<MenuResponseModel>? get menus {
    final value = _menus;
    if (value == null) return null;
    if (_menus is EqualUnmodifiableListView) return _menus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TableResponseModel>? _tables;
  @override
  List<TableResponseModel>? get tables {
    final value = _tables;
    if (value == null) return null;
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
    return 'NavigationState(stage: $stage, tabs: $tabs, categories: $categories, menus: $menus, tables: $tables, halls: $halls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavigationState &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.tabs, tabs) || other.tabs == tabs) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._menus, _menus) &&
            const DeepCollectionEquality().equals(other._tables, _tables) &&
            const DeepCollectionEquality().equals(other._halls, _halls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stage,
      tabs,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_menus),
      const DeepCollectionEquality().hash(_tables),
      const DeepCollectionEquality().hash(_halls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NavigationStateCopyWith<_$_NavigationState> get copyWith =>
      __$$_NavigationStateCopyWithImpl<_$_NavigationState>(this, _$identity);
}

abstract class _NavigationState implements NavigationState {
  const factory _NavigationState(
      {final NavigationStage stage,
      final NavigationTabs tabs,
      final List<CategoryResponseModel>? categories,
      final List<MenuResponseModel>? menus,
      final List<TableResponseModel>? tables,
      final List<HallResponseModel>? halls}) = _$_NavigationState;

  @override
  NavigationStage get stage;
  @override
  NavigationTabs get tabs;
  @override
  List<CategoryResponseModel>? get categories;
  @override
  List<MenuResponseModel>? get menus;
  @override
  List<TableResponseModel>? get tables;
  @override
  List<HallResponseModel>? get halls;
  @override
  @JsonKey(ignore: true)
  _$$_NavigationStateCopyWith<_$_NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}
