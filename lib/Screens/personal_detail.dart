import 'package:fast_food/Constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:fast_food/Constants/get_size.dart';

class PersonalDetial extends StatefulWidget {
  static const id = 'personal_detial';
  const PersonalDetial({Key? key}) : super(key: key);

  @override
  State<PersonalDetial> createState() => _PersonalDetialState();
}

class _PersonalDetialState extends State<PersonalDetial> {
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
                children: [
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
