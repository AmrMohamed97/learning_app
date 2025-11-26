import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/features/payment/data/models/payment_method.dart';
import 'package:talamiz_arina/features/payment/presentation/widgets/custom_list_tile.dart';

class SelectPaymentMethod extends StatefulWidget {
  final Function(PaymentMethod) onPaymentSelected;
  const SelectPaymentMethod({super.key, required this.onPaymentSelected});

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  final PaymentMethod creditCard = PaymentMethod.creditCard;
  final PaymentMethod stc = PaymentMethod.stc;
  String? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: RadioGroup(
        key: UniqueKey(),
        groupValue: _selectedMethod,
        onChanged: (value) {
          setState(() {
            _selectedMethod = value;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomListTile(
              value: creditCard.name,
              title: Row(
                mainAxisSize: .min,
                children: [
                  const Text("بطاقة الائتمان/الخصم "),
                  const SizedBox(width: 3),
                  Image.asset(
                    width: 24,
                    height: 24,
                    Assets.assetsImagesPngMada,
                  ),
                  const SizedBox(width: 3),
                  Image.asset(
                    width: 24,
                    height: 24,
                    Assets.assetsImagesPngVisa,
                  ),
                  const SizedBox(width: 3),
                  Image.asset(
                    width: 24,
                    height: 24,
                    Assets.assetsImagesPngMaster,
                  ),
                ],
              ),
              isSelected: _selectedMethod == creditCard.name,
              onTap: () {
                setState(() {
                  _selectedMethod = creditCard.name;
                  widget.onPaymentSelected(creditCard);
                });
              },
            ),
            const SizedBox(height: 12),
            CustomListTile(
              title: Image.asset(
                width: 24,
                height: 24,
                Assets.assetsImagesPngStc,
              ),
              isSelected: _selectedMethod == stc.name,
              value: stc.name,
              onTap: () {
                setState(() {
                  _selectedMethod = stc.name;
                  widget.onPaymentSelected(stc);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
