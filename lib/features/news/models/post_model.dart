import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/features/profile/models/models.dart';

part 'post_model.freezed.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel({
    required int id,
    required String title,
    required String newsContent,
    required int likes,
    required bool isLiked,
    required UserModel author,
    required int viewCount,
    required String createdAt,
  }) = _PostModel;

  factory PostModel.fromJSON(Map<String, dynamic> json) => PostModel(
      id: json['id'],
      title: json['title'],
      newsContent: json['news_content'],
      likes: json['likes'],
      isLiked: json['is_liked'],
      author: UserModel.fromJson(json['author']),
      viewCount: json['view_count'],
      createdAt: json['created_at']);
}
