import 'package:fast_food/Constants/get_size.dart';
import 'package:fast_food/ReusableComponets/reuseable_icon.dart';
import 'package:fast_food/models/orderedItemData.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'package:fast_food/Constants/styles.dart';
import 'package:fast_food/ReusableComponets/menu_card.dart';
import 'package:fast_food/models/menu_data.dart';
class MenuScreen extends StatefulWidget {
  static const String id = 'menu_screen';
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Map<String, dynamic>> itemInBag = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(
            0xfff0f0f7), // the background only for these screen of application
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: GetSize.getScreenHeight(20),
              horizontal: GetSize.getScreenWidth(15),
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Choose what you ',
                        style: Styles.headerFiveTextGray,
                      ),
                      Text(
                        'want to eat today',
                        style: Styles.headerFiveTextBlack
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  InkWell(
                    child: const ReusableIcon(iconData: Icons.close_rounded),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SidebarPage()));
                    },
                  )
                ],
              ),
              Gap(
                GetSize.getScreenHeight(10),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: GetSize.getScreenHeight(8),
                ),
                height: GetSize.getScreenHeight(53),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Styles.cardColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 30,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/bgone.PNG'),
                            ),
                          ),
                        ),
                        const Text(
                          'Donates',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigoAccent),
                        )
                      ],
                    ),
                    const Text(
                      'Donates Pizza',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Gap(
                GetSize.getScreenHeight(15),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: menuList.map((e) => MenuItem(foodData: e,myFavoriteItem: (){
                   setState(() {
                  Provider.of<OrderedItemData>(context,listen: false).isLoved(e);

                  //   e['loved']=!e['loved'];
                   });
                 // Provider.of<OrderedItemData>(context,listen: false).isLoved(e);
                },)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

