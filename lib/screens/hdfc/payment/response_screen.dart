import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'package:http/http.dart' as http;
import 'package:kasnew/widgets/title_app_bar_widget.dart';


class ResponseScreen extends StatelessWidget {
  const ResponseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderId = ModalRoute.of(context)!.settings.arguments;
    var screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          Navigator.pop(context);
          return true;
        },
        child: Scaffold(
          appBar: TitleAppBarWidget(title: "Payment Status"),
          body: FutureBuilder(
            future: getPaymentResponse(orderId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                Map<String, dynamic> data =
                    snapshot.data as Map<String, dynamic>;
                String orderId = data['order_id'];
                String orderStatus = data['order_status'];
                String orderStatusText = "";
                String statusImageUrl = "";
                if (orderStatus != null) {
                  switch (orderStatus) {
                    case "CHARGED":
                    case "COD_INITIATED":
                      orderStatusText = "Payment Successful";
                      statusImageUrl = "assets/paymentSuccess.png";
                      break;
                    case "PENDING_VBV":
                      orderStatusText = "Payment Pending...";
                      statusImageUrl = "assets/pending.png";
                      break;
                    default:
                      orderStatusText = "Payment Failed";
                      statusImageUrl = "assets/paymentFailed.png";
                      break;
                  }
                } else {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
                return Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.blue,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text(
                          "Call handleJuspayResponse API to fetch the Order Status",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight / 4,
                      margin: const EdgeInsets.only(top: 100.0),
                      child: Image.asset(
                        statusImageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Center(
                        child: Text(
                          orderStatusText, // Display the payment response
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Order Id: " +
                              orderId, // Display the payment response
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Status: " +
                              orderStatus, // Display the payment response
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }

  Future<Map<String, dynamic>> getPaymentResponse(order_id) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    // block:start:sendGetRequest
    //10.0.2.2 Works only on emulator
    var response = await http.get(
        Uri.parse(
            'http://10.0.2.2:5000/handleJuspayResponse?order_id=${order_id}'),
        headers: headers);
    // block:end:sendGetRequest

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw Exception(
          'API call failed with status code ${response.statusCode} ${response.body}');
    }
  }
}