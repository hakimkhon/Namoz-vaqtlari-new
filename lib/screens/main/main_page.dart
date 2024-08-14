import 'package:flutter/material.dart';
import 'package:namozvaqtlari/core/constants/const_sizes.dart';
import 'package:namozvaqtlari/core/resources/asset_resources.dart';
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
  int mainIndex = 1;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(230, 255, 255, 255),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: ConstSizes.width(2, context),
            right: ConstSizes.width(2, context),
            top: ConstSizes.height(2, context),
          ),
          child: Column(
            children: [
              LocationWidget(regionName: widget.regionName),
              // ButtonsTime(
              //   currentIndex: mainIndex,
              //   onTap: (index) {
              //     mainIndex = index;
              //     setState(() {});
              //   },
              // ),

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
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: ConstSizes.width(30, context),
                        height: ConstSizes.height(4, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: testIndex == 0 ? Colors.blue : Colors.white,
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
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: ConstSizes.width(30, context),
                        height: ConstSizes.height(4, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: testIndex == 1 ? Colors.blue : Colors.white,
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
                    ZoomTapAnimation(
                      onTap: () async {
                        testIndex = 2;
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
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: ConstSizes.width(30, context),
                        height: ConstSizes.height(4, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: testIndex == 2 ? Colors.blue : Colors.white,
                        ),
                        child: const Text(
                          "Oylik",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                NisoSurasi.oyat_103,
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              if (testIndex == 0) DailyItem(regionName: widget.regionName),
              if (testIndex == 1) WeeklyItem(regionName: widget.regionName),
              if (testIndex == 2)
                MonthlyItem(
                    regionName: widget.regionName, month: selectedDate.month),
            ],
          ),
        ),
      ),
    );
  }
}
