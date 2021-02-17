import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prayertimes/widgets/viewToggle.dart';
import '../data.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../main.dart';
import '../screens/settings.dart';
import '../widgets/locationSelector.dart';

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

  // snapshot.data.data.timings.fajr

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPrayerTimeData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.green[800],
                    ),
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0, top: 54.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Settings()));
                          },
                          child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 16.0),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '$city | $country',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 18.0),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${snapshot.data.data.date.hijri.day} ${snapshot.data.data.date.hijri.month.en}, ${snapshot.data.data.date.hijri.year}',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 18.0),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Magrib',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.yellow[600],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 18.0),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Next: Isha',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Color(0xfff6f6f6).withOpacity(0.9),
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
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'Fajr at ${snapshot.data.data.timings.fajr}',
                                    style: TextStyle(color: Colors.black),
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
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'Dhuhr at ${snapshot.data.data.timings.dhuhr}',
                                    style: TextStyle(color: Colors.black),
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
                                      Icon(Icons.alarm_on, color: Colors.black),
                                  title: Text(
                                    'Asr at ${snapshot.data.data.timings.asr}',
                                    style: TextStyle(color: Colors.black),
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
                                      Icon(Icons.alarm_on, color: Colors.black),
                                  title: Text(
                                    'Maghrib at ${snapshot.data.data.timings.maghrib}',
                                    style: TextStyle(
                                      color: Colors.black,
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
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                      'Isha at ${snapshot.data.data.timings.isha}',
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  value: this.valueIsha,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valueIsha = value;
                                    });
                                  },
                                ),
                              ],
                            )),
                      ),
                      ViewToggle(),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) =>
                                        Colors.white)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LocationSelector()));
                        },
                        child: null,
                      ),
                    ],
                  ),
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
