import 'package:flutter/material.dart';

class WeeklyView extends StatefulWidget {
  @override
  _WeeklyViewState createState() => _WeeklyViewState();
}

class _WeeklyViewState extends State<WeeklyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: Navigator.of(context).pop,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.green[900],
      ),
    );
  }
}
