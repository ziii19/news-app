// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      image: json['image'] as String?,
      username: json['username'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'image': instance.image,
      'username': instance.username,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };
