import 'dart:developer';

import 'package:find_seat/model/db/db.dart';
import 'package:find_seat/model/entity/my_ticket.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database _db;

  static _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE "${MyTicketDAO.TABLE_NAME}" ( "${MyTicketDAO.COL_ID}" INTEGER PRIMARY KEY AUTOINCREMENT, "${MyTicketDAO.COL_SHOW_NAME}" TEXT, "${MyTicketDAO.COL_BOOK_TIME}" INTEGER, "${MyTicketDAO.COL_CINE_NAME}" TEXT, "${MyTicketDAO.COL_SEAT}" TEXT );');

    log('_onCreate. version $version');
  }

  static Future init() async {
    Sqflite.devSetDebugModeOn(true);

    _db = await openDatabase(
      'findseat.db',
      version: 1,
      singleInstance: true,
      onCreate: _onCreate,
    );

//    await MyTicketDAO.insert(MyTicket(
//      0,
//      'King Kong',
//      DateTime.now().millisecondsSinceEpoch,
//      'BHD Star Cineplex',
//      'G4;G9;G12',
//    ));

    var result = await MyTicketDAO.getAll();
    log(result.toString());
  }

  static Database get db => _db;
}
