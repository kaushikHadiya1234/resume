import 'package:flutter/material.dart';
import 'package:prectics/Screen/dropdownbutton.dart';
import 'package:prectics/Screen/home_screen.dart';
import 'package:prectics/Screen/image.dart';
import 'package:prectics/data.dart';

import 'Screen/Resume.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => Resume(),
        'data':(context) => Data(),
        // 'view':(context)=> View()
      },
    ),
  );
}


