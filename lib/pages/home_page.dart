// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icontactapp/pages/addcontact_page.dart';
import 'package:icontactapp/pages/contact_page.dart';
import 'package:icontactapp/pages/keypad_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    /*
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    */
    FlutterNativeSplash.remove();
  }



  // this keeps track of the current pageto display
  int _selectedIndex = 0;

  // A method that updates the new selected index
  void _navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    // Contact page
    ContactPage(),

     // Add contact page
    AddContactPage(),

    // Home page
    KeypadPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // App Bar named "Contacts"
      // the _selectedIndex == 1 ? AppBar(): null, sets the AppBar so that when another page is opened, the AppBar disappears
      appBar: _selectedIndex == 0 ? AppBar(
        title: Text("Contacts", 
        style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ),
      ): null,

      //Curved bottom navigation bar
      bottomNavigationBar: 
      CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xFFBE8AFF),
        animationDuration: Duration(milliseconds: 200),
        index: _selectedIndex, 
        onTap: _navigationBottomBar,
        items: [
          Icon(Icons.account_circle_outlined, size: 30, color: Colors.purple[900],),
          Icon(Icons.add_circle_outline, size: 30, color: Colors.purple[900],),
          Icon(Icons.apps_rounded, size: 30, color: Colors.purple[900],),
        ],

      ),

      body: _pages[_selectedIndex],

    );
  }
}