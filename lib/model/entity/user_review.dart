import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user_review.g.dart';

@JsonSerializable()
class UserReview extends Equatable {
  String author;
  int created;
  String content;
  String avatar;

  UserReview(this.author, this.created, this.content, this.avatar);

  @override
  List<Object> get props => [author, created, content, avatar];

  factory UserReview.fromJson(Map<String, dynamic> json) =>
      _$UserReviewFromJson(json);

  Map<String, dynamic> toJson() => _$UserReviewToJson(this);

  @override
  String toString() {
    return 'UserReview{author: $author, created: $created, content: $content, avatar: $avatar}';
  }
}
