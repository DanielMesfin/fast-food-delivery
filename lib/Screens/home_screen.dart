import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:fast_food/Constants/get_size.dart';
import 'package:fast_food/Constants/styles.dart';
import 'menu_screen.dart';
import 'login_screen.dart';
import 'history.dart';
import 'about_screen.dart';

class SidebarPage extends StatefulWidget {
  static const id = 'home_page';
  const SidebarPage({Key? key}) : super(key: key);
  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Fastest Food Delivery ',
          style: Styles.headerTwoText.copyWith(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFa8325a),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/navigationBackgroundImage.PNG'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/food_delivery.PNG'),
                  ),
                  Gap(
                    GetSize.getScreenHeight(20),
                  ),
                  Text(
                    'Fastest Food Delivery ',
                    style: Styles.headerTwoText.copyWith(
                      color: Colors.grey.shade800,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bgone.PNG'),
                  //TODO set the size of image in the fitness of image in ;
                  fit: BoxFit.none,
                ),
              ),
              child: Column(
                children:  [
                  NavigationItem(
                    navigationItemAction: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const History()));
                      // TODO Set the side navigation bar to destroy it state for home page
                      },
                    iconData: Icons.home,
                    iconLabel: 'Order History',
                  ),
                  NavigationItem(
                    navigationItemAction: (){
                      print('data at these way');
                      //Navigator.pop(context);
                    },
                    iconData: Icons.qr_code_2,
                    iconLabel: 'Enter Promo Code',
                  ),
                  NavigationItem(
                    navigationItemAction: (){
                      print('data at these way');
                      //Navigator.pop(context);
                    },
                    iconData: Icons.settings,
                    iconLabel: 'Setting',
                  ),
                  NavigationItem(
                    navigationItemAction: (){
                      //Navigator.pop(context);
                      print('data at these way');
                    },
                    iconData: Icons.repeat_on,
                    iconLabel: 'FAQS',
                  ),
                  NavigationItem(
                    navigationItemAction: (){
                      //Navigator.pop(context);
                      print('data at these way');
                    },
                    iconData: Icons.support_rounded,
                    iconLabel: 'Supports',
                  ),
                  NavigationItem(
                    navigationItemAction: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AboutUs()));
                     // Navigator.pop(context);
                      },
                    iconData: Icons.roundabout_right_rounded,
                    iconLabel: 'About',
                  ),
                  NavigationItem(
                    navigationItemAction: (){
                     // Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LoginScreen()), (route) => false);
                      },
                    iconData: Icons.logout_rounded,
                    iconLabel: 'Log Out',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: GetSize.getScreenHeight(5),
          horizontal: GetSize.getScreenWidth(0),
        ),
        children: [
          Column(
            children: [
              Gap(
                GetSize.getScreenHeight(25),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: GetSize.getScreenHeight(8),
                  horizontal: GetSize.getScreenWidth(8),
                ),
                width: double.infinity,
                height: GetSize.getScreenHeight(190),
                child: const Image(
                  image: AssetImage('images/bgtwo.PNG'),
                ),
              ),
              Gap(
                GetSize.getScreenHeight(20),
              ),
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: GetSize.getScreenWidth(13)),
                child: const Text(
                  'Top #1 Fastest Delivery Food For You',
                  style: Styles.headerOneText,
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(
                GetSize.getScreenHeight(20),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: GetSize.getScreenWidth(13),
                ),
                child: const Text(
                  'Order food and get delivery in the fastest  time in the town',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(
                GetSize.getScreenHeight(25),
              ),
              //TODO CHANGE THE BUTTON TO TEXT BUTTON OR MATERIALS
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    elevation: 7,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 12)),
                onPressed: () {
                  Navigator.pushNamed(context, MenuScreen.id);
                },
                child: Text(
                  'Get Started',
                  style: Styles.headerThreeText.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// TODO get this to other file
class NavigationItem extends StatelessWidget {
  final Function()? navigationItemAction;
  final IconData iconData;
  final String iconLabel;
  const NavigationItem(
      {super.key, required this.iconData,
        required this.navigationItemAction,
        required this.iconLabel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.black87,
      ),
      title: Text(
        iconLabel,
        style: Styles.headerFiveTextBlack,
      ),
      onTap:navigationItemAction,
    );
  }
}
