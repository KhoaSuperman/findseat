import 'package:find_seat/utils/my_const/FONT_CONST.dart';
import 'package:flutter/material.dart';

import '../../router.dart';

class WidgetBottomSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Text(
              'Don\'t have an account ?',
              style: FONT_CONST.REGULAR_WHITE_10,
            ),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.REGISTER);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  'Sign up',
                  style: FONT_CONST.SEMIBOLD_WHITE_10.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Text('Here', style: FONT_CONST.SEMIBOLD_WHITE_10),
          ),
        ],
      ),
    );
  }
}
