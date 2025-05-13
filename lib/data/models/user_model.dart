class UserModel {
  final String phone;
  final String typeDoc;
  final String document;
  final String email;
  final String password;
  final String fullName;
  final double money;

  UserModel({
    required this.phone,
    required this.typeDoc,
    required this.document,
    required this.email,
    required this.password,
    required this.fullName,
    this.money = 0.0,
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
  );
}
