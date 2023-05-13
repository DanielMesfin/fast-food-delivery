import 'package:flutter/material.dart';
import 'package:fast_food/Screens/detail_screen.dart';
import 'package:gap/gap.dart';
import 'package:fast_food/Constants/get_size.dart';
import 'package:fast_food/Constants/styles.dart';

class MenuItem extends StatelessWidget {
  final Map<String, dynamic> foodData;
  final Function()? myFavoriteItem;
  const MenuItem(
      {super.key, required this.myFavoriteItem, required this.foodData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: GetSize.getScreenHeight(15),
      ),
      padding: EdgeInsets.symmetric(
        vertical: GetSize.getScreenHeight(10),
        horizontal: GetSize.getScreenWidth(10),
      ),
      width: double.infinity,
      height: 137,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Styles.cardColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            maxRadius: 38,
            backgroundImage: AssetImage('images/${foodData['image']}'),
          ),
          Gap(
            GetSize.getScreenWidth(15),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: GetSize.getScreenWidth(178),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          foodData['rate'].toString(),
                          style: Styles.headerFiveTextGray,
                        ),
                        const Icon(
                          Icons.star,
                          size: 19,
                          color: Colors.yellowAccent,
                        )
                      ],
                    ),
                    InkWell(
                      onTap: myFavoriteItem,
                      child: Icon(
                        Icons.favorite,
                        size: 25,
                        color: foodData['loved'] ? Colors.red : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              Gap(
                GetSize.getScreenHeight(6),
              ),
              Text(
                foodData['name'],
                style: Styles.headerFiveTextBlack,
              ),
              Gap(
                GetSize.getScreenHeight(6),
              ),
              Text(
                foodData['nickName'],
                style: Styles.headerFiveTextGray,
              ),
              Gap(
                GetSize.getScreenHeight(8),
              ),
              SizedBox(
                width: GetSize.getScreenWidth(178),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${foodData['price'].toString()}',
                      style: Styles.headerFiveTextBlack,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              detailData: foodData,
                            ),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.add_box,
                        size: 30,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
