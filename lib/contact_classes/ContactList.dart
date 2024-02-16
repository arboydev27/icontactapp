
import 'package:icontactapp/contact_classes/Contact.dart';

class ContactList {
  final List<Contact> _contacts = [];


  void addContact(Contact contact) {
    _contacts.add(contact);
  }

  void removeContact(Contact contact) {
    _contacts.remove(contact);
  }

  List<Contact> getContacts() {
    return _contacts;
  }
}