import 'package:fast_food/Constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:fast_food/Constants/get_size.dart';

class OrderConformation extends StatefulWidget {
  static const id = 'order_conformation';
  const OrderConformation({Key? key}) : super(key: key);

  @override
  State<OrderConformation> createState() => _OrderConformationState();
}

class _OrderConformationState extends State<OrderConformation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: GetSize.getScreenWidth(15),
              vertical: GetSize.getScreenHeight(20),
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back_ios_new),
                  Text(
                    'Order Conformation',
                    style: Styles.headerFiveTextBlack,
                  ),
                  Icon(Icons.delete)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
