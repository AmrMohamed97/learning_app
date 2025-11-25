import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/wallet/presentation/widgets/transactions_list_widget.dart';

class TransactionInfoBottomSheet extends StatelessWidget {
  final PaymentTransaction transaction;
  const TransactionInfoBottomSheet({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 16,
          top: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .2,
              height: 3,
              decoration: BoxDecoration(
                color: MyColors.darkBlueDarkActive,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 24),
              Align(
              alignment: AlignmentDirectional.topStart,
              child: Text("تفاصيل العملية", style: AppTextStyle.font20SemiBold),
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                _buildTransactionInfoItem(
                  "رقم المعاملة",
                  transaction.transactionId,
                ),
                _buildTransactionInfoItem(
                  "الإبن / الإبنة",
                  transaction.childName,
                ),
                _buildTransactionInfoItem(
                  "تاريخ العملية",
                  DateFormat('MMM d, yyyy').format(transaction.date),
                ),
                _buildTransactionInfoItem(
                  "زمن العملية",
                  DateFormat('hh:mm a').format(transaction.date),
                ),
                _buildTransactionInfoItem(
                  "نوع المعاملة",
                  transaction.type.nameArabic(),
                ),
                const SizedBox(height: 8),
                const DottedLine(),
                const SizedBox(height: 8),
                _buildTransactionInfoItem(
                  "المبلغ",
                  (transaction.amount - transaction.serviceFee).toStringAsFixed(
                    2,
                  ),
                  true,
                ),
                _buildTransactionInfoItem(
                  "رسوم الخدمة",
                  transaction.serviceFee.toStringAsFixed(2),
                  true,
                ),
                _buildTransactionInfoItem(
                  "الإجمالي",
                  transaction.amount.toStringAsFixed(2),
                  true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionInfoItem(
    String title,
    String info, [
    bool isAmount = false,
  ]) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Expanded(child: Text(title, style: AppTextStyle.font16Regular)),
          Text(info, style: AppTextStyle.font16Regular),
          if (isAmount)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: Image.asset(Assets.assetsImagesPngSAR),
            ),
        ],
      ),
    );
  }
}
