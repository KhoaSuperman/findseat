
import 'package:json_annotation/json_annotation.dart';

part 'cine.g.dart';

@JsonSerializable()
class Cine {
  String id;
  String name;
  String address;
  int rating;
  double distance;
  String photo;
  double lat;
  double lng;

  Cine(this.id, this.name, this.address, this.rating, this.distance, this.photo,
      this.lat, this.lng);

  factory Cine.fromJson(Map<String, dynamic> json) =>
      _$CineFromJson(json);

  Map<String, dynamic> toJson() => _$CineToJson(this);


  @override
  String toString() {
    return 'Cine{id: $id, name: $name, address: $address, rating: $rating, distance: $distance, photo: $photo, lat: $lat, lng: $lng}';
  }

  static List<Cine> SAMPLE_DATA = [
    Cine(
      'Arasan Cinemas A/C 2K Dolby',
      'Arasan Cinemas A/C 2K Dolby',
      'Coimbatore',
      5,
      3.4,
      'images/cines/cine1.png',
      21.013430,
      105.846958,
    ),
    Cine(
      'Karpagam theatres - 4K',
      'Karpagam theatres - 4K',
      'Coimbatore',
      5,
      4.4,
      'images/cines/cine2.png',
      21.024489,
      105.827874,
    ),
    Cine(
      'KG theatres - 4K',
      'KG theatres - 4K',
      'Coimbatore',
      4,
      2.1,
      'images/cines/cine3.png',
      21.026288,
      105.817662,
    ),
    Cine(
      'BHD Pham Ngoc Thach',
      'BHD Pham Ngoc Thach',
      'Ha Noi',
      5,
      6.4,
      'images/cines/cine1.png',
      21.0064286,
      105.8298065,
    ),
    Cine(
      'BHD Cau Giay',
      'BHD Cau Giay',
      'Ha Noi',
      4,
      7.8,
      'images/cines/cine1.png',
      21.0354272,
      105.7922287,
    ),
    Cine(
      'CGV Ba Trieu',
      'CGV Ba Trieu',
      'Ha Noi',
      5,
      9.7,
      'images/cines/cine3.png',
      21.011773,
      105.8474953,
    ),
    Cine(
      'CGV Royal City',
      'CGV Royal City',
      'Ha Noi',
      5,
      12.6,
      'images/cines/cine3.png',
      21.0030263,
      105.8132952,
    ),
  ];
}
