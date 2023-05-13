import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fast_food/Screens/login_screen.dart';
import 'package:fast_food/Screens/registration_screen.dart';
import 'package:fast_food/Screens/menu_screen.dart';
import 'package:fast_food/Screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'models/orderedItemData.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderedItemData>(
      create: (context)=>OrderedItemData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fast Food',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //  home:  const SidebarPage(),
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          RegistrationScreen.id: (context) => const RegistrationScreen(),
          MenuScreen.id: (context) => const MenuScreen(),
          SidebarPage.id: (context) => const SidebarPage(),
        },
      ),
    );
  }
}
