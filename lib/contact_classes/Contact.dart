import 'package:hive/hive.dart';

part 'Contact.g.dart'; // Name of the generated TypeAdapter

@HiveType(typeId: 0)
class Contact extends HiveObject {

  @HiveField(0)
  String name;
  
  @HiveField(1)
  String number;

  @HiveField(2)
  String positionAndCompany;

  @HiveField(3)
  String email;

  @HiveField(4)
  String website;

  @HiveField(5)
  String address;

  Contact({
    required this.name,
    required this.number,
    required this.positionAndCompany,
    required this.email,
    required this.website,
    required this.address,
  });
}
