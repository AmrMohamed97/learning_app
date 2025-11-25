import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key, required this.onDateSelected});
  final void Function(DateTime date) onDateSelected;
  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  String selectedValue = DateFormat("dd/MM/yyyy").format(DateTime.now());
  final DatePickerController _controller = DatePickerController();
  DateTime currentMonth = DateTime.now();
  DateTime? selectedDate = DateTime.now();

  void _goToPreviousMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
      // الانتقال لبداية الشهر بدون تغيير الـ selected item
      _controller.animateToDate(
        DateTime(currentMonth.year, currentMonth.month),
        duration: const Duration(milliseconds: 1300),
      );
    });
  }

  void _goToNextMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
      // الانتقال لبداية الشهر بدون تغيير الـ selected item
      _controller.animateToDate(
        DateTime(currentMonth.year, currentMonth.month),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // عرض الشهر مع أزرار التنقل
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('MMMM yyyy', 'ar').format(currentMonth),
                style: AppTextStyle.font16Regular,
              ),
              Row(
                // spacing: 15,
                children: [
                  IconButton(
                    onPressed: _goToPreviousMonth,
                    icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: _goToNextMonth,
                    icon: const Icon(Icons.arrow_forward_ios_sharp, size: 16),
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
        // const SizedBox(height: 10),
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DatePicker(
            DateTime.now(),
            controller: _controller,
            daysCount:
                DateTime(2030, 12, 31).difference(DateTime.now()).inDays + 1,
            initialSelectedDate: DateTime.now(),
            selectionColor: MyColors.purpleNormal,
            // deactivatedColor: MyColors.greyLight.withValues(alpha: .49),
            dateTextStyle: const TextStyle(fontSize: 14),
            monthTextStyle: const TextStyle(fontSize: 0, height: 0),
            dayTextStyle: const TextStyle(fontSize: 14),
            width: 70,
            height: 63,
            locale: 'ar',
            onDateChange: (date) {
              widget.onDateSelected(date);
              setState(() {
                selectedDate = date;
                selectedValue = DateFormat("dd/MM/yyyy").format(date);
                currentMonth = date;
              });
            },
          ),
        ),
      ],
    );
  }
}
