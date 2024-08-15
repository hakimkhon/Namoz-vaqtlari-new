import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namozvaqtlari/core/constants/const_sizes.dart';
import 'package:namozvaqtlari/core/resources/asset_resources.dart';
import 'package:namozvaqtlari/screens/main/widgets/buttons_time.dart';
import 'package:namozvaqtlari/screens/widgets/monthly_item.dart';
import 'package:namozvaqtlari/screens/widgets/daily_item.dart';
import 'package:namozvaqtlari/screens/widgets/location.dart';
import 'package:namozvaqtlari/screens/widgets/weekly_item.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.regionName});
  final String regionName;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int testIndex = 0;
  int mainIndex = 1; //hozircha kerak emas sababi boshqa buttondan foydalandim
  bool isVisibleLeft = false;
  bool isVisibleRight = false;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: ConstSizes.width(2, context),
            right: ConstSizes.width(2, context),
            top: ConstSizes.height(2, context),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  LocationWidget(regionName: widget.regionName),
                  ButtonsTime(
                    currentIndex: mainIndex,
                    onTap: (index) async {
                      mainIndex = index;
                      if(mainIndex == 3){
                        final DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2030),
                            );
                            if (dateTime != null) {
                              setState(() {
                                selectedDate = dateTime;
                              });
                            }
                            setState(() {});
                      }
                      setState(() {});
                    },
                  ),

                  // const LeftRightWidget(),

                  // Test uchun
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ConstSizes.height(1, context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ZoomTapAnimation(
                          onTap: () {
                            testIndex = 0;
                            isVisibleLeft = false;
                            isVisibleRight = false;
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: ConstSizes.width(30, context),
                            height: ConstSizes.height(4, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  testIndex == 0 ? Colors.blue : Colors.white,
                            ),
                            child: const Text(
                              "Bugun",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        ZoomTapAnimation(
                          onTap: () {
                            testIndex = 1;
                            isVisibleLeft = true;
                            isVisibleRight = true;
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: ConstSizes.width(30, context),
                            height: ConstSizes.height(4, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  testIndex == 1 ? Colors.blue : Colors.white,
                            ),
                            child: const Text(
                              "Bu Hafta",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // ZoomTapAnimation(
                        //   onTap: () async {
                        //     testIndex = 2;
                        //     isVisibleLeft = true;
                        //     isVisibleRight = true;
                        //     final DateTime? dateTime = await showDatePicker(
                        //       context: context,
                        //       initialDate: DateTime.now(),
                        //       firstDate: DateTime(2024),
                        //       lastDate: DateTime(2030),
                        //     );
                        //     if (dateTime != null) {
                        //       setState(() {
                        //         selectedDate = dateTime;
                        //       });
                        //     }
                        //     setState(() {});
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     width: ConstSizes.width(30, context),
                        //     height: ConstSizes.height(4, context),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color:
                        //           testIndex == 2 ? Colors.blue : Colors.white,
                        //     ),
                        //     child: const Text(
                        //       "Oylik",
                        //       style: TextStyle(
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Text(
                    NisoSurasi.oyat_103,
                    style: GoogleFonts.arima(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  if (mainIndex == 0) DailyItem(regionName: widget.regionName),
                  if (mainIndex == 1) WeeklyItem(regionName: widget.regionName),
                  if (mainIndex == 2)
                    MonthlyItem(
                        regionName: widget.regionName,
                        month: selectedDate.month),
                ],
              ),
              Visibility(
                visible: isVisibleLeft,
                child: Positioned(
                  top: ConstSizes.height(45, context),
                  left: ConstSizes.width(0, context),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isVisibleRight,
                child: Positioned(
                  top: ConstSizes.height(45, context),
                  left: ConstSizes.width(80, context),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
