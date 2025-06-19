import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:yapeclon/data/models/contact_user.dart';
import 'package:yapeclon/data/models/user_model.dart';
import 'package:yapeclon/data/services/firestore_service.dart';

class NewNumberViewWidget extends StatelessWidget {
  final String number;
  final UserModel user;
  final BuildContext contextParent;
  const NewNumberViewWidget(
    this.number,
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
      child: ListTile(
        title: Text('Nuevo número'),
        subtitle: Text(number),
        onTap: () async {
          FirestoreService fs = FirestoreService();
          UserModel? userEnv = await fs.getUserByNumber(
            number.replaceFirst("+51", ""),
          );
          if (userEnv != null) {
            Navigator.pushNamed(
              contextParent,
              "/yapear",
              arguments: ContactUserArgs(
                contact:
                    Contact()
                      ..displayName = userEnv.fullName
                      ..phones = [Phone(number)],
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
      ),
    );
  }
}
