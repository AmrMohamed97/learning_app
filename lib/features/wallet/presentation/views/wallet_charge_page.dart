import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/payment/data/models/payment_method.dart';
import 'package:talamiz_arina/features/payment/presentation/widgets/select_payment_method.dart';
import 'package:talamiz_arina/features/payment/presentation/widgets/stc_bottom_sheet_modal.dart';
import 'package:talamiz_arina/features/wallet/presentation/manager/wallet_cubit.dart';
import 'package:talamiz_arina/features/wallet/presentation/widgets/select_charge_amount_widget.dart';

class WalletChargePage extends StatelessWidget {
  const WalletChargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ValueListenableBuilder(
            valueListenable: context.read<WalletCubit>().isButtonEnabled,
            builder: (context, value, child) {
              return MyButton(
                text: "متابعة",
                onPressed: value
                    ? () {
                        if (context
                                .read<WalletCubit>()
                                .selectedPaymentMethod
                                .value ==
                            PaymentMethod.stc) {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const StcBottomSheetModal();
                            },
                          );
                        }
                      }
                    : null,
              );
            },
          ),
        ),
      ),
      backGroundColor: Colors.white,
      appBar: AppBar(title: const Text("شحن المحفظة")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SelectChargeAmountWidget(),
              const SizedBox(height: 24),
              SelectPaymentMethod(
                onPaymentSelected: (value) {
                  context.read<WalletCubit>().selectedPaymentMethod.value = value;
                  context.read<WalletCubit>().isButtonEnabled.value = context
                      .read<WalletCubit>()
                      .formKey
                      .currentState!
                      .validate();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
