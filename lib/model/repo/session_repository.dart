import 'dart:convert';

import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/local/pref.dart';
import 'package:meta/meta.dart';

class SessionRepository {
  Pref pref;

  SessionRepository({@required this.pref});

  Future<bool> cacheBookTimeSlot(BookTimeSlot bookTimeSlot) {
    return pref.saveString(
        DATA_CONST.CACHE_BOOK_TIME_SLOT, json.encode(bookTimeSlot.toJson()));
  }

  Future<bool> cacheShow(Show show) {
    return pref.saveString(DATA_CONST.CACHE_SHOW, json.encode(show.toJson()));
  }

  Future<bool> cacheSelectedTimeSlot(TimeSlot timeSlot) {
    return pref.saveString(
        DATA_CONST.CACHE_SELECTED_TIME_SLOT, json.encode(timeSlot.toJson()));
  }

  Future<bool> cacheOtherTimeSlots(List<TimeSlot> timeSlots) {
    return pref.saveString(
        DATA_CONST.CACHE_OTHER_TIME_SLOT, jsonEncode(timeSlots));
  }

  Future<BookTimeSlot> getBookTimeSlot() async {
    String jsonData = await pref.getString(DATA_CONST.CACHE_BOOK_TIME_SLOT);
    return BookTimeSlot.fromJson(json.decode(jsonData));
  }

  Future<Show> getShow() async {
    String jsonData = await pref.getString(DATA_CONST.CACHE_SHOW);
    return Show.fromJson(json.decode(jsonData));
  }

  Future<TimeSlot> getSelectedTimeSlot() async {
    String jsonData = await pref.getString(DATA_CONST.CACHE_SELECTED_TIME_SLOT);
    return TimeSlot.fromJson(json.decode(jsonData));
  }

  Future<List<TimeSlot>> getOtherTimeSlots() async {
    String jsonData = await pref.getString(DATA_CONST.CACHE_OTHER_TIME_SLOT);

    return (json.decode(jsonData) as List)
        .map((i) => TimeSlot.fromJson(i))
        .toList();
  }
}
