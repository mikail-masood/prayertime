import 'package:flutter/material.dart';
import 'package:prayertimes/widgets/viewToggle.dart';
import '../data.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

class DailyView extends StatefulWidget {
  @override
  _DailyViewState createState() => _DailyViewState();
}

class _DailyViewState extends State<DailyView> {
  Data list;

  static String city = 'Toronto';
  static String country = 'Canada';
  static int method = 1;

  final String url =
      'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method';

  Future getPrayerTimeData() async {
    http.Response res = await http.get(Uri.encodeFull(url), headers: {
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });
    final data = jsonDecode(res.body);

    list = Data.fromJson(data);

    return list;
  }

  bool valueFajr = false;
  bool valueDhuhr = false;
  bool valueAsr = false;
  bool valueMaghrib = false;
  bool valueIsha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPrayerTimeData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 54.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        city,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 18.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${snapshot.data.data.date.hijri.day} ${snapshot.data.data.date.hijri.month.en}, ${snapshot.data.data.date.hijri.year}',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFF232526), Color(0xFF414345)]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            )
                          ]),
                      padding: EdgeInsets.all(22.0),
                      child: Column(
                        children: <Widget>[
                          CheckboxListTile(
                            checkColor: Color(0xFF527D6E),
                            activeColor: Colors.white,
                            secondary: Icon(
                              Icons.alarm_on,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Fajr at ${snapshot.data.data.timings.fajr}',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: this.valueFajr,
                            onChanged: (bool value) {
                              setState(() {
                                this.valueFajr = value;
                                scheduleNotifs();
                              });
                            },
                          ),
                          CheckboxListTile(
                            checkColor: Color(0xFF527D6E),
                            activeColor: Colors.white,
                            secondary: Icon(
                              Icons.alarm_on,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Dhuhr at ${snapshot.data.data.timings.dhuhr}',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: this.valueDhuhr,
                            onChanged: (bool value) {
                              setState(() {
                                this.valueDhuhr = value;
                              });
                            },
                          ),
                          CheckboxListTile(
                            checkColor: Color(0xFF527D6E),
                            activeColor: Colors.white,
                            secondary:
                                Icon(Icons.alarm_on, color: Colors.white),
                            title: Text(
                              'Asr at ${snapshot.data.data.timings.asr}',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: this.valueAsr,
                            onChanged: (bool value) {
                              setState(() {
                                this.valueAsr = value;
                              });
                            },
                          ),
                          CheckboxListTile(
                            checkColor: Color(0xFF527D6E),
                            activeColor: Colors.white,
                            secondary:
                                Icon(Icons.alarm_on, color: Colors.white),
                            title: Text(
                              'Maghrib at ${snapshot.data.data.timings.maghrib}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            value: this.valueMaghrib,
                            onChanged: (bool value) {
                              setState(() {
                                this.valueMaghrib = value;
                              });
                            },
                          ),
                          CheckboxListTile(
                            checkColor: Color(0xFF527D6E),
                            activeColor: Colors.white,
                            secondary: Icon(
                              Icons.alarm_on,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Isha at ${snapshot.data.data.timings.isha}',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: this.valueIsha,
                            onChanged: (bool value) {
                              setState(() {
                                this.valueIsha = value;
                              });
                            },
                          ),
                        ],
                      )),
                  ViewToggle(),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void scheduleNotifs() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 10));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'codex_logo',
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Fajr Time',
        'Good morning, its time to pray hoe',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }
}
