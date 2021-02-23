import 'package:flutter/material.dart';
import 'package:prayertimes/screens/homePage.dart';
import 'package:prayertimes/utilities/timeTest.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/locationSelector.dart';
import '../widgets/dailyView.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (getLocationData().toString == null) {
      return LocationSelector();
    } else {
      return TimeTest();
    }
  }

  getLocationData() async {
    SharedPreferences locationCity = await SharedPreferences.getInstance();
    SharedPreferences locationCountry = await SharedPreferences.getInstance();
    String currentCity = locationCity.getString("currentCity");
    String currentCountry = locationCountry.getString("currentCountry");
    return [currentCity, currentCountry];
  }
}
