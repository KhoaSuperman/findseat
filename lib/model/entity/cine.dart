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

  Cine(
      {this.id,
      this.name,
      this.address,
      this.rating,
      this.distance,
      this.photo,
      this.lat,
      this.lng});

  factory Cine.fromJson(Map<String, dynamic> json) => _$CineFromJson(json);

  Map<String, dynamic> toJson() => _$CineToJson(this);

  @override
  String toString() {
    return 'Cine{id: $id, name: $name, address: $address, rating: $rating, distance: $distance, photo: $photo, lat: $lat, lng: $lng}';
  }

  static List<Cine> SAMPLE_DATA = [
    Cine(
      id: 'Arasan Cinemas A/C 2K Dolby',
      name: 'Arasan Cinemas A/C 2K Dolby',
      address: 'Coimbatore',
      rating: 5,
      distance: 3.4,
      photo: 'images/cines/cine1.png',
      lat: 21.013430,
      lng: 105.846958,
    ),
    Cine(
      id: 'Karpagam theatres - 4K',
      name: 'Karpagam theatres - 4K',
      address: 'Coimbatore',
      rating: 5,
      distance: 4.4,
      photo: 'images/cines/cine2.png',
      lat: 21.024489,
      lng: 105.827874,
    ),
    Cine(
      id: 'KG theatres - 4K',
      name: 'KG theatres - 4K',
      address: 'Coimbatore',
      rating: 4,
      distance: 2.1,
      photo: 'images/cines/cine3.png',
      lat: 21.026288,
      lng: 105.817662,
    ),
    Cine(
      id: 'BHD Pham Ngoc Thach',
      name: 'BHD Pham Ngoc Thach',
      address: 'Ha Noi',
      rating: 5,
      distance: 6.4,
      photo: 'images/cines/cine1.png',
      lat: 21.0064286,
      lng: 105.8298065,
    ),
    Cine(
      id: 'BHD Cau Giay',
      name: 'BHD Cau Giay',
      address: 'Ha Noi',
      rating: 4,
      distance: 7.8,
      photo: 'images/cines/cine1.png',
      lat: 21.0354272,
      lng: 105.7922287,
    ),
    Cine(
      id: 'CGV Ba Trieu',
      name: 'CGV Ba Trieu',
      address: 'Ha Noi',
      rating: 5,
      distance: 9.7,
      photo: 'images/cines/cine3.png',
      lat: 21.011773,
      lng: 105.8474953,
    ),
    Cine(
      id: 'CGV Royal City',
      name: 'CGV Royal City',
      address: 'Ha Noi',
      rating: 5,
      distance: 12.6,
      photo: 'images/cines/cine3.png',
      lat: 21.0030263,
      lng: 105.8132952,
    ),
  ];
}
