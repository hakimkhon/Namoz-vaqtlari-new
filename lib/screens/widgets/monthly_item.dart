import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:namozvaqtlari/core/constants/const_sizes.dart';
import 'package:namozvaqtlari/models/monthly_data_model.dart';
import 'package:namozvaqtlari/services/api_service.dart';

class MonthlyItem extends StatelessWidget {
  const MonthlyItem({
    super.key,
    required this.regionName,
    required this.month,
    required this.day,
  });
  final String regionName;
  final int month;
  final int day;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: ApiService.getMonthlyData(regionName, month),
        builder: (context, AsyncSnapshot<List<MonthlyDataModel?>?> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Text("ERROR");
          } else {
            debugPrint(("kun: $day"));
            return Swiper(
              // pagination: const SwiperPagination(), //pastdagi nuqtalar ko'rinishi
              control: const SwiperControl(
                size: 36,
                color: Colors.green,
                iconPrevious: Icons.arrow_circle_left,
                iconNext: Icons.arrow_circle_right,
              ),
              index: day - 1,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  width: ConstSizes.width(94, context),
                  margin: EdgeInsets.symmetric(
                    horizontal: ConstSizes.width(7, context),
                  ),
                  child: Card(
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
                                snapshot.data![index]!.weekday ?? "",
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              // const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    snapshot.data![index]!.date
                                        .toString()
                                        .substring(0, 10),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data![index]!.hijriDate!.month
                                            .toString()
                                            .capitalize(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue),
                                      ),
                                      Text(
                                        ": ${snapshot.data![index]!.hijriDate!.day}",
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
                          showDataItemCardDaily("Bomdod",
                              snapshot.data![index]!.times!.tongSaharlik ?? ""),
                          showDataItemCardDaily("Quyosh",
                              snapshot.data![index]!.times!.quyosh ?? ""),
                          showDataItemCardDaily("Peshin",
                              snapshot.data![index]!.times!.peshin ?? ""),
                          showDataItemCardDaily(
                              "Asr", snapshot.data![index]!.times!.asr ?? ""),
                          showDataItemCardDaily("Shom",
                              snapshot.data![index]!.times!.shomIftor ?? ""),
                          showDataItemCardDaily("Xufton",
                              snapshot.data![index]!.times!.hufton ?? ""),
                        ],
                      ),
                    ),
                  ),
                );
              },
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
