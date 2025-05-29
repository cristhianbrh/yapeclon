import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yapeclon/data/models/transaction_model.dart';
import 'package:yapeclon/data/models/user_model.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  Future<void> addUser(UserModel user) async {
    await _db.collection("users").add(user.toMap());
  }

  Future<List<UserModel>> getUsers() async {
    final snapshot = await _db.collection("users").get();
    return snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList();
  }

  Future<UserModel?> getUserByEmailAndPassword(
    String email,
    String password,
  ) async {
    final snapshot =
        await _db
            .collection("users")
            .where("email", isEqualTo: email)
            .where("password", isEqualTo: password)
            .get();

    if (snapshot.docs.isNotEmpty) {
      // Usuario encontrado
      return UserModel.fromMap(snapshot.docs.first.data());
    } else {
      // No encontrado
      return null;
    }
  }

  Future<void> addTransactionToUser(String userId, TransactionModel trx) async {
    final userRef = _db.collection('users').doc(userId);

    await userRef.update({
      'transactions': FieldValue.arrayUnion([trx.toMap()]),
    });
  }
}
