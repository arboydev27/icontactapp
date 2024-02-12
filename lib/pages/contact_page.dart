// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

    List contacts = [
    "Peter Griffin",
    "Lois Griffin",
    "Brian Griffin",
    "Chris Griffin",
    "Meg Griffin",
    "Glenn Quagmire",
    "Rupert",
    "Donna Tubbs-Brown",
    "Cleveland Brown",
    "Rallo Tubbs",
    "Tom Tucker",
    "Diane Simmons",
    "Tricia Takanawa",
    "Jake Tucker",
    "Carter Pewterschmidt",
    "Death",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      );
  }
}