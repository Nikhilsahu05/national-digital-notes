import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_digital_notes/views/dashboard_screen/dashboard_view.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({Key? key}) : super(key: key);

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  var progressValue;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.offAll(DashboardView()));

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
                child: Image.asset(
              'assets/20943863.jpg',
              scale: 0.1,
            )),
          ),
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 150,
          ),
          const Text(
            "Order Placed Successfully",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
