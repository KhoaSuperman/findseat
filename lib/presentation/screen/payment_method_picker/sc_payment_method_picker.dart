import 'package:find_seat/model/entity/book_time_slot.dart';
import 'package:find_seat/model/entity/show.dart';
import 'package:find_seat/model/entity/time_slot.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router.dart';
import 'bloc/bloc.dart';

class PaymentMethodPickerScreen extends StatefulWidget {
  List<String> selectedSeatIds;
  double totalPrice;
  Show show;
  TimeSlot selectedTimeSlot;
  BookTimeSlot bookTimeSlot;

  PaymentMethodPickerScreen(
    this.selectedSeatIds,
    this.totalPrice,
    this.show,
    this.selectedTimeSlot,
    this.bookTimeSlot,
  );

  @override
  _PaymentMethodPickerScreenState createState() =>
      _PaymentMethodPickerScreenState();
}

class _PaymentMethodPickerScreenState extends State<PaymentMethodPickerScreen> {
  late BuildContext blocContext;

  @override
  void initState() {
    super.initState();

    StripePayment.setOptions(StripeOptions(
        publishableKey: "pk_test_ZeDmYBSVOpxm7bwr7rNvOz8v",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentMethodPickerBloc>(
      create: (context) => PaymentMethodPickerBloc(
        RepositoryProvider.of<TicketRepo>(context),
      )..add(OpenScreenPaymentMethodPickerEvent()),
      child: BlocConsumer<PaymentMethodPickerBloc, PaymentMethodPickerState>(
        listener: (context, state) {
          //
        },
        builder: (context, state) {
          blocContext = context;
          return _buildContent();
        },
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      color: COLOR_CONST.WHITE,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var iconPath = '';
          var name = '';
          switch (index) {
            case 0:
              iconPath = 'assets/icon_visa.svg';
              name = 'Debit / Credit card';
              break;
            case 1:
              iconPath = 'assets/icon_upi.png';
              name = 'UDI';
              break;
            case 2:
              iconPath = 'assets/icon_netbanking.svg';
              name = 'Net banking';
              break;
          }

          return GestureDetector(
            onTap: () {
              _handleMethodClick(index);
            },
            child: Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  index != 1
                      ? MySvgImage(
                          height: 40,
                          width: 40,
                          path: iconPath,
                          applyColorFilter: false,
                        )
                      : Image.asset(
                          iconPath,
                          width: 40,
                          height: 40,
                        ),
                  WidgetSpacer(width: 14),
                  Text(name, style: FONT_CONST.REGULAR_GRAY4_14),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 3,
      ),
    );
  }

  void _handleMethodClick(int index) {
    _cardForm();
  }

  PaymentMethodPickerBloc get bloc =>
      BlocProvider.of<PaymentMethodPickerBloc>(blocContext);

  void _cardForm() {
    var onError = (error) {
      print('Error. ${error.toString()}');
    };

    StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(
        prefilledInformation: PrefilledInformation(),
      ),
    ).then((paymentMethod) {
      //for saving ticket to local db
      bloc.add(OnPaymentSuccessEvent(
        widget.show.name,
        widget.show.thumb,
        widget.selectedSeatIds,
        widget.selectedTimeSlot,
        widget.bookTimeSlot.cine.name,
      ));

      String ticketInfo = "${widget.show.name}\n"
          "Items: ${widget.selectedSeatIds.length}\n"
          "Seat: ${widget.selectedSeatIds.join(", ")}\n"
          "Time: ${widget.selectedTimeSlot.time}\n"
          "Cinema: ${widget.bookTimeSlot.cine.name}";

      _showDlgPaymentSuccess(ticketInfo);
    }).catchError(onError);
  }

  Future<void> _showDlgPaymentSuccess(String msg) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment success by Stripe'),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context)
                    .popUntil(ModalRoute.withName(AppRouter.HOME));
              },
            ),
          ],
        );
      },
    );
  }
}
