import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/features/payment/data/repo/payment_repo.dart';
import 'package:talamiz_arina/features/payment/presentation/manager/payment_state.dart';

@injectable
class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo _paymentRepo;

  PaymentCubit(this._paymentRepo) : super(PaymentInitial());
}
