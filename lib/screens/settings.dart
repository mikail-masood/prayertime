import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
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
        color: Colors.pink[200],
      ),
    );
  }
}
