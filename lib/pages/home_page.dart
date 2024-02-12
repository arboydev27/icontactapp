// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
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

  // this keeps track of the current pageto display
  int _selectedIndex = 0;

  // A method that updates the new selected index
  void _navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    // Add contact page
    AddContactPage(),

    // Contact page
    ContactPage(),

    // Home page
    KeypadPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // App Bar named "Contacts"
      // the _selectedIndex == 1 ? AppBar(): null, sets the AppBar so that when another page is opened, the AppBar disappears
      appBar: _selectedIndex == 1 ? AppBar(
        title: Text("Contacts", 
        style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ),
      ): null,

      //Curved bottom navigation bar
      bottomNavigationBar: 
      CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.deepPurple.shade300,
        animationDuration: Duration(milliseconds: 200),
        index: _selectedIndex, 
        onTap: _navigationBottomBar,
        items: [
          Icon(Icons.add_circle_outline, size: 30, color: Colors.purple[900],),
          Icon(Icons.account_circle_outlined, size: 30, color: Colors.purple[900],),
          Icon(Icons.apps_rounded, size: 30, color: Colors.purple[900],),
        ],

      ),

      body: _pages[_selectedIndex],
      /*
      body: Column(
        children: [
          Center(

            // In order to stack the widgets on top of each other, we have to use a Stack
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                  height: 100,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Colors.purple[200],
                    borderRadius: BorderRadius.circular(40),
                  ),
                                ),
                ),
              
              Padding(
                padding: EdgeInsets.all(18),

                // To put the display photo next to the user contact name and "my contact cardd" we use a Row wdiget
                child: Row(
                  children:[ 
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('lib/images/Stewie.jpg'),
                                        ),
                    ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text("Stewie", 
                      style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                      ),
                  
                      Text("My contact card", 
                      style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                    ]
                  ),
                  ]
                ),
              ),

              ], 
            ),
          ),

          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(contacts[index], style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 14)),),
                ),
                ),
            ),
          ),

        ],
      ),
      */

    );
  }
}