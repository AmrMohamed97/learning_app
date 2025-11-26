import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/helper/countries_codes.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/filter_tages_row.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/core/widgets/teacher_widget.dart';
import 'package:talamiz_arina/features/home/presentation/widgets/teachers_list.dart';
import 'package:talamiz_arina/features/view_teachers/data/models/filter_teacher_model.dart';
import 'package:talamiz_arina/features/view_teachers/presentation/manager/home_cubit/view_teachers_cubit.dart';

class ViewTeachersPage extends StatefulWidget {
  const ViewTeachersPage({super.key});

  @override
  State<ViewTeachersPage> createState() => _ViewTeachersPageState();
}

class _ViewTeachersPageState extends State<ViewTeachersPage> {
  late final ViewTeachersCubit _viewTeachersCubit = context.read();
  final teacher = Teacher(
    id: '1',
    name: 'محمد العتيبي',
    title: 'معلم رياضيات و قدرات بخبرة 20 عام',
    experience: '20 عام',
    pricePerHalfHour: 50.0,
    profileImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/zad-al-daia.firebasestorage.app/o/a5e70ce43db5770ad0b98944601e3f8bb9a83c1c.jpg?alt=media&token=ec23e7af-95d1-4f3a-b6c3-463532bbad0f',
    isVerified: true,
    isFavorite: false,
    subjects: [
      'الجبر',
      'الحساب',
      'الرياضيات الأساسية',
      'بيولوجيا',
      'حساب التفاضل',
      'فيزياء',
      'كيمياء',
      'هندسة',
      'فلسفة',
    ],
    languages: ['إنجليزي', 'العربي'],
    rating: 4.4,
    totalReviews: 30,
    totalStudents: 674,
    totalHoursTaught: 45,
  );

  @override
  void initState() {
    super.initState();
    _viewTeachersCubit.filter.addListener(() {
      // _viewTeachersCubit.getTeachers();
    });
  }

  @override
  void dispose() {
    _viewTeachersCubit.filter.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: ViewTeatureAppBar(viewTeachersCubit: _viewTeachersCubit),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _viewTeachersCubit.filter,
            builder: (context, value, child) {
              List<String> tages = [];
              if (value != null) {
                tages = [
                  ...value.selectedDays.map((e) => e.nameArabic),
                  ...value.selectedSubjects.map((e) => e.nameArabic),
                  ...value.selectedTeachingMethod.map((e) => e.nameArabic),
                  ...value.morningSlots.map((e) => e.displayTime),
                  ...value.eveningSlots.map((e) => e.displayTime),
                  if (!(value.priceRange.minPrice == 100 &&
                      value.priceRange.maxPrice == 2000))
                    '\u200E${value.priceRange.minPrice} SAR - ${value.priceRange.maxPrice} SAR\u200E',
                ];
              }
              return FilterTagesRow(
                tages: tages,
                onClose: () {
                  _viewTeachersCubit.filter.value = null;
                },
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(top: index == 0 ? 24 : 0),
                              child: TeacherWidget(teacher: teacher),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ViewTeatureAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ViewTeatureAppBar({
    super.key,
    required ViewTeachersCubit viewTeachersCubit,
  }) : _viewTeachersCubit = viewTeachersCubit;

  final ViewTeachersCubit _viewTeachersCubit;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: context.canPop(),
      title: context.canPop()
          ? const Text("المعلمين")
          : Image.asset(height: 35, Assets.assetsImagesPngTalamizSplash),
      actions: [
        if (!context.canPop())
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: MyColors.purpleLightActive,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(Assets.assetsImagesSvgNotifications),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: MyColors.purpleLightActive,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(Assets.assetsImagesSvgPerson),
              ),
              const SizedBox(width: 8),
            ],
          ),
        GestureDetector(
          onTap: () {
            context
                .push(
                  PagesKeys.filterTeacherPageKey,
                  extra: _viewTeachersCubit.filter.value,
                )
                .then((value) {
                  print(value);
                  if (value is FilterTeacherModel) {
                    if (value.isEmpty()) {
                      _viewTeachersCubit.filter.value = null;
                    } else {
                      _viewTeachersCubit.filter.value = value.copyWith();
                    }
                  }
                });
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: MyColors.purpleLightActive,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(Assets.assetsImagesSvgFilter),
          ),
        ),
      ],
      bottom: context.canPop()
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 8,
                  bottom: 12,
                ),
                child: Text(
                  textAlign: TextAlign.start,
                  "${countryCodeToEmoji("EG")} الثالث ثانوي - علمي علوم",
                  style: AppTextStyle.font16Medium,
                ),
              ),
            ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 45);
}
