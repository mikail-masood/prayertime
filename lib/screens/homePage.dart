import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PrayTime'),
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder(
          future: getPrayerTimeData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text('Fajr'),
                              Text('Dhuhr'),
                              Text('Asr'),
                              Text('Maghrib'),
                              Text('Isha'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(snapshot.data.data.timings.fajr),
                              Text(snapshot.data.data.timings.dhuhr),
                              Text(snapshot.data.data.timings.asr),
                              Text(snapshot.data.data.timings.maghrib),
                              Text(snapshot.data.data.timings.isha),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
