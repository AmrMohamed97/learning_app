import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/features/chat/data/repo/chat_repo.dart';
import 'package:talamiz_arina/features/chat/presentation/manager/chat_state.dart';
import 'package:talamiz_arina/features/payment/data/models/payment_method.dart';

@injectable
class  ChatCubit extends Cubit<ChatState> {
  final ChatRepo _ChatRepo;

   ChatCubit(this._ChatRepo) : super( ChatInitial()) {
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
