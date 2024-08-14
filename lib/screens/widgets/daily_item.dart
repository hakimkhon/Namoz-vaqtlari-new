import 'package:flutter/material.dart';
import 'package:namozvaqtlari/core/constants/const_sizes.dart';
import 'package:namozvaqtlari/models/daily_data_model.dart';
import 'package:namozvaqtlari/services/api_service.dart';

class DailyItem extends StatelessWidget {
  const DailyItem({super.key, required this.regionName});
  final String regionName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: ApiService.getDailyData(regionName),
        builder: (context, AsyncSnapshot<DailyDataModel?> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Text("ERROR");
          } else {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                  left: ConstSizes.width(2, context),
                  right: ConstSizes.width(2, context),
                  top: ConstSizes.width(2, context),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          snapshot.data!.weekday ?? "",
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        // const Spacer(),
                        Column(
                          children: [
                            Text(
                              snapshot.data!.date.toString().substring(0, 10),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue),
                            ),
                            Row(
                              children: [
                                Text(
                                  snapshot.data!.hijriDate!.month
                                      .toString()
                                      .capitalize(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue),
                                ),
                                Text(
                                  ": ${snapshot.data!.hijriDate!.day}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(height: 1),
                    showDataItemCardDaily(
                        "Bomdod", snapshot.data!.times!.tongSaharlik ?? ""),
                    showDataItemCardDaily(
                        "Quyosh", snapshot.data!.times!.quyosh ?? ""),
                    showDataItemCardDaily(
                        "Peshin", snapshot.data!.times!.peshin ?? ""),
                    showDataItemCardDaily(
                        "Asr", snapshot.data!.times!.asr ?? ""),
                    showDataItemCardDaily(
                        "Shom", snapshot.data!.times!.shomIftor ?? ""),
                    showDataItemCardDaily(
                        "Xufton", snapshot.data!.times!.hufton ?? ""),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  showDataItemCardDaily(String title, String time) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          time,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
