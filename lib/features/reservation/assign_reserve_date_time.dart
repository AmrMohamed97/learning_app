import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/primary_button.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';

class AssignReserveDateTime extends StatefulWidget {
  const AssignReserveDateTime({super.key});

  @override
  State<AssignReserveDateTime> createState() => _AssignReserveDateTimeState();
}

class _AssignReserveDateTimeState extends State<AssignReserveDateTime> {
  DateTime _selectedValue = DateTime(2025, 1, 29); // Set to match image
  final DatePickerController _controller = DatePickerController();
  String? _selectedTimeSlot;

  @override
  void initState() {
    super.initState();
    // Wait for widget to build to scroll to date
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.animateToDate(_selectedValue);
    });
  }

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
          icon: const Icon(
            Icons.arrow_back,
            color: MyColors.greyNormal,
          ),
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
                  _buildCalendarSection(),
                  SizedBox(height: 20.h),
                  _buildTimeSlotsSection(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: PrimaryButton(
              onPressed: () {},
              text: 'تأكيد',
              height: 50.h,
              radius: 12.r,
              backgroundColor: MyColors.purpleNormal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: MyColors.purpleLight),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 16.w, color: MyColors.greyNormal),
                  SizedBox(width: 16.w),
                  Icon(Icons.arrow_forward_ios, size: 16.w, color: MyColors.greyNormal),
                ],
              ),
              Text(
                DateFormat('MMMM yyyy', 'ar').format(_selectedValue),
                style: AppTextStyle.font16Medium.copyWith(
                  color: MyColors.greyNormal,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 80.h,
            child: DatePicker(
              DateTime(2025, 1, 1),
              controller: _controller,
              initialSelectedDate: _selectedValue,
              selectionColor: MyColors.purpleNormal,
              selectedTextColor: Colors.white,
              deactivatedColor: MyColors.greyLight,
              dateTextStyle: AppTextStyle.font16Medium.copyWith(
                color: MyColors.greyNormal,
              ),
              dayTextStyle: AppTextStyle.font14Regular.copyWith(
                color: MyColors.greyNormal,
              ),
              monthTextStyle: const TextStyle(fontSize: 0), // Hide month
              width: 50.w,
              height: 80.h,
              locale: 'ar',
              onDateChange: (date) {
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSlotsSection() {
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
            'المنطقة الزمنية Africa/Cairo (UTC+02:00)',
            style: AppTextStyle.font14Medium.copyWith(
              color: MyColors.greyNormal,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'خلال فترات النهار',
            style: AppTextStyle.font14Regular.copyWith(
              color: MyColors.greyDarkActive,
            ),
          ),
          SizedBox(height: 12.h),
          _buildGrid(
            items: [
              {'time': '8 ص - 9 ص', 'icon': Icons.wb_sunny_outlined},
              {'time': '10ص-11ص', 'icon': Icons.wb_sunny_outlined},
              {'time': '12 م - 1 م', 'icon': Icons.wb_sunny_outlined},
              {'time': '3 م - 4 م', 'icon': Icons.wb_sunny_outlined},
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            'خلال فترات المساء',
            style: AppTextStyle.font14Regular.copyWith(
              color: MyColors.greyDarkActive,
            ),
          ),
          SizedBox(height: 12.h),
          _buildGrid(
            items: [
              {'time': '3 م - 6 م', 'icon': Icons.nightlight_round_outlined},
              {'time': '6 م - 7 م', 'icon': Icons.nightlight_round_outlined},
              {'time': '8 م - 9 م', 'icon': Icons.nightlight_round_outlined},
              {'time': '9 م - 10 م', 'icon': Icons.nightlight_round_outlined},
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGrid({required List<Map<String, dynamic>> items}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 0.8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final isSelected = _selectedTimeSlot == item['time'];
        return InkWell(
          onTap: () {
            setState(() {
              _selectedTimeSlot = item['time'];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? MyColors.purpleNormal : MyColors.purpleLight,
              ),
              borderRadius: BorderRadius.circular(8.r),
              color: isSelected ? MyColors.purpleLight.withOpacity(0.3) : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item['icon'],
                  color: MyColors.greyNormal,
                  size: 20.w,
                ),
                SizedBox(height: 8.h),
                Text(
                  item['time'],
                  textAlign: TextAlign.center,
                  style: AppTextStyle.font14Medium.copyWith(
                    color: MyColors.greyNormal,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}