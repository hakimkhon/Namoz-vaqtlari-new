import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namozvaqtlari/core/constants/const_sizes.dart';
import 'package:namozvaqtlari/core/resources/asset_resources.dart';
import 'package:namozvaqtlari/screens/widgets/buttons_time.dart';
import 'package:namozvaqtlari/screens/widgets/monthly_item.dart';
import 'package:namozvaqtlari/screens/widgets/daily_item.dart';
import 'package:namozvaqtlari/screens/widgets/location.dart';
import 'package:namozvaqtlari/screens/widgets/weekly_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.regionName});
  final String regionName;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int mainIndex = 1;
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
                      if (mainIndex == 3) {
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
                  Text(
                    NisoSurasi.oyat_103,
                    style: GoogleFonts.arima(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  if (mainIndex == 1) DailyItem(regionName: widget.regionName),
                  if (mainIndex == 2) WeeklyItem(regionName: widget.regionName),
                  if (mainIndex == 3)
                    MonthlyItem(
                      regionName: widget.regionName,
                      month: selectedDate.month,
                      day: selectedDate.day,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
