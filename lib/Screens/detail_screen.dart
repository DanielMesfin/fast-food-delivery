import 'package:fast_food/Constants/get_size.dart';
import 'package:fast_food/Constants/styles.dart';
import 'package:fast_food/ReusableComponets/reuseable_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:fast_food/ReusableComponets/reusableText.dart';
import 'package:fast_food/ReusableComponets/round_button.dart';
import 'package:provider/provider.dart';
import 'package:fast_food/models/orderedItemData.dart';
import 'check_out_screen.dart';

class DetailScreen extends StatefulWidget {
  static const id = 'detail_screen';
  final Map<String, dynamic> detailData;

  const DetailScreen({Key? key, required this.detailData}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  RangeValues _currentRangeValues = const RangeValues(0, 45);
  Color color = Colors.white;
  String sign = '';
  String textOut = '';
  int _count = 1;
  String textStateCallBack(String indicator) {
    return indicator;
  }

  void _increment() {
    _count++;
  }

  void _decrement() {
    _count--;
  }

  @override
  Widget build(BuildContext context) {
    int itemCountNumber=Provider.of<OrderedItemData>(context).getCount();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(
            0xfff0f0f7), // the background only for these screen of application
        body: SafeArea(
          child: Stack(
            children: [
              ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: GetSize.getScreenHeight(15),
                  vertical: GetSize.getScreenWidth(25),
                ),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: const ReusableIcon(
                            iconData: Icons.arrow_back_ios_new),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        widget.detailData['name'],
                        style: Styles.headerThreeText,
                      ),
                      Stack(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(
                              GetSize.getScreenHeight(15),
                            ),
                            onTap: () {
                              if (itemCountNumber > 0) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CheckOutScreen(
                                      checkOutItem:
                                      Provider.of<OrderedItemData>(context)
                                          .itemInBag,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: const ReusableIcon(
                              iconData: Icons.shopping_bag_outlined,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: CircleAvatar(
                              radius: 8.0,
                              backgroundColor: itemCountNumber > 0
                                  ? Colors.red
                                  : Colors.black12,
                              foregroundColor: Colors.white,
                              child: itemCountNumber > 0
                                  ? Text(
                                itemCountNumber.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              )
                                  : const Text(''),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Gap(GetSize.getScreenHeight(25)),
                  const Text(
                    'Vey important sweet food of the worked of component so '
                    'do you enjoy it for all of the free ',
                    style: Styles.headerSixTextGray,
                    textAlign: TextAlign.center,
                  ),
                  Gap(GetSize.getScreenHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  child: const Text(
                                'Price :',
                                style: Styles.headerFiveTextGray,
                              )),
                              Text(
                                '\$${(widget.detailData['price']*_count).toStringAsFixed(2)}',
                                style: Styles.headerThreeText,
                              ),
                            ],
                          ),
                          Gap(
                            GetSize.getScreenHeight(10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Delivery Time :',
                                style: Styles.headerFiveTextGray,
                              ),
                              Text(
                                '${_currentRangeValues.end - _currentRangeValues.start} Minutes',
                                style: Styles.headerThreeText,
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: GetSize.getScreenWidth(0),
                              vertical: GetSize.getScreenHeight(3),
                            ),
                            child: RangeSlider(
                              values: _currentRangeValues,
                              max: 100,
                              divisions: 5,
                              activeColor: Colors.purple,
                              inactiveColor: Colors.grey,
                              labels: RangeLabels(
                                _currentRangeValues.start.round().toString(),
                                _currentRangeValues.end.round().toString(),
                              ),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _currentRangeValues = values;
                                });
                              },
                            ),
                          ),
                          Gap(
                            GetSize.getScreenHeight(10),
                          ),
                          const Text(
                            'Calories',
                            style: Styles.headerFiveTextGray,
                          ),
                          Gap(
                            GetSize.getScreenHeight(10),
                          ),
                          Text(
                            widget.detailData['calories'],
                            style: Styles.headerFiveTextBlack,
                          ),
                          Gap(
                            GetSize.getScreenHeight(20),
                          ),
                          const Text(
                            'wight',
                            style: Styles.headerFiveTextGray,
                          ),
                          Gap(
                            GetSize.getScreenHeight(10),
                          ),
                          Text(
                            widget.detailData['wight'],
                            style: Styles.headerFiveTextBlack,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gap(
                    GetSize.getScreenHeight(15),
                  ),
                  Row(
                    children: [
                      ReusableSizeText(
                        pasedColor:
                            textOut == 'S' ? Colors.redAccent : Colors.white,
                        textLabel: 'S',
                        callBackActionForQuantity: () {
                          setState(() {
                            textOut = textStateCallBack('S');
                          });
                        },
                      ),
                      Gap(GetSize.getScreenWidth(15)),
                      ReusableSizeText(
                        pasedColor:
                            textOut == 'M' ? Colors.redAccent : Colors.white,
                        textLabel: 'M',
                        callBackActionForQuantity: () {
                          setState(() {
                            textOut = textStateCallBack('M');
                          });
                        },
                      ),
                      Gap(GetSize.getScreenWidth(15)),
                      ReusableSizeText(
                        pasedColor:
                            textOut == 'L' ? Colors.redAccent : Colors.white,
                        textLabel: 'L',
                        callBackActionForQuantity: () {
                          setState(() {
                            textOut = textStateCallBack('L');
                          });
                        },
                      ),
                    ],
                  ),
                  Gap(GetSize.getScreenHeight(25),),
                  Row(
                    children: [
                      ReusableSizeText(
                        pasedColor:
                            sign == '-' ? Colors.redAccent : Colors.white,
                        textLabel: '-',
                        callBackActionForQuantity: () {
                          setState(() {
                            sign = textStateCallBack('-');
                            _decrement();
                          });
                        },
                      ),
                      Gap(GetSize.getScreenWidth(15)),
                      Text(
                        _count.toString(),
                        style: Styles.headerFourText,
                      ),
                      Gap(GetSize.getScreenWidth(15)),
                      ReusableSizeText(
                        pasedColor:
                            sign == '+' ? Colors.redAccent : Colors.white,
                        textLabel: '+',
                        callBackActionForQuantity: () {
                          setState(() {
                            sign = textStateCallBack('+');
                            _increment();
                          });
                        },
                      ),
                    ],
                  ),
                  Gap(GetSize.getScreenHeight(10),),
                  InkWell(
                      child: RerusableMatterialButton(colorInput: Colors.redAccent, textLabel: 'Add to your Cart'),
                  onTap: () {
    if (widget.detailData.containsKey('id') ==
    widget.detailData.containsKey('id')) {
    widget.detailData['totalPrice'] =
    widget.detailData['price'] * _count.roundToDouble();
    widget.detailData['amount'] = _count;
    widget.detailData['timespan'] =
    _currentRangeValues.end - _currentRangeValues.start;
    }
    Provider.of<OrderedItemData>(context, listen: false)
        .addOrderedItem(widget.detailData);
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => CheckOutScreen(checkOutItem: Provider.of<OrderedItemData>(context).itemInBag),
    ),
    );
    },

                  )
                ],
              ),
              Positioned(
                right: GetSize.getScreenWidth(-15),
                bottom: GetSize.getScreenHeight(150),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        AssetImage('images/${widget.detailData['image']}'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

