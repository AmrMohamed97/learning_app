import 'package:flutter/material.dart';
import 'package:talamiz_arina/features/timetable/data/models/private_lesson.dart';
import 'package:talamiz_arina/features/timetable/presentation/widgets/private_lesson_widget.dart';

class TimetablePrivateLessonList extends StatelessWidget {
  const TimetablePrivateLessonList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsetsDirectional.only(
            bottom: 20,
            top: index == 0 ? 8 : 0,
            start: 16,
            end: 16,
          ),
          child: PrivateLessonWidget(privateLesson: lessons[index]),
        );
      },
    );
  }
}
