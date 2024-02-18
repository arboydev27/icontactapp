// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:icontactapp/contact_classes/Contact.dart';

List<Contact> contacts = [];

class AddContactPage extends StatefulWidget {


  AddContactPage({
    super.key,
    });

  

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {

// Initialize textEditingControllers
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _positionAndCompanyController = TextEditingController();
  final _emailController = TextEditingController();
  final _websiteController = TextEditingController();
  final _addressController = TextEditingController();

  //Method to add contacts to the ContactList
  void addContact() {
  final contact = Contact(
    name: _nameController.text,
    number: _numberController.text,
    positionAndCompany: _positionAndCompanyController.text,
    email: _emailController.text,
    website: _websiteController.text,
    address: _addressController.text
  );
  
  // It add the contact to the List of Contacts
  final contactsBox = Hive.box<Contact>('contacts');
  contactsBox.add(contact);

  _nameController.clear();
  _numberController.clear();
  _positionAndCompanyController.clear();
  _addressController.clear();
  _emailController.clear();
  _websiteController.clear();
}

// Disposes the textEditingControllers
  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _positionAndCompanyController.dispose();
    _emailController.dispose();
    _websiteController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              // Place to add photo of a new contact
              // Previously I had wrapped the Stack with an Expanded widget,
              // but it does not work well when I pop up th keyboard for a field entry
              // the solution was adding an actual height to the main container in the background
              // and also removing the Expanded widget and changing the body Column to body ListView
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
                        CircleAvatar(
                          radius: 60,
                          foregroundImage: AssetImage('lib/images/AddUser.jpg'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF2D0C57),
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
                        padding: const EdgeInsets.only(top: 10), // Brings down the buttons a bit down inside the UI
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // This puts space between the two buttons
                          children: [
                  
                            // Cancel button
                            Container(
                              width: 88,
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
                                child: Text("Cancel",
                                style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 11, color: Colors.white)),
                                ),
                                ),
                            ),
                        
                            
                            // Done button
                            Container(
                              width: 78,
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
                                onPressed: addContact, 
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
        
              // Place to add new contact information
              // Same problem and solution as the previous Stack of the upper Column
              Stack(
                // Deep purple container as background
                children: [Container(
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                    color: Color(0xFF2D0C57),
                  ),
                ),
              
                Padding(
                  // Padding helps the entry boxes start a bit below the end of the container curves
                  padding: const EdgeInsets.only(top: 55),
                  child: Column(
                    children: [
                      
                      // Container for Adding the full name, might add a Textfield here instead
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          //border: Border(bottom: BorderSide(color: Colors.grey.shade600))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "Add full name", hintStyle: GoogleFonts.poppins(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
              
                      // Add Company container
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          //border: Border(bottom: BorderSide(color: Colors.grey.shade600))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            controller: _numberController,
                            decoration: InputDecoration(
                              hintText: "Add number", hintStyle: GoogleFonts.poppins(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      
                      // Add Position container
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          //border: Border(bottom: BorderSide(color: Colors.grey.shade600))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            controller: _positionAndCompanyController,
                            decoration: InputDecoration(
                              hintText: "Add Position and Company", hintStyle: GoogleFonts.poppins(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
              
                      // Add email section
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                            //border: Border(bottom: BorderSide(color: Colors.grey.shade600))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: "Add email", hintStyle: GoogleFonts.poppins(fontSize: 12),
                            ),
                            ),
                          ),
                        ),
                      ),
              
                      // Add website
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Container(
                          height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey[350],
                              //border: Border(bottom: BorderSide(color: Colors.grey.shade600))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: TextField(
                                controller: _websiteController,
                                decoration: InputDecoration(
                                  hintText: "Add website", hintStyle: GoogleFonts.poppins(fontSize: 12),
                                ),
                                ),
                            ),
                        ),
                      ),
              
                      // Add address
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Container(
                          height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey[350],
                              //border: Border(bottom: BorderSide(color: Colors.grey.shade600))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: TextField(
                                controller: _addressController,
                                decoration: InputDecoration(
                                  hintText: "Add address", hintStyle: GoogleFonts.poppins(fontSize: 12),
                                ),
                                ),
                            ),
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
      ),
    );
  }
}