import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';

class PaymentMethodPickerScreen extends StatefulWidget {
  @override
  _PaymentMethodPickerScreenState createState() =>
      _PaymentMethodPickerScreenState();
}

class _PaymentMethodPickerScreenState extends State<PaymentMethodPickerScreen> {
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

  void _webPayment() {
    var onError = (error) {
      print('Error. ${error.toString()}');
    };

    StripePayment.createSourceWithParams(SourceParams(
      type: 'ideal',
      amount: 1099,
      currency: 'eur',
      returnURL: 'example://stripe-redirect',
    )).then((source) {
      print('Received ${source.sourceId}');
    }).catchError(onError);
  }

  void _cardForm() {
    var onError = (error) {
      print('Error. ${error.toString()}');
    };

    StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
        .then((paymentMethod) {
      _showDlgPaymentSuccess(
          'Payment successfully: Received type=${paymentMethod.type}, id=${paymentMethod.billingDetails.toJson()}');
    }).catchError(onError);
  }

  void _nativePayment() {
    var onError = (error) {
      print('Error. ${error.toString()}');
    };

    StripePayment.paymentRequestWithNativePay(
      androidPayOptions: AndroidPayPaymentRequest(
        total_price: "1.20",
        currency_code: "EUR",
      ),
      applePayOptions: ApplePayPaymentOptions(
        countryCode: 'DE',
        currencyCode: 'EUR',
        items: [
          ApplePayItem(
            label: 'Test',
            amount: '13',
          )
        ],
      ),
    ).then((token) {
      setState(() {
        print('Token: ${token.toJson()}');
      });
    }).catchError(onError);
  }

  Future<void> _showDlgPaymentSuccess(String msg) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Stripe SDK'),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
