class TransactionModel {
  final String id;
  final double amount;
  final DateTime date;
  final String description;
  final String? descriptionTransaction;
  final String destinationPhone;
  final String status;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.description,
    required this.destinationPhone,
    this.descriptionTransaction,
    String? status,
  }) : status = status ?? 'pending';

  Map<String, dynamic> toMap() => {
    'id': id,
    'amount': amount,
    'date': date.toIso8601String(),
    'description': description,
    'destinationPhone': destinationPhone,
    'descriptionTransaction': descriptionTransaction,
    'status': status,
  };

  factory TransactionModel.fromMap(Map<String, dynamic> map) =>
      TransactionModel(
        id: map['id'] ?? '',
        amount: (map['amount'] ?? 0).toDouble(),
        date: DateTime.parse(map['date']),
        description: map['description'] ?? '',
        destinationPhone: map['destinationPhone'] ?? '',
        descriptionTransaction: map['descriptionTransaction'],
        status: map['status'] ?? 'pending',
      );
}
