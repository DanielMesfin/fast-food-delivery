import 'package:flutter/material.dart';
import 'package:fast_food/Constants/get_size.dart';
import 'package:fast_food/Constants/styles.dart';
import 'package:gap/gap.dart';
import 'reusableOptionButton.dart';
import 'package:provider/provider.dart';
import 'package:fast_food/models/orderedItemData.dart';
import 'package:fast_food/Screens/detail_screen.dart';

class HistoryItemOrdered extends StatelessWidget {

  final Map<String, dynamic> menuData;
  const HistoryItemOrdered(
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
      height: GetSize.getScreenHeight(176),
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
                    'Rate: ${menuData['rate'].toString()}',
                    style: Styles.headerFiveTextBlack,
                  ),
                  Gap(GetSize.getScreenHeight(5)),
                  //time span
                  Text(
                    '${menuData['calories']}',
                    style: Styles.headerFiveTextGray,
                  ),
                  Gap(
                    GetSize.getScreenHeight(7),
                  ),
                  //total price
                  Text(
                    'Price:\$${menuData['price'].toString()}',
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
                      builder: (context) => DetailScreen(detailData: menuData),
                    ),
                  );
                },
                buttonColor: Colors.blueAccent,
                buttonLabel: 'Add to Cart',
              ),
              OptionButton(
                buttonColor: Colors.redAccent,
                actionTakenOnCartItem: () =>
                    Provider.of<OrderedItemData>(context, listen: false)
                        .removeItem(menuData['id']),
                buttonLabel: 'Clear History',
              )
            ],
          )
        ],
      ),
    );
  }
}
