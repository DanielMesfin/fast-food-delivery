import 'package:flutter/material.dart';
import 'package:fast_food/Constants/get_size.dart';
import 'package:fast_food/Constants/styles.dart';
import 'package:gap/gap.dart';
import 'reusableOptionButton.dart';
import 'package:provider/provider.dart';
import 'package:fast_food/models/orderedItemData.dart';
import 'package:fast_food/Screens/paymentScreen.dart';

class CheckOutItemOrdered extends StatelessWidget {

  final Map<String, dynamic> menuData;
  const CheckOutItemOrdered(
      {super.key,
      required this.menuData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: GetSize.getScreenHeight(15),
      ),
      padding: EdgeInsets.only(
        bottom: GetSize.getScreenHeight(8),
        top: GetSize.getScreenHeight(4),
      ),
      width: double.infinity,
      height: 176,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Styles.cardColor),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: GetSize.getScreenWidth(8),
                  vertical: GetSize.getScreenHeight(8),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/${menuData['image']}'),
                  radius: 45,
                ),
              ),
              Gap(
                GetSize.getScreenWidth(20),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // name
                  Text(
                    menuData['name'],
                    style: Styles.headerFourText,
                  ),
                  Gap(GetSize.getScreenHeight(5)),
                  // Quantity
                  Text(
                    'Quantity: ${menuData['amount'].toString()}',
                    style: Styles.headerFiveTextBlack,
                  ),
                  Gap(GetSize.getScreenHeight(5)),
                  //time span
                  Text(
                    'Prepared In: ${menuData['timespan'].toString()} Min',
                    style: Styles.headerFiveTextGray,
                  ),
                  Gap(
                    GetSize.getScreenHeight(7),
                  ),
                  //total price
                  Text(
                    'Total Price:\$${menuData['totalPrice'].toStringAsFixed(2)}',
                    style: Styles.headerFiveTextBlack,
                  ),
                ],
              )
            ],
          ),
          Gap(
            GetSize.getScreenHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OptionButton(
                actionTakenOnCartItem: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(),
                    ),
                  );
                },
                buttonColor: Colors.blueAccent,
                buttonLabel: 'Check Out',
              ),
              OptionButton(
                buttonColor: Colors.redAccent,
                actionTakenOnCartItem: () =>
                    Provider.of<OrderedItemData>(context, listen: false)
                        .removeItem(menuData['id']),
                buttonLabel: 'Remove',
              )
            ],
          )
        ],
      ),
    );
  }
}
