import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/features/payment/data/models/payment_method.dart';
import 'package:talamiz_arina/features/wallet/data/repo/wallet_repo.dart';
import 'package:talamiz_arina/features/wallet/presentation/manager/wallet_state.dart';

@injectable
class WalletCubit extends Cubit<WalletState> {
  final WalletRepo _walletRepo;

  WalletCubit(this._walletRepo) : super(WalletInitial()) {
    amountController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isButtonEnabled.value = formKey.currentState!.validate() && selectedPaymentMethod.value != null;
      });
    });
  }
  ValueNotifier<bool> isButtonEnabled = ValueNotifier(false);
  ValueNotifier<PaymentMethod?> selectedPaymentMethod = ValueNotifier(null);
  final TextEditingController amountController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  

  @override
  Future<void> close() {
    amountController.dispose();
    return super.close();
  }
}
