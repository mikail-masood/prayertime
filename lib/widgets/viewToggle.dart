import 'package:flutter/material.dart';

class ViewToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              height: 75.0,
              width: 150.0,
              decoration: BoxDecoration(
                color: Color(0xFF527D6E),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF527D6E).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Text(
                'Weekly',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              height: 75.0,
              width: 150.0,
              decoration: BoxDecoration(
                color: Color(0xFF527D6E),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF527D6E).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Text(
                'Monthly',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
