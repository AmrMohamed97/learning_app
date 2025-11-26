// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:talamiz_arina/core/di/dependency_injection.dart' as _i399;
import 'package:talamiz_arina/core/network/dio/dio_factory.dart' as _i181;
import 'package:talamiz_arina/core/network/dio/dio_interceptor.dart' as _i848;
import 'package:talamiz_arina/features/chat/data/repo/chat_repo.dart' as _i315;
import 'package:talamiz_arina/features/chat/data/repo/chat_repo_imp.dart'
    as _i197;
import 'package:talamiz_arina/features/chat/presentation/manager/chat_cubit.dart'
    as _i525;
import 'package:talamiz_arina/features/course_package/presentation/manager/course_package_cubit.dart'
    as _i174;
import 'package:talamiz_arina/features/courses/data/repo/courses_repo.dart'
    as _i358;
import 'package:talamiz_arina/features/courses/data/repo/courses_repo_imp.dart'
    as _i164;
import 'package:talamiz_arina/features/courses/presentation/manager/courses_cubit.dart'
    as _i768;
import 'package:talamiz_arina/features/edit_auth_info/data/repo/edit_auth_info_repo.dart'
    as _i129;
import 'package:talamiz_arina/features/edit_auth_info/data/repo/edit_auth_info_repo_imp.dart'
    as _i915;
import 'package:talamiz_arina/features/edit_auth_info/presentation/manager/edit_auth_info_cubit.dart'
    as _i669;
import 'package:talamiz_arina/features/edit_profile/data/repo/edit_profile_repo.dart'
    as _i953;
import 'package:talamiz_arina/features/edit_profile/data/repo/edit_profile_repo_imp.dart'
    as _i790;
import 'package:talamiz_arina/features/edit_profile/presentation/manager/edit_profile_cubit.dart'
    as _i609;
import 'package:talamiz_arina/features/home/data/repo/home_repo.dart' as _i912;
import 'package:talamiz_arina/features/home/data/repo/home_repo_impl.dart'
    as _i182;
import 'package:talamiz_arina/features/home/presentation/manager/home_cubit/home_cubit.dart'
    as _i466;
import 'package:talamiz_arina/features/login/data/repo/login_repo.dart'
    as _i1055;
import 'package:talamiz_arina/features/login/data/repo/login_repo_imp.dart'
    as _i298;
import 'package:talamiz_arina/features/login/presentation/manager/login_cubit.dart'
    as _i499;
import 'package:talamiz_arina/features/main_bottom_nav/manager/main_bottom_nav_cubit.dart'
    as _i312;
import 'package:talamiz_arina/features/otp/presentation/manager/otp_cubit.dart'
    as _i38;
import 'package:talamiz_arina/features/payment/data/repo/payment_repo.dart'
    as _i823;
import 'package:talamiz_arina/features/payment/data/repo/payment_repo_imp.dart'
    as _i477;
import 'package:talamiz_arina/features/payment/presentation/manager/payment_cubit.dart'
    as _i557;
import 'package:talamiz_arina/features/profile/data/repo/profile_repo.dart'
    as _i948;
import 'package:talamiz_arina/features/profile/data/repo/profile_repo_imp.dart'
    as _i15;
import 'package:talamiz_arina/features/profile/presentation/manager/profile_cubit.dart'
    as _i759;
import 'package:talamiz_arina/features/registration/data/repo/registration_repo.dart'
    as _i755;
import 'package:talamiz_arina/features/registration/data/repo/registration_repo_imp.dart'
    as _i64;
import 'package:talamiz_arina/features/registration/presentation/manager/registration_cubit.dart'
    as _i289;
import 'package:talamiz_arina/features/teacher_profile/presentation/manager/teacher_cubit.dart'
    as _i266;
import 'package:talamiz_arina/features/timetable/data/repo/timetable_repo.dart'
    as _i52;
import 'package:talamiz_arina/features/timetable/data/repo/timetable_repo_imp.dart'
    as _i550;
import 'package:talamiz_arina/features/timetable/presentation/manager/timetable_cubit.dart'
    as _i307;
import 'package:talamiz_arina/features/view_teachers/data/repo/filter_repo_impl.dart'
    as _i399;
import 'package:talamiz_arina/features/view_teachers/data/repo/view_teachers_repo.dart'
    as _i130;
import 'package:talamiz_arina/features/view_teachers/presentation/manager/home_cubit/view_teachers_cubit.dart'
    as _i604;
import 'package:talamiz_arina/features/wallet/data/repo/wallet_repo.dart'
    as _i561;
import 'package:talamiz_arina/features/wallet/data/repo/wallet_repo_imp.dart'
    as _i160;
import 'package:talamiz_arina/features/wallet/presentation/manager/wallet_cubit.dart'
    as _i162;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    final dioFactory = _$DioFactory();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i174.CoursePackageCubit>(() => _i174.CoursePackageCubit());
    gh.factory<_i466.HomeCubit>(() => _i466.HomeCubit());
    gh.factory<_i312.MainBottomNavCubit>(() => _i312.MainBottomNavCubit());
    gh.factory<_i38.OtpCubit>(() => _i38.OtpCubit());
    gh.factory<_i266.TeacherCubit>(() => _i266.TeacherCubit());
    gh.factory<_i604.ViewTeachersCubit>(() => _i604.ViewTeachersCubit());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i361.LogInterceptor>(() => registerModule.logInterceptor);
    gh.factory<_i823.PaymentRepo>(() => _i477.PaymentRepoImp());
    gh.factory<_i912.HomeRepo>(() => _i182.HomeRepoImpl());
    gh.factory<_i953.EditProfileRepo>(() => _i790.EditProfileRepoImp());
    gh.factory<_i315.ChatRepo>(() => _i197.ChatRepoImp());
    gh.factory<_i948.ProfileRepo>(() => _i15.ProfileRepoImp());
    gh.factory<_i130.ViewTeachersRepo>(() => _i399.FilterRepoImpl());
    gh.factory<_i52.TimetableRepo>(() => _i550.TimetableRepoImp());
    gh.factory<_i561.WalletRepo>(() => _i160.WalletRepoImp());
    gh.factory<_i358.CoursesRepo>(() => _i164.CoursesRepoImp());
    gh.factory<_i129.EditAuthInfoRepo>(() => _i915.EditAuthInfoRepoImp());
    gh.factory<_i1055.LoginRepo>(() => _i298.LoginRepoImp());
    gh.factory<_i755.RegistrationRepo>(() => _i64.RegistrationRepoImp());
    gh.factory<_i289.RegistrationCubit>(
      () => _i289.RegistrationCubit(gh<_i755.RegistrationRepo>()),
    );
    gh.factory<_i609.EditProfileCubit>(
      () => _i609.EditProfileCubit(gh<_i561.WalletRepo>()),
    );
    gh.factory<_i162.WalletCubit>(
      () => _i162.WalletCubit(gh<_i561.WalletRepo>()),
    );
    gh.factory<_i848.CustomInterceptor>(
      () => _i848.CustomInterceptor(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i525.ChatCubit>(() => _i525.ChatCubit(gh<_i315.ChatRepo>()));
    gh.factory<_i768.CoursesCubit>(
      () => _i768.CoursesCubit(gh<_i358.CoursesRepo>()),
    );
    gh.factory<_i307.TimetableCubit>(
      () => _i307.TimetableCubit(gh<_i358.CoursesRepo>()),
    );
    gh.factory<_i557.PaymentCubit>(
      () => _i557.PaymentCubit(gh<_i823.PaymentRepo>()),
    );
    gh.factory<_i759.ProfileCubit>(
      () => _i759.ProfileCubit(gh<_i948.ProfileRepo>()),
    );
    gh.factory<_i499.LoginCubit>(
      () => _i499.LoginCubit(gh<_i1055.LoginRepo>()),
    );
    gh.factory<_i669.EditAuthInfoCubit>(
      () => _i669.EditAuthInfoCubit(gh<_i129.EditAuthInfoRepo>()),
    );
    gh.factory<_i361.Dio>(
      () => dioFactory.getDio(gh<_i848.CustomInterceptor>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i399.RegisterModule {}

class _$DioFactory extends _i181.DioFactory {}
