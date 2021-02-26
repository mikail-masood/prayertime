import 'package:flutter/material.dart';
import 'package:prayertimes/depreciatedAPI/time.dart';
import 'prayerTimeService.dart';

class TimeTest extends StatefulWidget {
  @override
  _TimeTestState createState() => _TimeTestState();
}

class _TimeTestState extends State<TimeTest> {
  Future<PrayerTimesResult> futureTimes;
  final prayerService = PrayerTimeService();

  @override
  void initState() {
    super.initState();
    futureTimes = prayerService.getPrayerTimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<PrayerTimesResult>(
          future: futureTimes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.prayerTimes.dateAndTime.dailyTimes.fajr);
            } else if (snapshot.hasData) {
              print('snapshot has data');
            } else if (snapshot.hasError) {
              print('snapshot error');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
