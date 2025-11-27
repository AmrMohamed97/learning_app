import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';
import 'package:talamiz_arina/core/widgets/primary_button.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';

class AssignReservedSubjectPage extends StatefulWidget {
  const AssignReservedSubjectPage({super.key});

  @override
  State<AssignReservedSubjectPage> createState() =>
      _AssignReservedSubjectPageState();
}

class _AssignReservedSubjectPageState extends State<AssignReservedSubjectPage> {
  String? _selectedSubject;
  final List<String> _subjects = [
    'الإحصاء',
    'الأحياء',
    'الكيمياء',
    'الجغرافيا',
    'التاريخ',
    'الجبر',
    'الهندسة',
    'الكل',
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'حجز الدرس',
          style: AppTextStyle.font20SemiBold.copyWith(
            color: MyColors.greyNormal,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: MyColors.greyNormal),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSubjectsSection(),
                  SizedBox(height: 20.h),
                  _buildQuestionSection(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: PrimaryButton(
              isMax: true,
              onPressed: () {
                context.push(PagesKeys.reviewReservationPage);
              },
              text: 'مراجعة طلبك',
              height: 50.h,
              radius: 12.r,
              backgroundColor: MyColors.purpleNormal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectsSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: MyColors.purpleLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'المواد الدراسية',
            style: AppTextStyle.font14Medium.copyWith(
              color: MyColors.greyNormal,
            ),
          ),
          SizedBox(height: 16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
              childAspectRatio: 2.0, // Adjusted for button shape
            ),
            itemCount: _subjects.length,
            itemBuilder: (context, index) {
              final subject = _subjects[index];
              final isSelected = _selectedSubject == subject;
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedSubject = subject;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? MyColors.purpleNormal
                          : MyColors.purpleLight,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                    color: isSelected
                        ? MyColors.purpleLight.withOpacity(0.3)
                        : Colors.white,
                  ),
                  child: Text(
                    subject,
                    style: AppTextStyle.font14Regular.copyWith(
                      color: MyColors.greyNormal,
                      fontSize: 12.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'هل لديك اسئلة ؟',
          style: AppTextStyle.font16SemiBold.copyWith(
            color: MyColors.greyNormal,
          ),
        ),
        SizedBox(height: 10.h),
        MyTextFormField(
          hintText: 'قد يساعد معلمك في التحضير للدرس',
          minLine: 6,
          maxLines: 6,
          filled: true,
          filledColor: Colors.white,
          borderColor: MyColors.purpleLight,
          radius: 12.r,
          hintStyle: AppTextStyle.font14Regular.copyWith(
            color: MyColors.greyDarkActive,
          ),
        ),
      ],
    );
  }
}
