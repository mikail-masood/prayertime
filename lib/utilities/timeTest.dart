import 'package:flutter/material.dart';
import 'package:prayertimes/models/time.dart';
import '../services/prayerTimeService.dart';

class TimeTest extends StatefulWidget {
  @override
  _TimeTestState createState() => _TimeTestState();
}

class _TimeTestState extends State<TimeTest> {
  final prayerService = PrayerTimeService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<PrayerTimes>>(
          future: prayerService.getPrayerTimes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
            } else {
              print('snapshot error');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
