import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/features/onboarding/presentation/controller/onbording_state.dart';

class OnbordingCubit extends Cubit<OnbordingState> {
  OnbordingCubit() : super(OnbordingtInitial());
  PageController pageController = PageController();
  int currentPage = 0;

 void changePage(int index) {
  currentPage = index;
  emit(ChangePageSuccess()); // هنا StepProgress هيتحدث تلقائيًا
}



void autoNextPage() {
  Future.delayed(const Duration(seconds: 3), () {
    if (currentPage < 2) {
      changePage(currentPage + 1); // انتقل للصفحة التالية مع ربط StepProgress
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      autoNextPage(); // كمل للصفحة اللي بعدها
    }
  });
}



  @override
  Future<void> close() {
    pageController.dispose();
    // stepProgressController.dispose();
    return super.close();
  }
}
