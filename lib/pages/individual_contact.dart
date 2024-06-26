// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, unnecessary_string_interpolations, use_key_in_widget_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:icontactapp/contact_classes/Contact.dart';

class IndividualContactPage extends StatefulWidget {
  // We have to parse the contact object
  final Contact contact;
  final ValueNotifier<int> contactChangeNotifier;

  // ignore: use_key_in_widget_constructors
  // IndividualContactPage constructor with contact as a parameter
  IndividualContactPage({
    required this.contact,
    required this.contactChangeNotifier,
    });

  @override
  State<IndividualContactPage> createState() => _IndividualContactPageState();
}

class _IndividualContactPageState extends State<IndividualContactPage> {

  void removeContact(Contact contact) {
  final contactsBox = Hive.box<Contact>('contacts');
  contactsBox.delete(contact.key);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            // Place to add photo of a new contact
            Stack(
              children: [
                
                Container(
                  height: 400,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xCC6F12E7),
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
            
                      //User photos place
                      CircleAvatar(
                        radius: 60,
                        foregroundImage: AssetImage('lib/images/AddUser.jpg'),
                      ),
            
                      // User name place
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text('${widget.contact.name}', 
                        style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
            
                      // Position + Company
                      Text('${widget.contact.positionAndCompany}', 
                        style: GoogleFonts.poppins(fontSize: 16),
                        ),
            
                      // Icon button for links
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.facebook), iconSize: 30,),
                            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.instagram), iconSize: 30,),
                            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.xTwitter), iconSize: 30,),
                            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.linkedin), iconSize: 30,),
                          ],
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
                      padding: const EdgeInsets.only(top: 10), // Brings down the buttons a bit down inside the UI
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // This puts space between the two buttons
                        children: [
                
                          // Go back button
                          Container(
                            width: 88,
                            height: 30,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              }, 
                              icon: Icon(Icons.arrow_back_ios)),
                          ),
                          
                      
                          
                          // Edit button
                          Container(
                            width: 69,
                            height: 20,
                            child: ElevatedButton(
                              style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2D0C57)),
                          ),
                              onPressed: () {}, 
                              child: Text("Edit",
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

            // Place to add new contact information
            Stack(
              children: [ 
                Container(
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Color(0xFF2D0C57),
                ),
              ),

              // Mobile number section
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    
                    Text("Contact info", textAlign: TextAlign.left, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,),
                    ),

                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.phone), color: Colors.white, iconSize: 40,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Mobile", style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),),
                            Text('${widget.contact.number}', style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),),
                          ],
                        ),
                      ],
                      ),

                    SizedBox(
                        height: 20,
                      ),
                
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.email), color: Colors.white, iconSize: 40,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email", style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),),
                            Text('${widget.contact.email}', style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),),
                          ],
                        ),
                      ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.web), color: Colors.white, iconSize: 40,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Website", style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),),
                            Text('${widget.contact.website}', style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),),
                          ],
                        ),
                      ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.web), color: Colors.white, iconSize: 40,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Address", style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),),
                            Text("${widget.contact.address}", style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),),
                          ],
                        ),
                      ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        height: 30,
                        width: 138,
                        child: ElevatedButton(
                          onPressed: () {
                            removeContact(widget.contact);
                            final contactsBox = Hive.box<Contact>('contacts');
                            contactsBox.delete(widget.contact.key);
                            Navigator.pop(context);
                            widget.contactChangeNotifier.value++;
                          }, 
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade700),
                          ),
                            child: Text("Delete contact", style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),),
                          ),
                      ),

                    
                  ],
                ),
              )
              ]
            )
          ],
        ),
        ),
    );
  }
}