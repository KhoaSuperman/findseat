import 'package:find_seat/model/entity/cast.dart';
import 'package:find_seat/model/entity/offer.dart';
import 'package:find_seat/model/entity/user_review.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'show.g.dart';

@JsonSerializable()
class Show extends Equatable {
  String id;
  String name;
  String thumb;
  String cover;
  String trailer;
  @JsonKey(name: "release_date")
  int releaseDate;
  int rate;
  String votes;
  List<String> tami;
  List<String> tags;
  int duration;
  List<Offer> offers;
  @JsonKey(name: "total_reviews")
  int totalReviews;
  @JsonKey(name: "latest_reviews")
  UserReview latestReviews;
  List<Cast> casts;

  Show(
      this.id,
      this.name,
      this.thumb,
      this.cover,
      this.trailer,
      this.releaseDate,
      this.rate,
      this.votes,
      this.tags,
      this.duration,
      this.offers,
      this.totalReviews,
      this.latestReviews,
      this.casts);

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
