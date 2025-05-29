import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:yapeclon/data/models/user_model.dart';

class ContactUserArgs {
  final Contact contact;
  final UserModel user;
  final UserModel userRecept;

  ContactUserArgs({
    required this.contact,
    required this.user,
    required this.userRecept,
  });
}
