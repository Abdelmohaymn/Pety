


import 'package:dio/dio.dart';
import 'package:pety/features/pety_layout/find_my_pet/models/find_pet_body.dart';
import 'package:pety/features/pety_layout/find_my_pet/models/find_pet_response.dart';
import 'package:pety/features/pety_layout/find_my_pet/models/upload_pet_response.dart';
import 'package:pety/shared/network/remote/find_pet_api/find_pet_endpoints.dart';
import 'package:retrofit/http.dart';

part 'find_pet_service.g.dart';

@RestApi(baseUrl: FindPetEndPoints.findPetBaseUrl)
abstract class FindPetService {
  factory FindPetService(Dio dio, {String baseUrl}) = _FindPetService;

  @POST(FindPetEndPoints.predict)
  Future<FindPetResponse> findMissingPet(
      @Body() FindPetBody findPetBody
  );

  @POST(FindPetEndPoints.predict)
  Future<UploadPetResponse> uploadMissingPet(
      @Body() FindPetBody findPetBody
  );

}
