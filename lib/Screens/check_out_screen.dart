import 'package:flutter/material.dart';
import 'package:fast_food/ReusableComponets/check_out_item.dart';
import 'package:fast_food/Constants/styles.dart';
import 'package:gap/gap.dart';
import 'package:fast_food/Constants/get_size.dart';
import 'package:fast_food/ReusableComponets/reuseable_icon.dart';
import 'package:provider/provider.dart';
import 'package:fast_food/models/orderedItemData.dart';
import 'paymentScreen.dart';
import 'package:fast_food/ReusableComponets/reusableOptionButton.dart';
import 'menu_screen.dart';
class CheckOutScreen extends StatefulWidget {
  final List<Map<String, dynamic>> checkOutItem;
  const CheckOutScreen({Key? key, required this.checkOutItem})
      : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
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
                  'Item In Your Cart',
                  style: Styles.headerTwoText,
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const MenuScreen()));
                  },
                  child: Stack(
                    children: const [
                      ReusableIcon(iconData: Icons.shopping_bag_outlined),
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
              children: widget.checkOutItem
                  .map(
                    (eachItem) => CheckOutItemOrdered(
                      menuData: eachItem,
                    ),
                  )
                  .toList(),
            )
          ],
        ),
        floatingActionButton: Stack(
          children: [
            FloatingActionButton(
              isExtended: true,
              focusColor: Colors.purpleAccent,
              focusElevation: 8.7,
              shape: const CircleBorder(
                eccentricity: 1.0,
                side: BorderSide(
                  width: 4.5,
                  color: Colors.red,
                ),
              ),
              tooltip: 'Check Out All ',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        scrollable: true,
                        icon: const ReusableIcon(
                          iconData: Icons.payments_rounded,
                        ),
                        shadowColor: Colors.grey,
                        backgroundColor: Styles.cardColor,
                        elevation: 7.8,
                        title: const Text(
                          'Check Out All ',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black87),
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        content: ListBody(
                          children: [
                            Text(
                              'Total cost of Your Item \$${Provider.of<OrderedItemData>(context).totalCostInCart().toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.black87),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OptionButton(
                                  buttonColor: Colors.blueAccent,
                                  buttonLabel: 'ok',
                                  actionTakenOnCartItem: () {
                                    Provider.of<OrderedItemData>(context,listen: false).checkOutAll();
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PaymentScreen(),
                                      ),
                                    );
                                  },
                                ),
                                OptionButton(
                                  buttonColor: Colors.redAccent,
                                  buttonLabel: 'Cancel',
                                  actionTakenOnCartItem: () =>
                                      Navigator.pop(context),
                                )
                              ],
                            )
                          ],
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(2.0),
                          ),
                        ),
                      );
                    });
              },
              child: const Icon(
                Icons.shopping_cart_checkout_outlined,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, top: 0.0),
              child: CircleAvatar(
                radius: 16.0,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                child: Text(
                  Provider.of<OrderedItemData>(context)
                      .totalCostInCart()
                      .toStringAsFixed(2),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 9.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
