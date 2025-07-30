// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initial_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InitialEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String lang) changeLang,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String lang)? changeLang,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String lang)? changeLang,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeLang value) changeLang,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeLang value)? changeLang,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLang value)? changeLang,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitialEventCopyWith<$Res> {
  factory $InitialEventCopyWith(
          InitialEvent value, $Res Function(InitialEvent) then) =
      _$InitialEventCopyWithImpl<$Res, InitialEvent>;
}

/// @nodoc
class _$InitialEventCopyWithImpl<$Res, $Val extends InitialEvent>
    implements $InitialEventCopyWith<$Res> {
  _$InitialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitialEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$InitialEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitialEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'InitialEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String lang) changeLang,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String lang)? changeLang,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String lang)? changeLang,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeLang value) changeLang,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeLang value)? changeLang,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLang value)? changeLang,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements InitialEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ChangeLangImplCopyWith<$Res> {
  factory _$$ChangeLangImplCopyWith(
          _$ChangeLangImpl value, $Res Function(_$ChangeLangImpl) then) =
      __$$ChangeLangImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String lang});
}

/// @nodoc
class __$$ChangeLangImplCopyWithImpl<$Res>
    extends _$InitialEventCopyWithImpl<$Res, _$ChangeLangImpl>
    implements _$$ChangeLangImplCopyWith<$Res> {
  __$$ChangeLangImplCopyWithImpl(
      _$ChangeLangImpl _value, $Res Function(_$ChangeLangImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitialEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = null,
  }) {
    return _then(_$ChangeLangImpl(
      null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeLangImpl implements _ChangeLang {
  const _$ChangeLangImpl(this.lang);

  @override
  final String lang;

  @override
  String toString() {
    return 'InitialEvent.changeLang(lang: $lang)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeLangImpl &&
            (identical(other.lang, lang) || other.lang == lang));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lang);

  /// Create a copy of InitialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeLangImplCopyWith<_$ChangeLangImpl> get copyWith =>
      __$$ChangeLangImplCopyWithImpl<_$ChangeLangImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String lang) changeLang,
  }) {
    return changeLang(lang);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String lang)? changeLang,
  }) {
    return changeLang?.call(lang);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String lang)? changeLang,
    required TResult orElse(),
  }) {
    if (changeLang != null) {
      return changeLang(lang);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeLang value) changeLang,
  }) {
    return changeLang(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeLang value)? changeLang,
  }) {
    return changeLang?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLang value)? changeLang,
    required TResult orElse(),
  }) {
    if (changeLang != null) {
      return changeLang(this);
    }
    return orElse();
  }
}

abstract class _ChangeLang implements InitialEvent {
  const factory _ChangeLang(final String lang) = _$ChangeLangImpl;

  String get lang;

  /// Create a copy of InitialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeLangImplCopyWith<_$ChangeLangImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InitialState {
  String get currentLang => throw _privateConstructorUsedError;

  /// Create a copy of InitialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InitialStateCopyWith<InitialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitialStateCopyWith<$Res> {
  factory $InitialStateCopyWith(
          InitialState value, $Res Function(InitialState) then) =
      _$InitialStateCopyWithImpl<$Res, InitialState>;
  @useResult
  $Res call({String currentLang});
}

/// @nodoc
class _$InitialStateCopyWithImpl<$Res, $Val extends InitialState>
    implements $InitialStateCopyWith<$Res> {
  _$InitialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLang = null,
  }) {
    return _then(_value.copyWith(
      currentLang: null == currentLang
          ? _value.currentLang
          : currentLang // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<$Res>
    implements $InitialStateCopyWith<$Res> {
  factory _$$InitialStateImplCopyWith(
          _$InitialStateImpl value, $Res Function(_$InitialStateImpl) then) =
      __$$InitialStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentLang});
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<$Res>
    extends _$InitialStateCopyWithImpl<$Res, _$InitialStateImpl>
    implements _$$InitialStateImplCopyWith<$Res> {
  __$$InitialStateImplCopyWithImpl(
      _$InitialStateImpl _value, $Res Function(_$InitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLang = null,
  }) {
    return _then(_$InitialStateImpl(
      currentLang: null == currentLang
          ? _value.currentLang
          : currentLang // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitialStateImpl implements _InitialState {
  const _$InitialStateImpl({this.currentLang = "ru"});

  @override
  @JsonKey()
  final String currentLang;

  @override
  String toString() {
    return 'InitialState(currentLang: $currentLang)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialStateImpl &&
            (identical(other.currentLang, currentLang) ||
                other.currentLang == currentLang));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentLang);

  /// Create a copy of InitialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialStateImplCopyWith<_$InitialStateImpl> get copyWith =>
      __$$InitialStateImplCopyWithImpl<_$InitialStateImpl>(this, _$identity);
}

abstract class _InitialState implements InitialState {
  const factory _InitialState({final String currentLang}) = _$InitialStateImpl;

  @override
  String get currentLang;

  /// Create a copy of InitialState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialStateImplCopyWith<_$InitialStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
