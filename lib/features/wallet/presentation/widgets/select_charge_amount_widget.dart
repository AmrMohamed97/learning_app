import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';
import 'package:talamiz_arina/features/wallet/presentation/manager/wallet_cubit.dart';

class SelectChargeAmountWidget extends StatelessWidget {
  const SelectChargeAmountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Form(
        key: context.read<WalletCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ادخل مبلغ الشحن", style: AppTextStyle.font20SemiBold),
            const SizedBox(height: 20),
            MyTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "الرجاء إدخال مبلغ الشحن";
                }
                return null;
              },
              controller: context.read<WalletCubit>().amountController,
              hintText: "ادخل مبلغ الشحن",
              suffixIcon: Image.asset(Assets.assetsImagesPngSAR),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [100, 150, 200, 250, 300]
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8),
                        child: FilterChip(
                          labelPadding: const EdgeInsets.all(4),
                          onSelected: (value) {
                            context.read<WalletCubit>().amountController.value = TextEditingValue(
                              text: e.toString(),
                            );
                          },
                          color: const WidgetStatePropertyAll(Colors.white),
                          label: Row(
                            children: [
                              Text(e.toString(), style: AppTextStyle.font16Bold),
                              const SizedBox(width: 8),
                              Image.asset(Assets.assetsImagesPngSAR),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
