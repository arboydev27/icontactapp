// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable, unused_field, empty_statements

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeypadPage extends StatefulWidget {
  const KeypadPage({super.key});

  @override
  State<KeypadPage> createState() => _KeypadPageState();
}

class _KeypadPageState extends State<KeypadPage> {
  // Value entered by the user as a result of the key press
  String _enteredValue ='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Align(
            alignment: Alignment(0, 1.5),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 15.0,
              ),
            
              itemCount: 15,
              itemBuilder: (BuildContext context, int index ) {
                // Returning a grid tile/ button 1
                if (index == 0){
                  return GridTile(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2D0C57),
                      ),
                      onPressed: () {
                        setState(() {
                          _enteredValue = '1';
                        });
                      }, 
                      child: Text("1", style:GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 30, color: Colors.white) ),
                              ),
                    ),
                  );
                }
                else if (index == 1) {
                  return GridTile(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2D0C57),
                      ),
                      onPressed: () {
                        setState(() {
                          _enteredValue = '2';
                        });
                      },
                      child: Text("2", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),),
                    ),
                    );
                }
                else if (index == 2) {
                  return GridTile(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2D0C57),
                      ),
                      onPressed: () {
                        setState(() {
                          _enteredValue = '3';
                        });
                      },
                      child: Text("3", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),),
                    ),
                    );
                }
                else if (index == 3) {
                  return GridTile(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2D0C57),
                      ),
                      onPressed: () {
                        setState(() {
                          _enteredValue = '3';
                        });
                      },
                      child: Text("3", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),),
                    ),
                    );
                }
                else if (index == 4) {
                  return GridTile(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2D0C57),
                      ),
                      onPressed: () {
                        setState(() {
                          _enteredValue = '5';
                        });
                      },
                      child: Text("5", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),),
                    ),
                    );
                }
                else if (index == 5) {
                  return GridTile(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2D0C57),
                      ),
                      onPressed: () {
                        setState(() {
                          _enteredValue = '6';
                        });
                      },
                      child: Text("6", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),),
                    ),
                    );
                }
                else if (index == 6) {
                  return GridTile(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2D0C57),
                      ),
                      onPressed: () {
                        setState(() {
                          _enteredValue = '7';
                        });
                      },
                      child: Text("7", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),),
                    ),
                    );
                }
                else if (index == 7) {
                  return GridTile(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2D0C57),
                      ),
                      onPressed: () {
                        setState(() {
                          _enteredValue = '8';
                        });
                      },
                      child: Text("8", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),),
                    ),
                    );
                }
                else if (index == 8) {
                  return GridTile(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2D0C57),
                      ),
                      onPressed: () {
                        setState(() {
                          _enteredValue = '9';
                        });
                      },
                      child: Text("9", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),),
                    ),
                    );
                }
                else if (index == 9) {
                  return GridTile(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2D0C57),
                      ),
                      onPressed: () {
                        setState(() {
                          _enteredValue = '*';
                        });
                      },
                      child: Text("*", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),),
                    ),
                    );
                }
                else if (index == 10) {
                  return GridTile(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2D0C57),
                      ),
                      onPressed: () {
                        setState(() {
                          _enteredValue = '0';
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          _enteredValue = '+';
                        });
                      },
                      child: Text("0", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),),
                    ),
                    );
                }
                else if (index == 11) {
                  return GridTile(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2D0C57),
                      ),
                      onPressed: () {
                        setState(() {
                          _enteredValue = '#';
                        });
                      },
                      child: Text("#", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),),
                    ),
                    );
                }
                else if (index == 12) {
                  return GridTile(
                      child: Text("#", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),),
                    );
                }
                
                
                else if (index == 13) {
                  return GridTile(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreenAccent[700],
                      ),
                      onPressed: () {
                        setState(() {
                          _enteredValue = '';
                        });
                      },
                      child: Icon(Icons.phone_in_talk_rounded, size: 40,color: Colors.white,),
                      ),
                    );
                }
                else if (index == 14){}
              },
                  ),
          ),
        ),
    )
    );
  }
}