// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:icontactapp/contact_classes/Contact.dart';
import 'package:icontactapp/pages/individual_contact.dart';


class ContactPage extends StatefulWidget {

  const ContactPage({
    super.key,
    });

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final ValueNotifier<int> _contactChangeNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final contactsBox = Hive.box<Contact>('contacts');
    final contacts = contactsBox.values.toList();



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
                    color: Color(0xFFE2CCFF),
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
              child: ValueListenableBuilder(
                valueListenable: _contactChangeNotifier,
                builder: (contex, value, child) {

                  final contacts = contactsBox.values.toList();
                  // Sort the contacts by name A-Z
                  contacts.sort((a, b) => a.name.compareTo(b.name));
                  
                return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IndividualContactPage(contact: contact,
                          contactChangeNotifier: _contactChangeNotifier,
                          ),
                          ),
                          );

                          if (result != null && result) {
                            setState(() {});
                          }
                      },
                      child: ListTile(
                        title: Text(
                          contact.name,
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 14)),
                            ),
                            ),
                    );
                  }
                          );
                }

            ),
      ),
          )
        ]
      )
    );
  }
}