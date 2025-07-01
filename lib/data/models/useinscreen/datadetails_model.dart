class DatadetailsModel {
  final DateTime date;
  final String nameUser;
  final String? description;
  final String codeSecurity;
  final String phone;
  final String operation;
  final double ammount;

  DatadetailsModel({
    required this.date,
    required this.nameUser,
    required this.codeSecurity,
    required this.phone,
    required this.operation,
    required this.ammount,
    this.description,
  });
}
