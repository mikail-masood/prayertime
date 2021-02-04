import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data.dart';
import '../widgets/viewToggle.dart';
import '../widgets/dailyView.dart';

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
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFFFFFFF),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 24.0, right: 24.0, top: 104.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 1.25,
                      decoration: BoxDecoration(
                        color: Color(0xFF527D6E),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF527D6E).withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Checkbox(
                                    checkColor: Color(0xFF527D6E),
                                    activeColor: Colors.white,
                                    value: this.valueFajr,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valueFajr = value;
                                      });
                                    },
                                  ),
                                  Checkbox(
                                    checkColor: Color(0xFF527D6E),
                                    activeColor: Colors.white,
                                    value: this.valueDhuhr,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valueDhuhr = value;
                                      });
                                    },
                                  ),
                                  Checkbox(
                                    checkColor: Color(0xFF527D6E),
                                    activeColor: Colors.white,
                                    value: this.valueAsr,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valueAsr = value;
                                      });
                                    },
                                  ),
                                  Checkbox(
                                    checkColor: Color(0xFF527D6E),
                                    activeColor: Colors.white,
                                    value: this.valueMaghrib,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valueMaghrib = value;
                                      });
                                    },
                                  ),
                                  Checkbox(
                                    checkColor: Color(0xFF527D6E),
                                    activeColor: Colors.white,
                                    value: this.valueIsha,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valueIsha = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Fajr',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    'Dhuhr',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    'Asr',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    'Maghrib',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    'Isha',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(snapshot.data.data.timings.fajr,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xFFFFFFFF),
                                      )),
                                  Text(snapshot.data.data.timings.dhuhr,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xFFFFFFFF),
                                      )),
                                  Text(snapshot.data.data.timings.asr,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xFFFFFFFF),
                                      )),
                                  Text(snapshot.data.data.timings.maghrib,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xFFFFFFFF),
                                      )),
                                  Text(snapshot.data.data.timings.isha,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xFFFFFFFF),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ViewToggle(),
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }
}
