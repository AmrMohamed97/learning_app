// import 'package:dart_either/dart_either.dart';
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:talamiz_arina/core/const/app_const.dart';
// import 'package:talamiz_arina/core/error/failure.dart';
// import 'package:talamiz_arina/core/models/auth_response/auth_response.dart';
// import 'package:talamiz_arina/core/utills/cache_helper.dart';
// import 'package:talamiz_arina/features/registration/data/data_source/register_remote_data_source.dart';
// import 'package:talamiz_arina/features/registration/data/models/curreculum_out_model/curriculum_out_model.dart';
// import 'package:talamiz_arina/features/registration/data/models/register_input_model/register_input_model.dart';
// import 'package:talamiz_arina/features/registration/data/models/stages_out_model/stages_out_model.dart';
// import 'package:talamiz_arina/features/registration/data/repo/registration_repo.dart';

// @Injectable(as: RegistrationRepo)
// class RegistrationRepoImp implements RegistrationRepo {
//   final RegisterRemoteDataSource registerRemoteDataSource;
//   RegistrationRepoImp(this.registerRemoteDataSource);
//   @override
//   Future<Either<Failure, AuthResponse>> register({
//     required RegisterInputModel body,
//   }) async {
//     print('================data====================');
//     print(body.password);
//     print(body.curriculumId);
//     print(body.dateOfBirth);
//     print(body.img);
//     print(body.fullName);
//     print(body.phone);
//     print(body.stageId);
//     print(body.type);
//     print(body.gender);
//     try {
//       final AuthResponse response = await registerRemoteDataSource.register(
//         curriculumId: body.curriculumId,
//         date: null,
//         gender: body.gender,
//         image: body.img,
//         name: body.fullName,
//         password: body.password,
//         phone: body.phone,
//         stageId: body.stageId,
//         type: body.type ,
//       );
//       if (response.status == false) {
//         // throw Exception(response.message);
//         return Left(ServerFailure(response.message ?? ""));
//       }
//       await CacheHelper.saveUserData(response.data!.user!);
//       await CacheHelper.setSecuerString(
//         key: AppConstant.accessToken,
//         value: response.data!.token!,
//       );
//       print(
//         'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk',
//       );
//       print(CacheHelper.getSecuerString(key: AppConstant.accessToken));
//       print(response.data!.token);
//       return Right(response);
//     } catch (e) {
//       if (e is DioException) {
//         return Left(ServerFailure.fromDioException(e));
//       }
//       return Left(ServerFailure(e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, StagesOutModel>> getStages() async {
//     try {
//       final StagesOutModel response = await registerRemoteDataSource
//           .getStages();
//       if (response.status == false) {
//         // throw Exception(response.message);
//         return Left(ServerFailure(response.message ?? ""));
//       }
//       return Right(response);
//     } catch (e) {
//       if (e is DioException) {
//         return Left(ServerFailure.fromDioException(e));
//       }
//       return Left(ServerFailure(e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, CurriculumOutModel>> getCurriculum() async {
//     try {
//       final CurriculumOutModel response = await registerRemoteDataSource
//           .getCurriculum();
//       if (response.status == false) {
//         // throw Exception(response.message);
//         return Left(ServerFailure(response.message ?? ""));
//       }
//       return Right(response);
//     } catch (e) {
//       if (e is DioException) {
//         return Left(ServerFailure.fromDioException(e));
//       }
//       return Left(ServerFailure(e.toString()));
//     }
//   }
// }
