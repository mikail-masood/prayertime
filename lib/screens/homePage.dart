import 'package:flutter/material.dart';

// use homepage when API is down to provide basic info.

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        //location, date, current, upcoming
        Padding(
          padding: EdgeInsets.only(bottom: 28.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black,
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      )
                    ]),
              ),
              SizedBox(
                height: 12.0,
              ),
              //dhuhr
              Container(
                height: 75,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      )
                    ]),
              ),
              SizedBox(
                height: 12.0,
              ),
              //asr
              Container(
                height: 75,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      )
                    ]),
              ),
              SizedBox(
                height: 12.0,
              ),
              //maghrib
              Container(
                height: 75,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      )
                    ]),
              ),
              SizedBox(
                height: 12.0,
              ),
              //isha
              Container(
                height: 75,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      )
                    ]),
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
