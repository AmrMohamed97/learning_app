import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/wallet/presentation/widgets/transaction_info_bottom_sheet.dart';
import 'package:talamiz_arina/features/wallet/presentation/widgets/transactions_list_widget.dart';

class TransactionItemWidget extends StatelessWidget {
  final PaymentTransaction transaction;
  const TransactionItemWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return TransactionInfoBottomSheet(transaction: transaction);
          },
        );
      },
      leading: CircleAvatar(
        radius: 24,
        child: Image.asset(
          width: 24,
          height: 24,
          transaction.type == TransactionType.classPayment
              ? Assets.assetsImagesPngClassesTransaction
              : Assets.assetsImagesPngWalletTransaction,
        ),
      ),
      title: Text(transaction.title),
      subtitle: Row(
        children: [
          CircleAvatar(
            radius: 3,
            backgroundColor: transaction.status == TransactionStatus.pending
                ? Colors.amber
                : transaction.status == TransactionStatus.failed
                ? Colors.red
                : Colors.green,
          ),
          const SizedBox(width: 4),
          Text(
            transaction.status.toArabic(),
            style: TextStyle(
              color: transaction.status == TransactionStatus.pending
                  ? Colors.amber
                  : transaction.status == TransactionStatus.failed
                  ? Colors.red
                  : Colors.green,
            ),
          ),
          const SizedBox(width: 8),
          Text(DateFormat('MMM d, yyyy').format(transaction.date)),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(transaction.amount.toString(), style: AppTextStyle.font16Medium),
          const SizedBox(width: 4),
          Image.asset(width: 15, height: 15, Assets.assetsImagesPngSAR),
        ],
      ),
    );
  }
}
