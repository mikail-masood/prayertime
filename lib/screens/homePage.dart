import 'package:flutter/material.dart';
import 'package:prayertimes/models/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// use homepage when API is down to provide basic info.

class HomePage extends StatefulWidget {
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
        body: FutureBuilder(
      future: getPrayerTimeData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              //location, date, current, upcoming
              Padding(
                padding: EdgeInsets.only(bottom: 28.0),
                child: Container(
                  height: 235,
                  decoration: BoxDecoration(
                    color: Color(0xFF3C4982),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(left: 18.0, top: 8.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "It's Time for Maghrib",
                              style: TextStyle(
                                  color: Color(0xFFF5F5F5),
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 18.0, top: 8.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Toronto | 18 Feb 2021',
                              style: TextStyle(
                                color: Color(0xFFF5F5F5),
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 18.0, top: 8.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Up Next: Isha',
                              style: TextStyle(
                                  color: Color(0xFFF5F5F5),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: <Widget>[
                    //fajr
                    Container(
                      height: 75,
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.wb_sunny_rounded),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Fajr',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                SizedBox(
                                  width: 195,
                                ),
                                Text(
                                  snapshot.data.data.timings.fajr,
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    //dhuhr
                    Container(
                      height: 75,
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.wb_sunny),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Dhuhr',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 175,
                                ),
                                Text(
                                  snapshot.data.data.timings.dhuhr,
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    //asr
                    Container(
                      height: 75,
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.star_rate_outlined),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Asr',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Text(
                                  snapshot.data.data.timings.asr,
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    //maghrib
                    Container(
                      height: 75,
                      decoration: BoxDecoration(
                          color: Color(0xFFF4BA55),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.nights_stay_rounded,
                              color: Color(0xFFF5F5F5),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Maghrib',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color(0xffF5F5F5),
                                  ),
                                ),
                                SizedBox(
                                  width: 160,
                                ),
                                Text(
                                  snapshot.data.data.timings.maghrib,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color(0xffF5F5F5),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    //isha
                    Container(
                      height: 75,
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.nights_stay),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Isha',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                SizedBox(
                                  width: 195,
                                ),
                                Text(
                                  snapshot.data.data.timings.isha,
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              )
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
