import 'package:yapeclon/data/models/user_model.dart';
import 'package:yapeclon/data/services/firestore_service.dart';

class AuthController {
  final FirestoreService _service = FirestoreService();

  Future<void> registerUser(UserModel user) async {
    await _service.addUser(user);
  }
}
