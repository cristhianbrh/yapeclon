import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:yapeclon/data/models/contact_user.dart';
import 'package:yapeclon/data/models/user_model.dart';
import 'package:yapeclon/data/services/firestore_service.dart';

class ContactViewWidget extends StatelessWidget {
  final Contact contact;
  final UserModel user;
  final BuildContext contextParent;
  const ContactViewWidget(
    this.contact,
    this.user,
    this.contextParent, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contact.displayName,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Text(
                contact.phones.isNotEmpty ? contact.phones.first.number : '',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () async {
                FirestoreService fs = FirestoreService();
                UserModel? userEnv = await fs.getUserByNumber(
                  contact.phones.isNotEmpty
                      ? contact.phones.first.number.replaceFirst("+51", "")
                      : '',
                );
                if (userEnv != null) {
                  Navigator.pushNamed(
                    contextParent,
                    "/yapear",
                    arguments: ContactUserArgs(
                      contact: contact,
                      user: user,
                      userRecept: userEnv,
                      cantidad: null,
                      date: null,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(contextParent).showSnackBar(
                    SnackBar(
                      content: Text("El usuario no tiene Yape."),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              behavior: HitTestBehavior.translucent,
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
