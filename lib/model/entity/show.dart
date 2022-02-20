import 'package:find_seat/model/entity/cast.dart';
import 'package:find_seat/model/entity/offer.dart';
import 'package:find_seat/model/entity/user_review.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'show.g.dart';

@JsonSerializable()
class Show extends Equatable {
  late String id;
  late String name;
  late String thumb;
  late String cover;
  late String trailer;

  @JsonKey(name: "release_date")
  late int releaseDate;

  late int rate;
  late String votes;
  late List<String> tami;
  late List<String> tags;
  late int duration;
  late List<Offer> offers;

  @JsonKey(name: "total_reviews")
  late int totalReviews;

  @JsonKey(name: "latest_reviews")
  late UserReview latestReviews;

  late List<Cast> casts;

  Show();

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);

  Map<String, dynamic> toJson() => _$ShowToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        thumb,
        cover,
        trailer,
        releaseDate,
        rate,
        votes,
        tags,
        duration,
        offers,
        totalReviews,
        latestReviews,
        casts
      ];

  @override
  String toString() {
    return 'Show{id: $id, name: $name, thumb: $thumb, cover: $cover, releaseDate: $releaseDate, trailer: $trailer, rate: $rate, votes: $votes, tags: $tags, duration: $duration, offers: $offers, totalReviews: $totalReviews, latestReviews: $latestReviews, casts: $casts}';
  }
}
