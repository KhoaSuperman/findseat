// ignore: slash_for_doc_comments
import 'viewmodel.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/**
    ItemGridSeatSlotVM
    --------ItemSeatRowVM
    ----------ItemSeatSlotVM
 */
class ItemGridSeatSlotVM extends Equatable {
  int maxColumn;
  String seatTypeName;

  List<ItemSeatRowVM> seatRowVMs;

  ItemGridSeatSlotVM({
    @required this.maxColumn,
    @required this.seatTypeName,
    @required this.seatRowVMs,
  });

  @override
  List<Object> get props => [maxColumn, seatTypeName, seatRowVMs];
}
