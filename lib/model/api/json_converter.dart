import 'package:json_annotation/json_annotation.dart';

class StringAsDoubleConverter implements JsonConverter<double, Object> {
  const StringAsDoubleConverter();

  @override
  Object toJson(double object) {
    return object;
  }

  @override
  double fromJson(Object json) {
    if (json is String) {
      return double.parse(json);
    } else if (json is double) {
      return json;
    }

    throw Exception("Unable to parse $json to double");
  }
}
