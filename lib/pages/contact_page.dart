// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icontactapp/pages/addcontact_page.dart';
import 'package:icontactapp/pages/individual_contact.dart';



class ContactPage extends StatelessWidget {

  const ContactPage({
    super.key,
    });


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
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => IndividualContactPage(contact: contact,),
                        ),
                        );
                    },
                    child: ListTile(
                      title: Text(
                        contact.name,
                        style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 14)),
                          ),
                          ),
                  );
                }
          ),

            ),
      ),
        ]
      )
    );
  }
}