// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:talamiz_arina/core/models/auth_response/auth_response.dart';
// import 'package:talamiz_arina/core/network/end_point.dart';
// import 'package:talamiz_arina/features/registration/data/models/curreculum_out_model/curriculum_out_model.dart';
// import 'package:talamiz_arina/features/registration/data/models/stages_out_model/stages_out_model.dart';

// part 'register_remote_data_source.g.dart';

// @Injectable()
// @RestApi()
// abstract class RegisterRemoteDataSource {
//   @factoryMethod
//   factory RegisterRemoteDataSource(Dio dio) = _RegisterRemoteDataSource;

//   // @POST(EndPoints.registerUrl)
//   // Future<AuthResponse> register({
//   //   @Body() required RegisterInputModel body,
//   // });
//   @MultiPart()
//   @POST(EndPoints.registerUrl)
//   Future<AuthResponse> register({
//     @Part(name: 'img') File? image,
//     @Part(name: 'full_name') required String? name,
//     @Part(name: 'phone') required String? phone,
//     @Part(name: 'password') required String? password,
//     @Part(name: 'date_of_birth') required String? date,
//     @Part(name: 'type') required String? type,
//     @Part(name: 'gender') required String? gender,
//     @Part(name: 'curriculum_id') required String? curriculumId,
//     @Part(name: 'stage_id') required String? stageId,
//   });

//   @GET(EndPoints.stagesUrl)
//   Future<StagesOutModel> getStages();

//   @GET(EndPoints.curriculumUrl)
//   Future<CurriculumOutModel> getCurriculum();
// }
