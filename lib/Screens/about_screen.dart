import 'package:flutter/material.dart';
import 'package:fast_food/Constants/get_size.dart';
import 'package:fast_food/Constants/styles.dart';
import 'package:gap/gap.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(
              horizontal: GetSize.getScreenWidth(25),
              vertical: GetSize.getScreenWidth(15),
            ),
            children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/about_app.PNG'),
                      fit: BoxFit.cover),
                ),
                child: const Icon(
                  Icons.backspace_outlined,
                  color: Colors.redAccent,
                ),
              )
            ],
          ),
          Positioned(
            bottom: GetSize.getScreenHeight(0),
            right: GetSize.getScreenWidth(1),
            left: GetSize.getScreenWidth(1),
            child: Column(
              children: [
                const Text(
                  'Hungry? Try Our Burgers Made with Half Pound Patties.',
                  style: Styles.headerThreeText,
                  textAlign: TextAlign.center,
                ),
                Gap(
                  GetSize.getScreenHeight(15),
                ),
                const Text(
                  'Today, Burger King® unveils its new brand positioning and campaign, kicking off with its modernized tagline, "You Rule." This work is part of the change Guests nationwide will experience as the brand implements its "Reclaim the Flame" plan',
                  style: Styles.headerSixTextBlack,
                  textAlign: TextAlign.center,
                ),
                Gap(
                  GetSize.getScreenHeight(25),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Back",
                      style: Styles.linkText,
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
