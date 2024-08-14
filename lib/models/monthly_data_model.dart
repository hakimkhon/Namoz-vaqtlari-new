class MonthlyDataModel {
    String? region;
    int? regionNumber;
    int? month;
    int? day;
    DateTime? date;
    HijriDate? hijriDate;
    String? weekday;
    Times? times;

    MonthlyDataModel({
        this.region,
        this.regionNumber,
        this.month,
        this.day,
        this.date,
        this.hijriDate,
        this.weekday,
        this.times,
    });

    factory MonthlyDataModel.fromJson(Map<String, dynamic> json) => MonthlyDataModel(
        region: json["region"],
        regionNumber: json["regionNumber"],
        month: json["month"],
        day: json["day"],
        date: DateTime.parse(json["date"]),
        hijriDate: HijriDate.fromJson(json["hijri_date"]),
        weekday: json["weekday"],
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

