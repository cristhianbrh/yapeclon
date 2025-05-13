class UserModel {
  final String phone;
  final String typeDoc;
  final String document;
  final String email;
  final String password;

  UserModel({
    required this.phone,
    required this.typeDoc,
    required this.document,
    required this.email,
    required this.password,
  });

  /// Convierte un objeto UserModel a un Map para Firestore
  Map<String, dynamic> toMap() => {
    'phone': phone,
    'type_doc': typeDoc,
    'document': document,
    'email': email,
    'password': password,
  };

  /// Crea un UserModel desde un Map de Firestore
  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    phone: map['phone'] ?? '',
    typeDoc: map['type_doc'] ?? '',
    document: map['document'] ?? '',
    email: map['email'] ?? '',
    password: map['password'] ?? '',
  );
}
