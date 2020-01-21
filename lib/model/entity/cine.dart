class Cine {
  String name;
  String address;
  int rating;
  double distance;
  String photo;
  double lat;
  double lng;

  Cine(this.name, this.address, this.rating, this.distance, this.photo,
      this.lat, this.lng);

  static List<Cine> SAMPLE_DATA = [
    Cine(
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
      'Coimbatore',
      5,
      4.4,
      'images/cines/cine2.png',
      21.024489,
      105.827874,
    ),
    Cine(
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
      'Ha Noi',
      5,
      6.4,
      'images/cines/cine1.png',
      21.0064286,
      105.8298065,
    ),
    Cine(
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
      'Ha Noi',
      5,
      9.7,
      'images/cines/cine3.png',
      21.011773,
      105.8474953,
    ),
    Cine(
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
