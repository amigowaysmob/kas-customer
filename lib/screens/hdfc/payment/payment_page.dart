import 'dart:convert';
import 'dart:io';


import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hypersdkflutter/hypersdkflutter.dart';
import 'package:kasnew/response_model/jus_payment_model.dart';




@RoutePage<JusPayPaymentModel>()
class PaymentPageScreen extends StatefulWidget {
  final HyperSDK hyperSDK;
  final dynamic payload;
  const PaymentPageScreen(
      {Key? key, required this.hyperSDK, required this.payload})
      : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState(payload?.toJson());
}

class _PaymentPageState extends State<PaymentPageScreen> {
  var showLoader = true;
  var processCalled = false;
  var paymentSuccess = false;
  var paymentFailed = false;
  var payload;
  _PaymentPageState(this.payload);

  @override
  Widget build(BuildContext context) {
    if (!processCalled) {
      startPayment(payload);
    }
//block:start:onBackPress
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          var backpressResult = await widget.hyperSDK.onBackPress();

          if (backpressResult.toLowerCase() == "true") {
            return false;
          } else {
            return true;
          }
        } else {
          return true;
        }
      },
//block:end:onBackPress
      child: Container(
        color: Colors.white,
        child: Center(
          child: showLoader ? const CircularProgressIndicator() : Container(),
        ),
      ),
    );
  }

  // block:start:startPayment
  void startPayment(payload) async {
    processCalled = true;

    if (payload != null) {
      // block:start:openPaymentPage
      widget.hyperSDK.openPaymentPage(payload, hyperSDKCallbackHandler);
      // block:end:openPaymentPage
    } else {
      throw Exception('Paymen Failed');
    }
  }
  // block:end:startPayment

  // block:start:create-hyper-callback
  void hyperSDKCallbackHandler(MethodCall methodCall) {
    switch (methodCall.method) {
      case "hide_loader":
        setState(() {
          showLoader = false;
        });
        break;
      case "process_result":
        var args = {};

        try {
          args = json.decode(methodCall.arguments);
        } catch (e) {
          print(e);
        }
        var innerPayload = args["payload"] ?? {};
        String status = innerPayload["status"] ?? " ";
        var orderId = args['orderId'];

        switch (status) {
          case "backpressed":
          case "user_aborted":
            {
              context.router.maybePop(
                  JusPayPaymentModel(paymentSuccess: false, orderId: orderId));
            }
            break;
          default:
            var isPaymentSuccess = status.toLowerCase() == 'charged' ||
                status.toLowerCase() == 'cod_initiated';
            context.router.maybePop(JusPayPaymentModel(
                paymentSuccess: isPaymentSuccess, orderId: orderId));
        }
    }
  }
  // block:end:create-hyper-callback
}

extension StringIgnoreCase on String {
  /// function to compare two strings for equality
  bool equalsIgnoreCase(String other) {
    return toLowerCase() == other.toLowerCase();
  }
}
