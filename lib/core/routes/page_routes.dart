import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/const/app_const.dart';
import 'package:talamiz_arina/core/di/dependency_injection.dart';
import 'package:talamiz_arina/core/utills/cache_helper.dart';
import 'package:talamiz_arina/features/assign_user_type/page/assign_user_type_page.dart';
import 'package:talamiz_arina/features/chat/data/models/chat.dart';
import 'package:talamiz_arina/features/chat/presentation/manager/chat_cubit.dart';
import 'package:talamiz_arina/features/chat/presentation/views/chat_page.dart';
import 'package:talamiz_arina/features/chat/presentation/views/chats_list_page.dart';
import 'package:talamiz_arina/features/course_package/presentation/manager/course_package_cubit.dart';
import 'package:talamiz_arina/features/course_package/presentation/page/course_package_page.dart';
import 'package:talamiz_arina/features/courses/data/models/filter_course_model.dart';
import 'package:talamiz_arina/features/courses/presentation/manager/courses_cubit.dart';
import 'package:talamiz_arina/features/courses/presentation/views/courses_filter_page.dart';
import 'package:talamiz_arina/features/courses/presentation/views/courses_page.dart';
import 'package:talamiz_arina/features/edit_auth_info/presentation/manager/edit_auth_info_cubit.dart';
import 'package:talamiz_arina/features/edit_auth_info/presentation/views/edit_auth_info_page.dart';
import 'package:talamiz_arina/features/edit_profile/data/models/profile_data.dart';
import 'package:talamiz_arina/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:talamiz_arina/features/edit_profile/presentation/views/edit_profile_page.dart';
import 'package:talamiz_arina/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:talamiz_arina/features/home/presentation/views/home_page.dart';
import 'package:talamiz_arina/features/login/presentation/manager/login_cubit.dart';
import 'package:talamiz_arina/features/login/presentation/views/forgot_password_page.dart';
import 'package:talamiz_arina/features/login/presentation/views/login_page.dart';
import 'package:talamiz_arina/features/login/presentation/views/new_password_page.dart';
import 'package:talamiz_arina/features/main_bottom_nav/manager/main_bottom_nav_cubit.dart';
import 'package:talamiz_arina/features/main_bottom_nav/view/main_bottom_nav_view.dart';
import 'package:talamiz_arina/features/notification/presentation/page/notification_page.dart';
import 'package:talamiz_arina/features/onboarding/presentation/pages/onboarding.dart';
import 'package:talamiz_arina/features/otp/presentation/manager/otp_cubit.dart';
import 'package:talamiz_arina/features/otp/presentation/page/otp_page.dart';
import 'package:talamiz_arina/features/payment/data/models/payment_result_data.dart';
import 'package:talamiz_arina/features/payment/presentation/views/payment_result_page.dart';
import 'package:talamiz_arina/features/profile/presentation/manager/profile_cubit.dart';
import 'package:talamiz_arina/features/profile/presentation/views/profile_page.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_cubit.dart';
import 'package:talamiz_arina/features/registration/presentation/views/registration_page.dart';
import 'package:talamiz_arina/features/splash/page/splash_screen.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/manager/teacher_cubit.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/page/teacher_profile_page.dart';
import 'package:talamiz_arina/features/timetable/data/models/timetable_filter_model.dart';
import 'package:talamiz_arina/features/timetable/presentation/manager/timetable_cubit.dart';
import 'package:talamiz_arina/features/timetable/presentation/views/timetable_filter_page.dart';
import 'package:talamiz_arina/features/timetable/presentation/views/timetable_page.dart';
import 'package:talamiz_arina/features/view_teachers/data/models/filter_teacher_model.dart';
import 'package:talamiz_arina/features/view_teachers/presentation/manager/home_cubit/view_teachers_cubit.dart';
import 'package:talamiz_arina/features/view_teachers/presentation/views/filter_teacher_page.dart';
import 'package:talamiz_arina/features/view_teachers/presentation/views/view_teachers_page.dart';
import 'package:talamiz_arina/features/wallet/presentation/manager/wallet_cubit.dart';
import 'package:talamiz_arina/features/wallet/presentation/views/wallet_charge_page.dart';
import 'package:talamiz_arina/features/wallet/presentation/views/wallet_page.dart';

import '../../core/helper/bloc_observer.dart';
import '../../core/routes/pages_keys.dart';

/// 🔒 Auth Guard
class AuthGuard {
  static String? redirect(BuildContext context, GoRouterState state) {
    // جلب التوكن من الكاش
    final bool? token = CacheHelper.getData(key: AppConstant.isLogin);

    // لو التوكن مش موجود
    if (token == null) {
      // اتأكد إن المستخدم مش بالفعل في صفحة اللوجن
      if (state.matchedLocation != "/${PagesKeys.loginPage}") {
        return "/${PagesKeys.loginPage}";
      }
      return null; // خليك في صفحة اللوجن
    }

    // لو التوكن موجود -> ادخل على الصفحة المطلوبة عادي
    return null;
  }
}

class PageRoutes {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  // static final GlobalKey<NavigatorState> _shellNavigatorKey =
  //     GlobalKey<NavigatorState>(debugLabel: 'shell');

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    observers: [MyNavigatorObserver()],
    initialLocation: PagesKeys.mainBottomNavView,
    // initialLocation: PagesKeys.splashScreen,
    errorBuilder: (context, state) {
      PrintHelper(state.error.toString());
      return const ErorPage();
    },

    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.splashScreen,
        path: "/${PagesKeys.splashScreen}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.onboardingScreen,
        path: "/${PagesKeys.onboardingScreen}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const OnboardingScreen(),
        ),
      ),
      //------------------assign user type
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.assignUserTypePage,
        path: "/${PagesKeys.assignUserTypePage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const AssignUserTypePage(),
        ),
      ),

      // ---------------- Register
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.registerPage,
        path: "/${PagesKeys.registerPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<RegistrationCubit>(),
            child: const RegistrationPage(),
          ),
        ),
      ),

      // ---------------- Login
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.loginPage,
        path: "/${PagesKeys.loginPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginPage(),
          ),
        ),
      ),
      // ---------------- otpPage
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.otpPage,
        path: "/${PagesKeys.otpPage}",
        pageBuilder: (context, state) {
          final args = state.extra as (String, String);
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: BlocProvider(
              create: (context) => getIt<OtpCubit>(),
              child: OtpPage(nextPage: args.$1, phoneNumber: args.$2),
            ),
          );
        },
      ),
      // ---------------- coursePackagePage
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.coursePackagePage,
        path: "/${PagesKeys.coursePackagePage}",
        pageBuilder: (context, state) {
          // final args = state.extra as (String, String);
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: BlocProvider(
              create: (context) => CoursePackageCubit(),
              child: const CoursePackagePage(),
            ),
          );
        },
      ),
      // ---------------- BOTTOM NAV VIEW
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.mainBottomNavView,
        path: "/${PagesKeys.mainBottomNavView}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<MainBottomNavCubit>(),
            child: const MainBottomNavView(),
          ),
        ),
      ),

      // ---------------- teatureProfilePage
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.teacherProfilePage,
        path: "/${PagesKeys.teacherProfilePage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<TeacherCubit>(),
            child: const TeacherProfilePage(),
          ),
        ),
      ),
      // ---------------- notificationPage
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.notificationPage,
        path: "/${PagesKeys.notificationPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const NotificationPage(),
        ),
      ),
      // ---------------- Home
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.homePage,
        path: "/${PagesKeys.homePage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomePage(),
          ),
        ),
      ),

      // ---------------- View Teachers
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.viewTeachersPage,
        path: "/${PagesKeys.viewTeachersPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<ViewTeachersCubit>(),
            child: const ViewTeachersPage(),
          ),
        ),
      ),

      // ---------------- Filter Teacher
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.filterTeacherPageKey,
        path: "/${PagesKeys.filterTeacherPageKey}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: FilterTeacherPage(
            filterTeacherModel: state.extra as FilterTeacherModel?,
          ),
        ),
      ),

      // ---------------- Filter Course
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.filterCoursePageKey,
        path: "/${PagesKeys.filterCoursePageKey}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: CoursesFilterPage(
            filterCourseModel: state.extra as FilterCourseModel?,
          ),
        ),
      ),

      // ---------------- Forgot Password
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.forgotPasswordPage,
        path: "/${PagesKeys.forgotPasswordPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ForgotPasswordPage(),
        ),
      ),

      // ---------------- New Password
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.newPasswordPage,
        path: "/${PagesKeys.newPasswordPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const NewPasswordPage(),
        ),
      ),

      // ---------------- coursesPage
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.coursesPage,
        path: "/${PagesKeys.coursesPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<CoursesCubit>(),
            child: const CoursesPage(),
          ),
        ),
      ),

      // ---------------- profilePage
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.profilePage,
        path: "/${PagesKeys.profilePage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const ProfilePage(),
          ),
        ),
      ),

      // ---------------- walletPage
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.walletPage,
        path: "/${PagesKeys.walletPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<WalletCubit>(),
            child: const WalletPage(),
          ),
        ),
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.walletChargePage,
        path: "/${PagesKeys.walletChargePage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<WalletCubit>(),
            child: const WalletChargePage(),
          ),
        ),
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.paymentResultPage,
        path: "/${PagesKeys.paymentResultPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: PaymentResultPage(
            paymentResultData: state.extra as PaymentResultData,
          ),
        ),
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.editProfile,
        path: "/${PagesKeys.editProfile}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<EditProfileCubit>(),
            child: EditProfilePage(userProfile: state.extra as UserProfile),
          ),
        ),
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.editAuthInfo,
        path: "/${PagesKeys.editAuthInfo}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<EditAuthInfoCubit>(),
            child: const EditAuthInfoPage(),
          ),
        ),
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.chatsListPage,
        path: "/${PagesKeys.chatsListPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<ChatCubit>(),
            child: const ChatsListPage(),
          ),
        ),
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.chatPage,
        path: "/${PagesKeys.chatPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<ChatCubit>(),
            child: ChatPage(chat: state.extra as Chat),
          ),
        ),
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.timeTablePage,
        path: "/${PagesKeys.timeTablePage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<TimetableCubit>(),
            child: const TimetablePage(),
          ),
        ),
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.filterTimetablePageKey,
        path: "/${PagesKeys.filterTimetablePageKey}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => getIt<TimetableCubit>(),
            child: TimetableFilterPage(
              filterTimetableModel: state.extra as TimetableFilterModel,
            ),
          ),
        ),
      ),

      // ---------------- Layout + Tabs via StatefulShellRoute
      // StatefulShellRoute.indexedStack(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   builder: (context, state, navigationShell) => MultiBlocProvider(
      //     providers: [

      //     ],
      //     child: LayoutView(shell: navigationShell),
      //   ),
      //   branches: [
      //     // ------- Branch: Home
      //     StatefulShellBranch(
      //       navigatorKey: _shellNavigatorKey,
      //       routes: [

      //       ],
      //     ),
      //   ],
      // ),
    ],
  );

  static void goNamed(String name, {Object? extra}) {
    router.goNamed(name, extra: extra);
  }

  static void replaceNamed(String name, {Object? extra}) {
    router.replaceNamed(name, extra: extra);
  }

  static void clearAndNavigate(String name, {Object? extra}) {
    while (router.canPop()) {
      router.pop();
    }
    router.goNamed(name, extra: extra);
  }
}

class ErorPage extends StatelessWidget {
  const ErorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Error")));
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    PrintHelper('Navigate To ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    PrintHelper('Back To ${route.settings.name}');
  }
}

CustomTransitionPage<T> buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

CustomTransitionPage<T> buildPageWithSlideTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: const Offset(1, 0), // من اليمين
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeInOut)),
          ),
          child: child,
        ),
  );
}
