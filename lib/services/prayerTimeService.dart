import 'package:prayertimes/models/time.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:async';

class PrayerTimeService {
  Future<List<PrayerTimes>> getPrayerTimes() async {
    var response = await http.get(
        'https://api.prayer.zone/v2/Timess/today.json?city=toronto&school=0');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults
        .map((prayertimes) => PrayerTimes.fromJson(prayertimes))
        .toList();
  }
}
