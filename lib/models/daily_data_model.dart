class DailyDataModel {
    String? region;
    DateTime? date;
    String? weekday;
    HijriDate? hijriDate;
    Times? times;

    DailyDataModel({
        this.region,
        this.date,
        this.weekday,
        this.hijriDate,
        this.times,
    });

    factory DailyDataModel.fromJson(Map<String, dynamic> json) => DailyDataModel(
        region: json["region"],
        date: DateTime.parse(json["date"]),
        weekday: json["weekday"],
        hijriDate: HijriDate.fromJson(json["hijri_date"]),
        times: Times.fromJson(json["times"]),
    );

}

class HijriDate {
    String? month;
    int? day;

    HijriDate({
        this.month,
        this.day,
    });

    factory HijriDate.fromJson(Map<String, dynamic> json) => HijriDate(
        month: json["month"],
        day: json["day"],
    );
}

class Times {
    String? tongSaharlik;
    String? quyosh;
    String? peshin;
    String? asr;
    String? shomIftor;
    String? hufton;

    Times({
        this.tongSaharlik,
        this.quyosh,
        this.peshin,
        this.asr,
        this.shomIftor,
        this.hufton,
    });

    factory Times.fromJson(Map<String, dynamic> json) => Times(
        tongSaharlik: json["tong_saharlik"],
        quyosh: json["quyosh"],
        peshin: json["peshin"],
        asr: json["asr"],
        shomIftor: json["shom_iftor"],
        hufton: json["hufton"],
    );
}
