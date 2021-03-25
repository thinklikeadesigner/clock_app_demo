import 'package:clock_app_demo/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM  ').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offstetSign = '';
    if (!timezoneString.startsWith('-')) offstetSign = '+';
    print(timezoneString);

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              VerticalDivider(
                color: Colors.white54,
                width: 1,
              ),
              FlatButton(
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/clock_icon.png'),
                    SizedBox(height: 16),
                    Text(
                      'Clock',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              )
            ],
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(32),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Clock',
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                  SizedBox(height: 32),
                  Text(formattedTime,
                      style: TextStyle(color: Colors.white, fontSize: 64)),
                  Text(formattedDate,
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  ClockView(),
                  Text('Timezone',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Row(
                    children: <Widget>[
                      Icon(Icons.language, color: Colors.white),
                      SizedBox(width: 16),
                      Text('UTC' + offstetSign + timezoneString,
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
