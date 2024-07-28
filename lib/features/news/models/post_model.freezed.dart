// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostModel {
  int get id => throw _privateConstructorUsedError;
  String get postImage => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get newsContent => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  UserModel get author => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res, PostModel>;
  @useResult
  $Res call(
      {int id,
      String postImage,
      String title,
      String newsContent,
      int likes,
      bool isLiked,
      UserModel author,
      int viewCount,
      String createdAt});

  $UserModelCopyWith<$Res> get author;
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res, $Val extends PostModel>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postImage = null,
    Object? title = null,
    Object? newsContent = null,
    Object? likes = null,
    Object? isLiked = null,
    Object? author = null,
    Object? viewCount = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      postImage: null == postImage
          ? _value.postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      newsContent: null == newsContent
          ? _value.newsContent
          : newsContent // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as UserModel,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get author {
    return $UserModelCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostModelImplCopyWith<$Res>
    implements $PostModelCopyWith<$Res> {
  factory _$$PostModelImplCopyWith(
          _$PostModelImpl value, $Res Function(_$PostModelImpl) then) =
      __$$PostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String postImage,
      String title,
      String newsContent,
      int likes,
      bool isLiked,
      UserModel author,
      int viewCount,
      String createdAt});

  @override
  $UserModelCopyWith<$Res> get author;
}

/// @nodoc
class __$$PostModelImplCopyWithImpl<$Res>
    extends _$PostModelCopyWithImpl<$Res, _$PostModelImpl>
    implements _$$PostModelImplCopyWith<$Res> {
  __$$PostModelImplCopyWithImpl(
      _$PostModelImpl _value, $Res Function(_$PostModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postImage = null,
    Object? title = null,
    Object? newsContent = null,
    Object? likes = null,
    Object? isLiked = null,
    Object? author = null,
    Object? viewCount = null,
    Object? createdAt = null,
  }) {
    return _then(_$PostModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      postImage: null == postImage
          ? _value.postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      newsContent: null == newsContent
          ? _value.newsContent
          : newsContent // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as UserModel,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PostModelImpl implements _PostModel {
  _$PostModelImpl(
      {required this.id,
      required this.postImage,
      required this.title,
      required this.newsContent,
      required this.likes,
      required this.isLiked,
      required this.author,
      required this.viewCount,
      required this.createdAt});

  @override
  final int id;
  @override
  final String postImage;
  @override
  final String title;
  @override
  final String newsContent;
  @override
  final int likes;
  @override
  final bool isLiked;
  @override
  final UserModel author;
  @override
  final int viewCount;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'PostModel(id: $id, postImage: $postImage, title: $title, newsContent: $newsContent, likes: $likes, isLiked: $isLiked, author: $author, viewCount: $viewCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postImage, postImage) ||
                other.postImage == postImage) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.newsContent, newsContent) ||
                other.newsContent == newsContent) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, postImage, title,
      newsContent, likes, isLiked, author, viewCount, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostModelImplCopyWith<_$PostModelImpl> get copyWith =>
      __$$PostModelImplCopyWithImpl<_$PostModelImpl>(this, _$identity);
}

abstract class _PostModel implements PostModel {
  factory _PostModel(
      {required final int id,
      required final String postImage,
      required final String title,
      required final String newsContent,
      required final int likes,
      required final bool isLiked,
      required final UserModel author,
      required final int viewCount,
      required final String createdAt}) = _$PostModelImpl;

  @override
  int get id;
  @override
  String get postImage;
  @override
  String get title;
  @override
  String get newsContent;
  @override
  int get likes;
  @override
  bool get isLiked;
  @override
  UserModel get author;
  @override
  int get viewCount;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PostModelImplCopyWith<_$PostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
