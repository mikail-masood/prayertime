import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

class PrayerTimesResult {
  final PrayerTimes prayerTimes;

  PrayerTimesResult({this.prayerTimes});

  factory PrayerTimesResult.fromJson(Map<String, dynamic> json) {
    return PrayerTimesResult(
        prayerTimes: PrayerTimes.fromJson(json['results']));
  }
}

class PrayerTimes {
  final DateAndTime dateAndTime;

  PrayerTimes({this.dateAndTime});

  factory PrayerTimes.fromJson(Map<String, dynamic> json) {
    return PrayerTimes(dateAndTime: DateAndTime.fromJson(json['datetime']));
  }
}

class DateAndTime {
  final DailyTimes dailyTimes;

  DateAndTime({this.dailyTimes});

  factory DateAndTime.fromJson(Map<String, dynamic> json) {
    return DateAndTime(dailyTimes: DailyTimes.fromJson(json['times']));
  }
}

class DailyTimes {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  DailyTimes({this.fajr, this.dhuhr, this.asr, this.maghrib, this.isha});

  factory DailyTimes.fromJson(Map<String, dynamic> json) {
    return DailyTimes(
      fajr: json['Fajr'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
    );
  }
}
