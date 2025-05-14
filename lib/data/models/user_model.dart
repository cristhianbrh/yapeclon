import 'package:yapeclon/data/models/transaction_model.dart';

class UserModel {
  final String phone;
  final String typeDoc;
  final String document;
  final String email;
  final String password;
  final String fullName;
  final double money;
  final List<TransactionModel> transactions;

  UserModel({
    required this.phone,
    required this.typeDoc,
    required this.document,
    required this.email,
    required this.password,
    required this.fullName,
    this.money = 50.0,
    this.transactions = const [],
  });

  /// Convierte un objeto UserModel a un Map para Firestore
  Map<String, dynamic> toMap() => {
    'phone': phone,
    'type_doc': typeDoc,
    'document': document,
    'email': email,
    'password': password,
    'full_name': fullName,
    'money': money,
    'transactions': transactions.map((t) => t.toMap()).toList(),
  };

  /// Crea un UserModel desde un Map de Firestore
  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    phone: map['phone'] ?? '',
    typeDoc: map['type_doc'] ?? '',
    document: map['document'] ?? '',
    email: map['email'] ?? '',
    password: map['password'] ?? '',
    fullName: map['full_name'] ?? '',
    money: (map['money'] ?? 0).toDouble(),
    transactions:
        (map['transactions'] as List<dynamic>? ?? [])
            .map((t) => TransactionModel.fromMap(t))
            .toList(),
  );
}
