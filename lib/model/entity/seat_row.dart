import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'seat_row.g.dart';

@JsonSerializable()
class SeatRow extends Equatable {
  //A, B, C, ...
  @JsonKey(name: "id")
  String rowId;
  int count;
  List<int> offs = [];
  List<int> booked = [];

  SeatRow({
    required this.rowId,
    required this.count,
    required this.offs,
    required this.booked,
  });

  factory SeatRow.fromJson(Map<String, dynamic> json) =>
      _$SeatRowFromJson(json);

  Map<String, dynamic> toJson() => _$SeatRowToJson(this);

  @override
  List<Object> get props => [rowId];

  @override
  String toString() {
    return 'SeatRow{rowId: $rowId}';
  }

  static final List<SeatRow> SAMPLE_KING = [
    SeatRow(
      rowId: 'I',
      count: 11,
      offs: [4, 5],
      booked: [],
    ),
    SeatRow(
      rowId: 'J',
      count: 11,
      offs: [],
      booked: [],
    ),
  ];

  static final List<SeatRow> SAMPLE_QUEEN = [
    SeatRow(
      rowId: 'F',
      count: 11,
      offs: [4, 5],
      booked: [1, 2, 3],
    ),
    SeatRow(
      rowId: 'G',
      count: 11,
      offs: [4, 5],
      booked: [6, 7, 8],
    ),
    SeatRow(
      rowId: 'H',
      count: 11,
      offs: [],
      booked: [0, 1, 4, 5, 9, 10],
    ),
  ];

  static final List<SeatRow> SAMPLE_JACK = [
    SeatRow(
      rowId: 'A',
      count: 11,
      offs: [4, 5],
      booked: [0, 1, 2, 3],
    ),
    SeatRow(
      rowId: 'B',
      count: 11,
      offs: [4, 5],
      booked: [1, 2, 6, 7],
    ),
    SeatRow(
      rowId: 'C',
      count: 11,
      offs: [4, 5],
      booked: [9, 10],
    ),
    SeatRow(
      rowId: 'D',
      count: 11,
      offs: [4, 5],
      booked: [9, 10],
    ),
    SeatRow(
      rowId: 'E',
      count: 11,
      offs: [],
      booked: [2, 3, 4, 5, 6, 7],
    )
  ];
}
