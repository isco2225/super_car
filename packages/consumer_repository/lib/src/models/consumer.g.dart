// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsumerImpl _$$ConsumerImplFromJson(Map json) => _$ConsumerImpl(
      authId: json['authId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      carName: json['carName'] as String,
      isDeletingAccount: json['isDeletingAccount'] as bool,
      state: $enumDecode(_$ConsumerStateEnumMap, json['state']),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$ConsumerImplToJson(_$ConsumerImpl instance) =>
    <String, dynamic>{
      'authId': instance.authId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'carName': instance.carName,
      'isDeletingAccount': instance.isDeletingAccount,
      'state': _$ConsumerStateEnumMap[instance.state]!,
      'email': instance.email,
    };

const _$ConsumerStateEnumMap = {
  ConsumerState.empty: 'empty',
  ConsumerState.needRegister: 'needRegister',
  ConsumerState.hasData: 'hasData',
};
