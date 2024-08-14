import 'package:dio/dio.dart';
import 'package:namozvaqtlari/core/constants/const_urls.dart';
import 'package:namozvaqtlari/models/daily_data_model.dart';
import 'package:namozvaqtlari/models/monthly_data_model.dart';
import 'package:namozvaqtlari/models/weekly_data_model.dart';

// https://islomapi.uz/api/present/day?region=Toshkent
class ApiService {
  static Future<DailyDataModel?> getDailyData(String region) async {
    try {
      Response res = await Dio().get("${ConstUrls.dailyUrl}$region");
      return DailyDataModel.fromJson(res.data);
    } catch (e) {
      // ignore: avoid_print
      print("ServiceApe: $e");
      return null;
    }
  }

// https://islomapi.uz/api/present/week?region=Toshkent
  static Future<List<WeeklyDataModel?>?> getWeeklyData(
      context, String region) async {
    try {
      Response res = await Dio().get("${ConstUrls.weeklyUrl}$region");
      List<WeeklyDataModel> weeklyDataModel =
          (res.data as List).map((e) => WeeklyDataModel.fromJson(e)).toList();
      return weeklyDataModel;
    } catch (e) {
      // ignore: avoid_print
      print("ServiceApe: $e");
      return null;
    }
  }

//   https://islomapi.uz/api/monthly?region=Toshkent&month=12
  static Future<List<MonthlyDataModel>?> getMonthlyData(
      String region, int month) async {
    try {
      Response res =
          await Dio().get("${ConstUrls.monthlyUrl}$region&month=$month");
      List<MonthlyDataModel> monthDataModel =
          (res.data as List).map((e) => MonthlyDataModel.fromJson(e)).toList();
      return monthDataModel;
    } catch (e) {
      // ignore: avoid_print
      print("ServiceApe: $e");
      return null;
    }
  }
}
