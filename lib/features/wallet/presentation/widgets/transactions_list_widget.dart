import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/widgets/title_tale.dart';
import 'package:talamiz_arina/features/wallet/presentation/widgets/empty_transactions_widget.dart';
import 'package:talamiz_arina/features/wallet/presentation/widgets/transaction_item_widget.dart';

class TransactionsListWidget extends StatelessWidget {
  // final List<PaymentTransaction> transactions;
  const TransactionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      PaymentTransaction(
        amount: 80,
        title: 'دفع حصة رياضيات',
        date: DateTime(2025, 11, 19, 5, 30),
        status: TransactionStatus.completed,
        type: TransactionType.classPayment,
        serviceFee: 10,
        transactionId: '123456789',
        childName: 'محمد',
      ),
      PaymentTransaction(
        amount: 60,
        title: 'دفع حصة رياضيات',
        date: DateTime(2025, 11, 15, 5, 30),
        status: TransactionStatus.completed,
        type: TransactionType.classPayment,
        transactionId: '123456789',
        childName: 'محمد',
        serviceFee: 10,
      ),
      PaymentTransaction(
        amount: 80,
        title: 'دفع حصة رياضيات',
        date: DateTime(2025, 11, 12, 5, 30),
        status: TransactionStatus.failed,
        type: TransactionType.classPayment,
        transactionId: '123456789',
        childName: 'محمد',
        serviceFee: 10,
      ),
      PaymentTransaction(
        amount: 400,
        title: 'شحن المحفظة',
        date: DateTime(2025, 11, 5, 5, 30),
        status: TransactionStatus.completed,
        type: TransactionType.walletCharge,
        transactionId: '123456789',
        childName: 'محمد',
        serviceFee: 10,
      ),
    ];
    return Column(
      children: [
        TitleTale(title: "المعاملات", option: "مشاهدة الكل", onPressed: () {}),
        const SizedBox(height: 20),
        transactions.isEmpty
            ? const EmptyTransactionsWidget()
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return TransactionItemWidget(
                    transaction: transactions[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    endIndent: 16,
                    indent: 16,
                    height: 1,
                    color: MyColors.darkBlueNormal,
                  );
                },
              ),
      ],
    );
  }
}

class PaymentTransaction {
  final double amount;
  final String title;
  final String transactionId;
  final String childName;
  final DateTime date;
  final TransactionStatus status;
  final TransactionType type;
  final double serviceFee;

  PaymentTransaction({
    required this.amount,
    required this.title,
    required this.date,
    required this.status,
    required this.type,
    required this.serviceFee,
    required this.transactionId,
    required this.childName,
  });

  // Factory constructor to create from JSON
  factory PaymentTransaction.fromJson(Map<String, dynamic> json) {
    return PaymentTransaction(
      amount: json['amount']?.toDouble() ?? 0.0,
      title: json['title'] ?? '',
      date: DateTime.parse(json['date']),
      status: TransactionStatus.fromString(json['status']),
      type: TransactionType.fromString(json['type']),
      serviceFee: json['serviceFee']?.toDouble() ?? 0.0,
      transactionId: json['transactionId'] ?? '',
      childName: json['childName'] ?? '',
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'title': title,
      'date': date.toIso8601String(),
      'status': status.toArabic(),
      'type': type.name,
      'serviceFee': serviceFee,
      'transactionId': transactionId,
      'childName': childName,
    };
  }

  // Copy with method for immutability
  PaymentTransaction copyWith({
    double? amount,
    String? title,
    DateTime? date,
    TransactionStatus? status,
    TransactionType? type,
    double? serviceFee,
    String? transactionId,
    String? childName,
  }) {
    return PaymentTransaction(
      amount: amount ?? this.amount,
      title: title ?? this.title,
      date: date ?? this.date,
      status: status ?? this.status,
      type: type ?? this.type,
      serviceFee: serviceFee ?? this.serviceFee,
      transactionId: transactionId ?? this.transactionId,
      childName: childName ?? this.childName,
    );
  }
}

enum TransactionStatus {
  completed,
  failed,
  pending;

  String toArabic() {
    switch (this) {
      case TransactionStatus.completed:
        return 'مكتملة';
      case TransactionStatus.failed:
        return 'فشلت';
      case TransactionStatus.pending:
        return 'قيد الانتظار';
    }
  }

  static TransactionStatus fromString(String status) {
    switch (status) {
      case 'مكتملة':
      case 'completed':
        return TransactionStatus.completed;
      case 'فشلت':
      case 'failed':
        return TransactionStatus.failed;
      case 'قيد الانتظار':
      case 'pending':
        return TransactionStatus.pending;
      default:
        return TransactionStatus.pending;
    }
  }
}

enum TransactionType {
  classPayment,
  walletCharge;

  String nameEn() {
    switch (this) {
      case TransactionType.classPayment:
        return 'classPayment';
      case TransactionType.walletCharge:
        return 'walletCharge';
    }
  }

  String nameArabic() {
    switch (this) {
      case TransactionType.classPayment:
        return 'دفع حصة';
      case TransactionType.walletCharge:
        return 'شحن المحفظة';
    }
  }

  static TransactionType fromString(String type) {
    if (type.contains('الصف') || type.contains('class')) {
      return TransactionType.classPayment;
    } else if (type.contains('محفظة') || type.contains('wallet')) {
      return TransactionType.walletCharge;
    }
    return TransactionType.classPayment;
  }
}
