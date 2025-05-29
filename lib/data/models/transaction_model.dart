class TransactionModel {
  final String id;
  final double amount;
  final DateTime date;
  final String description;
  final String destinationPhone;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.description,
    required this.destinationPhone,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'amount': amount,
    'date': date.toIso8601String(),
    'description': description,
    'destinationPhone': destinationPhone,
  };

  factory TransactionModel.fromMap(Map<String, dynamic> map) =>
      TransactionModel(
        id: map['id'] ?? '',
        amount: (map['amount'] ?? 0).toDouble(),
        date: DateTime.parse(map['date']),
        description: map['description'] ?? '',
        destinationPhone: map['destinationPhone'] ?? '',
      );
}
