import 'package:flutter/material.dart';
import 'package:fast_food/Constants/styles.dart';
import 'package:fast_food/Constants/get_size.dart';
import 'package:gap/gap.dart';
import 'package:fast_food/ReusableComponets/history_item.dart';
import 'package:provider/provider.dart';
import 'package:fast_food/models/orderedItemData.dart';
import 'package:fast_food/ReusableComponets/reuseable_icon.dart';
class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
   Map<String,dynamic>favorite=Provider.of<OrderedItemData>(context).itemInBag.firstWhere((element) => true);
   return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.appBgColor,
        body: ListView(
          padding: EdgeInsets.symmetric(
            vertical: GetSize.getScreenHeight(25),
            horizontal: GetSize.getScreenWidth(15),
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Item History',
                  style: Styles.headerTwoText,
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Stack(
                    children: const [
                      ReusableIcon(iconData: Icons.backspace_outlined),
                      Padding(
                        padding: EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 10.0,
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Gap(
              GetSize.getScreenHeight(25),
            ),
            Column(
              children:favorite['loved']&&Provider.of<OrderedItemData>(context).itemInBag.length>0?
              Provider.of<OrderedItemData>(context).itemInBag.map(
                    (eachItem) => HistoryItemOrdered(
                  menuData: eachItem,
                ),
              ).toList():[
              ],
            )
          ],
        ),
      ),
    );
  }
}
