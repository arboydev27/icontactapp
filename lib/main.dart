// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:icontactapp/contact_classes/Contact.dart';
import 'package:icontactapp/pages/addcontact_page.dart';
import 'package:icontactapp/pages/contact_page.dart';
import 'package:icontactapp/pages/home_page.dart';
import 'package:icontactapp/pages/keypad_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  // Initializing the Hive
  await Hive.initFlutter();
  Hive.registerAdapter(ContactAdapter());

  // Running the App
  runApp(const MyApp());

  // Close all boxes when the app is closed
  Hive.close();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Hive.openBox<Contact>('contacts'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.error != null) {
              return Text(snapshot.error.toString());
            } else {
              return HomePage();
            }
          } else {
            return Scaffold();
          }
        }
      ),
      routes: {
        '/contactpage': (context) => ContactPage(),
        '/keypadpage': (context) => KeypadPage(),
        '/addcontactpage': (context) => AddContactPage(),
      },
    );
  }
}