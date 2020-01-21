import 'package:flutter/cupertino.dart';

class DistanceFilter {
  int from;
  int to;

  DistanceFilter({@required this.from, @required this.to});

  static List<DistanceFilter> SAMPLE_DATA = [
    DistanceFilter(from: 2, to: 5),
    DistanceFilter(from: 5, to: 8),
    DistanceFilter(from: 8, to: 16),
    DistanceFilter(from: 16, to: 24),
  ];
}
