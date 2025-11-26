import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/features/otp/presentation/manager/otp_state.dart';

@injectable
class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  bool isCompleted = false;

  void complete() {
    isCompleted = true;
    emit(OtpComplete());
  }
}