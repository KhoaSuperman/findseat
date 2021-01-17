import 'package:find_seat/model/db/db.dart';
import 'package:find_seat/model/entity/my_ticket.dart';

class MyTicketDAO {
  static final TABLE_NAME = "my_ticket";

  static final COL_ID = "id";
  static final COL_SHOW_NAME = "show_name";
  static final COL_BOOK_TIME = "book_time";
  static final COL_CINE_NAME = "cine_name";
  static final COL_SEAT = "seat";

  static Future<int> insert(MyTicket value) async {
    return await DbHelper.db.insert(TABLE_NAME, value.toJson());
  }

  static Future<List<MyTicket>> getAll() async {
    var listMap = await DbHelper.db.query(TABLE_NAME);
    return listMap.map((jsonRaw) => MyTicket.fromJson(jsonRaw)).toList();
  }
}
