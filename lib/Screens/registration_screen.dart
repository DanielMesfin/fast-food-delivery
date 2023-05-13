import 'package:flutter/material.dart';
import 'package:fast_food/Constants/styles.dart';
import 'package:fast_food/ReusableComponets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gap/gap.dart';
import 'package:fast_food/Constants/get_size.dart';
import 'package:fast_food/Screens/menu_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  const RegistrationScreen({super.key});
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool processingData = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: processingData
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.cyan,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: GetSize.getScreenHeight(200.0),
                        child: Image.asset('images/bgone.PNG'),
                      ),
                    ),
                  ),
                  Gap(
                    GetSize.getScreenHeight(30),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: Styles.KInputDecoration.copyWith(
                        hintText: 'Enter your email'),
                  ),
                  Gap(
                    GetSize.getScreenHeight(10),
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: Styles.KInputDecoration.copyWith(
                      hintText: 'Enter Your Password',
                    ),
                  ),
                  Gap(
                    GetSize.getScreenHeight(20),
                  ),
                  RerusableMatterialButton(
                    onPressInput: () async {
                      try {
                        final userCreated =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        // ignore: unnecessary_null_comparison
                        if (userCreated != null) {
                          final emailAddressOfUser = _auth.currentUser?.email;
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, MenuScreen.id,
                              arguments: emailAddressOfUser);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    colorInput: Colors.blueAccent,
                    textLabel: 'Register',
                  ),
                  Gap(
                    GetSize.getScreenHeight(15),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Back',
                        style: Styles.linkText,
                        textAlign: TextAlign.end,
                      ))
                ],
              ),
      ),
    );
  }
}
