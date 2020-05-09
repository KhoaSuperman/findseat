class SeatType {
  String name;
  double price;
  SEAT_TYPE type;

  SeatType(this.name, this.price, this.type);

  static List<SeatType> SAMPLE_DATA = [
    SeatType('King', 120.0, SEAT_TYPE.KING),
    SeatType('Queen', 100.0, SEAT_TYPE.QUEEN),
    SeatType('Jack', 80.0, SEAT_TYPE.JACK),
  ];
}

enum SEAT_TYPE { KING, QUEEN, JACK }
