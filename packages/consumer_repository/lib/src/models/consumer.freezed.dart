// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Consumer _$ConsumerFromJson(Map<String, dynamic> json) {
  return _Consumer.fromJson(json);
}

/// @nodoc
mixin _$Consumer {
  String get authId => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get carName => throw _privateConstructorUsedError;
  bool get isDeletingAccount => throw _privateConstructorUsedError;
  ConsumerState get state => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsumerCopyWith<Consumer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumerCopyWith<$Res> {
  factory $ConsumerCopyWith(Consumer value, $Res Function(Consumer) then) =
      _$ConsumerCopyWithImpl<$Res, Consumer>;
  @useResult
  $Res call(
      {String authId,
      String firstName,
      String lastName,
      String carName,
      bool isDeletingAccount,
      ConsumerState state,
      String? email});
}

/// @nodoc
class _$ConsumerCopyWithImpl<$Res, $Val extends Consumer>
    implements $ConsumerCopyWith<$Res> {
  _$ConsumerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? carName = null,
    Object? isDeletingAccount = null,
    Object? state = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      authId: null == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      carName: null == carName
          ? _value.carName
          : carName // ignore: cast_nullable_to_non_nullable
              as String,
      isDeletingAccount: null == isDeletingAccount
          ? _value.isDeletingAccount
          : isDeletingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ConsumerState,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsumerImplCopyWith<$Res>
    implements $ConsumerCopyWith<$Res> {
  factory _$$ConsumerImplCopyWith(
          _$ConsumerImpl value, $Res Function(_$ConsumerImpl) then) =
      __$$ConsumerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String authId,
      String firstName,
      String lastName,
      String carName,
      bool isDeletingAccount,
      ConsumerState state,
      String? email});
}

/// @nodoc
class __$$ConsumerImplCopyWithImpl<$Res>
    extends _$ConsumerCopyWithImpl<$Res, _$ConsumerImpl>
    implements _$$ConsumerImplCopyWith<$Res> {
  __$$ConsumerImplCopyWithImpl(
      _$ConsumerImpl _value, $Res Function(_$ConsumerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? carName = null,
    Object? isDeletingAccount = null,
    Object? state = null,
    Object? email = freezed,
  }) {
    return _then(_$ConsumerImpl(
      authId: null == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      carName: null == carName
          ? _value.carName
          : carName // ignore: cast_nullable_to_non_nullable
              as String,
      isDeletingAccount: null == isDeletingAccount
          ? _value.isDeletingAccount
          : isDeletingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ConsumerState,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsumerImpl with DiagnosticableTreeMixin implements _Consumer {
  const _$ConsumerImpl(
      {required this.authId,
      required this.firstName,
      required this.lastName,
      required this.carName,
      required this.isDeletingAccount,
      required this.state,
      this.email});

  factory _$ConsumerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsumerImplFromJson(json);

  @override
  final String authId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String carName;
  @override
  final bool isDeletingAccount;
  @override
  final ConsumerState state;
  @override
  final String? email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Consumer(authId: $authId, firstName: $firstName, lastName: $lastName, carName: $carName, isDeletingAccount: $isDeletingAccount, state: $state, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Consumer'))
      ..add(DiagnosticsProperty('authId', authId))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('carName', carName))
      ..add(DiagnosticsProperty('isDeletingAccount', isDeletingAccount))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumerImpl &&
            (identical(other.authId, authId) || other.authId == authId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.carName, carName) || other.carName == carName) &&
            (identical(other.isDeletingAccount, isDeletingAccount) ||
                other.isDeletingAccount == isDeletingAccount) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, authId, firstName, lastName,
      carName, isDeletingAccount, state, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsumerImplCopyWith<_$ConsumerImpl> get copyWith =>
      __$$ConsumerImplCopyWithImpl<_$ConsumerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsumerImplToJson(
      this,
    );
  }
}

abstract class _Consumer implements Consumer {
  const factory _Consumer(
      {required final String authId,
      required final String firstName,
      required final String lastName,
      required final String carName,
      required final bool isDeletingAccount,
      required final ConsumerState state,
      final String? email}) = _$ConsumerImpl;

  factory _Consumer.fromJson(Map<String, dynamic> json) =
      _$ConsumerImpl.fromJson;

  @override
  String get authId;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get carName;
  @override
  bool get isDeletingAccount;
  @override
  ConsumerState get state;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$ConsumerImplCopyWith<_$ConsumerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
