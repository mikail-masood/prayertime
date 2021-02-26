import 'package:prayertimes/depreciatedAPI/time.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:async';

class PrayerTimeService {
  Future<PrayerTimesResult> getPrayerTimes() async {
    var response = await http.get(
        'https://api.prayer.zone/v2/times/today.json?city=toronto&school=0&key=MagicKey');
    if (response.statusCode == 200) {
      return PrayerTimesResult.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
  }
}
