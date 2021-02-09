import 'package:flutter/material.dart';

class LocationSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Choose your country',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.25,
            height: 45,
            color: Colors.grey,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'Choose your city',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.25,
            height: 45,
            color: Colors.grey,
          ),
          SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: Navigator.of(context).pop,
                child: Icon(Icons.arrow_back),
              ),
              RaisedButton(
                onPressed: null,
                child: Icon(Icons.send),
              ),
            ],
          )
        ],
      ),
    );
  }
}
