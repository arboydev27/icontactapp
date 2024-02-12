// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddContactPage extends StatelessWidget {
  const AddContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Place to add photo of a new contact
            Expanded(
              child: Stack(
                children: [
                  
                  Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.purple.shade700,
                        Colors.white,
                      ]
                    ),
                  ),
                ),
                
                Align(
                  alignment: Alignment.center,
                  heightFactor: 1.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 110),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          foregroundImage: AssetImage('lib/images/AddUser.jpg'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple[900],
                          ),
                          onPressed: () {}, 
                          child: Text("Add Photo",
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                          ),
                          )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50), // Brings down the buttons a bit down inside the UI
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // This puts space between the two buttons
                          children: [
                  
                            // Cancel button
                            Container(
                              width: 88,
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple[900],
                                ),
                                onPressed: () {}, 
                                child: Text("Cancel",
                                style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 11, color: Colors.white)),
                                ),
                                ),
                            ),
                        
                            
                            // Done button
                            Container(
                              width: 78,
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple[900],
                                ),
                                onPressed: () {}, 
                                child: Text("Done",
                                style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 11, color: Colors.white)),
                                ),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                
                ]
              ),
            ),

            // Place to add new contact information
            Expanded(
              //flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Colors.purple.shade900,
                ),
              ),
            )
          ],
        ),
        ),
    );
  }
}