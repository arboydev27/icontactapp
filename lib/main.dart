// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:icontactapp/pages/addcontact_page.dart';
import 'package:icontactapp/pages/contact_page.dart';
import 'package:icontactapp/pages/home_page.dart';
import 'package:icontactapp/pages/keypad_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/contactpage': (context) => ContactPage(),
        '/keypadpage': (context) => KeypadPage(),
        '/addcontactpage': (context) => AddContactPage(),
      },
    );
  }
}