import 'package:find_seat/model/db/db.dart';
import 'package:find_seat/model/entity/ticket.dart';

class TicketDAO {
  static final TABLE_NAME = "my_ticket";

  static final COL_ID = "id";
  static final COL_SHOW_NAME = "show_name";
  static final COL_SHOW_BANNER = "show_banner";
  static final COL_SHOW_TIME_SLOT = "show_time_slot";
  static final COL_BOOK_TIME = "book_time";
  static final COL_CINE_NAME = "cine_name";
  static final COL_SEAT = "seat";

  static Future<int> insert(Ticket value) async {
    return await DbHelper.db.insert(TABLE_NAME, value.toJson());
  }

  static Future<List<Ticket>> getAll() async {
    var listMap =
        await DbHelper.db.query(TABLE_NAME, orderBy: '$COL_BOOK_TIME DESC');
    return listMap.map((jsonRaw) => Ticket.fromJson(jsonRaw)).toList();
  }
}
