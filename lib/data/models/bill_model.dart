import 'package:equatable/equatable.dart';

class BillModel extends Equatable {
  final String id;
  final String accountName;
  final String amount;
  final String dueDate;
  final String logoUrl;

  const BillModel({
    required this.id,
    required this.accountName,
    required this.amount,
    required this.dueDate,
    required this.logoUrl,
  });

  factory BillModel.fromJson(Map<String, dynamic> json) {
    return BillModel(
      id: json['id'] as String? ?? '',
      accountName: json['accountName'] as String? ?? '',
      amount: json['amount'] as String? ?? '',
      dueDate: json['dueDate'] as String? ?? '',
      logoUrl: json['logoUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'accountName': accountName,
      'amount': amount,
      'dueDate': dueDate,
      'logoUrl': logoUrl,
    };
  }

  @override
  List<Object?> get props => [id, accountName, amount, dueDate, logoUrl];
}
