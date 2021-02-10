import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationSelector extends StatefulWidget {
  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  String city = '';
  String country = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                hintText: 'e.g. Canada, Pakistan',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.white, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        BorderSide(color: Colors.green[900], width: 2.0)),
              ),
              onChanged: (value) {
                setState(() => country = value);
              },
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
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                hintText: 'e.g. Toronto, Karachi',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.white, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        BorderSide(color: Colors.green[900], width: 2.0)),
              ),
              onChanged: (value) {
                setState(() => city = value);
              },
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
      ),
    );
  }

  setLocationData() async {
    SharedPreferences locationCity = await SharedPreferences.getInstance();
    SharedPreferences locationCountry = await SharedPreferences.getInstance();
    locationCity.setString("currentCity", city.toString());
    locationCountry.setString("currentCountry", country.toString());
  }
}
