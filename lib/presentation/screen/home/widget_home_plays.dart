import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetHomePlays extends StatelessWidget {
  List<ItemPosterVM> items = [
    ItemPosterVM('images/plays/812d7444e0fb6ea5812bcf742b560154@2x.png',
        'Alex in wonderland', 'Comedy show'),
    ItemPosterVM('images/plays/74566f854eae1f75d59cdc0cb3d0cac5@2x.png',
        'Marry poppins puffet show', 'Music show'),
    ItemPosterVM('images/plays/e8dc1b71871655544d883871a9b12da1@2x.png',
        'Patrimandram special dewali', 'Dibet show'),
    ItemPosterVM('images/plays/345894e2fcd63efef45e132be5cb99eb@2x.png',
        'Happy Halloween 2K19', 'Music show'),
  ];

  @override
  Widget build(BuildContext context) {
    return WidgetHomePosters(
      items: items,
      label: 'Plays',
      iconPath: 'assets/ic_plays.svg',
    );
  }
}
