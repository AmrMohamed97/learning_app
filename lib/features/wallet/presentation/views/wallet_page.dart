import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/wallet/presentation/widgets/transactions_list_widget.dart';
import 'package:talamiz_arina/features/wallet/presentation/widgets/wallet_info_grid.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backGroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("المحفظة"),
        actions: [
          GestureDetector(
            onTap: () {
              context.push(PagesKeys.walletChargePage);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: MyColors.purpleLightActive,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(Assets.assetsImagesSvgAddToWallet),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Column(
            children: [
              SizedBox(height: 16),
              WalletInfoGrid(),
              TransactionsListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
