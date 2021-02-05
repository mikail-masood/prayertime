import 'package:flutter/material.dart';
import 'package:prayertimes/widgets/viewToggle.dart';
import '../data.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
      appBar: AppBar(
        backgroundColor: Color(0xFF527D6E),
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: getPrayerTimeData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    child: Text(city),
                  ),
                  Container(
                    child: Text(
                        '${snapshot.data.data.date.hijri.day} ${snapshot.data.data.date.hijri.month.en}, ${snapshot.data.data.date.hijri.year}'),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xFF527D6E),
                      ),
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
}
