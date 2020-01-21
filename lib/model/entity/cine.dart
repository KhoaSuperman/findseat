class Cine {
  String name;
  String address;
  int rating;
  double distance;
  String photo;

  Cine(this.name, this.address, this.rating, this.distance, this.photo);

  static List<Cine> SAMPLE_DATA = [
    Cine(
      'Arasan Cinemas A/C 2K Dolby',
      'Coimbatore',
      5,
      3.4,
      'images/cines/cine1.png',
    ),
    Cine(
      'Karpagam theatres - 4K',
      'Coimbatore',
      5,
      4.4,
      'images/cines/cine2.png',
    ),
    Cine(
      'KG theatres - 4K',
      'Coimbatore',
      4,
      2.1,
      'images/cines/cine3.png',
    ),
    Cine(
      'BHD Pham Ngoc Thach',
      'Ha Noi',
      5,
      6.4,
      'images/cines/cine1.png',
    ),
    Cine(
      'BHD Cau Giay',
      'Ha Noi',
      4,
      7.8,
      'images/cines/cine1.png',
    ),
    Cine(
      'CGV Ba Trieu',
      'Ha Noi',
      5,
      9.7,
      'images/cines/cine3.png',
    ),
    Cine(
      'CGV Royal City',
      'Ha Noi',
      5,
      12.6,
      'images/cines/cine3.png',
    ),
  ];
}
