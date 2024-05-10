

import 'package:dio/dio.dart';
import 'package:pety/features/dashboard/appointments/models/appointment_status_body.dart';
import 'package:pety/features/dashboard/appointments/models/appointment_status_response.dart';
import 'package:pety/features/dashboard/appointments/models/appointments_body.dart';
import 'package:pety/features/dashboard/appointments/models/appointments_response.dart';
import 'package:pety/features/dashboard/pety_information/models/pety_information_body.dart';
import 'package:pety/features/dashboard/pety_information/models/pety_information_response.dart';
import 'package:pety/features/dashboard/pety_information/models/update_pety_data_response.dart';
import 'package:pety/features/dashboard/shared/data/models/all_roles_response.dart';
import 'package:pety/features/dashboard/work_hours/models/get_work_hours_body.dart';
import 'package:pety/features/dashboard/work_hours/models/get_work_hours_response.dart';
import 'package:pety/features/dashboard/work_hours/models/work_hours_body.dart';
import 'package:pety/features/dashboard/work_hours/models/work_hours_response.dart';
import 'package:pety/features/login/data/models/login_request_body.dart';
import 'package:pety/features/login/data/models/login_response.dart';
import 'package:pety/features/profile/data/models/update_profile_response.dart';
import 'package:pety/features/register/data/models/register_request_body.dart';
import 'package:pety/features/register/data/models/register_response.dart';
import 'package:pety/features/search_vet/book_vet_screen/data/models/book_vet_body.dart';
import 'package:pety/features/search_vet/book_vet_screen/data/models/book_vet_response.dart';
import 'package:pety/features/search_vet/data/models/search_vets_response.dart';
import 'package:pety/features/search_vet/vet_details_screen/models/add_review_body.dart';
import 'package:pety/features/search_vet/vet_details_screen/models/pety_details_body.dart';
import 'package:pety/features/search_vet/vet_details_screen/models/pety_details_response.dart';
import 'package:pety/shared/network/remote/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
      @Body() LoginRequestBody loginRequestBody
  );

  @POST(ApiConstants.register)
  Future<RegisterResponse> register(
      @Body() RegisterRequestBody registerRequestBody
  );

  @GET(ApiConstants.searchVet)
  Future<SearchVetsResponse> searchVets({
      @Query("role") required String role,
      @Query("page") required int page,
      @Query("sort") required String sort,
      @Query("minPrice") required int minPrice,
      @Query("maxPrice") required int maxPrice,
      @Query("availability") required String availability,
      @Query("petyName") String? petyName,
      @Query("offer") String? offer,
      @Query("animals") String? animals,
      @Query("limit") int? limit,
  });

  @POST(ApiConstants.petyDetails)
  Future<PetyDetailsResponse> getPetyDetails(
      @Body() PetyDetailsBody petyDetailsBody,
  );

  @POST(ApiConstants.bookVet)
  Future<BookVetResponse> bookVet(
    @Body() BookVetBody bookVetBody,
    @Header('Authorization') String token,
  );

  @PATCH(ApiConstants.updateProfile)
  Future<UpdateProfileResponse> updateProfile(
    @Body() FormData profileBody,
    @Header('Authorization') String token,
  );

  @POST(ApiConstants.dashboardGetAppointments)
  Future<AppointmentsResponse> getAppointmentsDashboard(
      @Body() AppointmentsBody appointmentsBody,
      @Header('Authorization') String token,
  );

  @PATCH(ApiConstants.dashboardChangeAppointmentStatus)
  Future<AppointmentStatusResponse> changeAppointmentStatus(
      @Body() AppointmentStatusBody appointmentStatusBody,
      @Header('Authorization') String token,
  );

  @POST(ApiConstants.dashboardPetyInformation)
  Future<PetyInformationResponse> petyInformation(
      @Body() PetyInformationBody petyInformationBody,
      @Header('Authorization') String token,
  );

  @PATCH(ApiConstants.dashboardUpdatePetyData)
  Future<UpdatePetyDataResponse> updatePetyData(
      @Body() FormData petyData,
      @Header('Authorization') String token,
  );

  @POST(ApiConstants.dashboardTimeTable)
  Future<WorkHoursResponse> addWorkHours(
      @Body() WorkHoursBody workHoursBody,
      @Header('Authorization') String token,
  );

  @POST(ApiConstants.dashboardGetWorkHours)
  Future<GetWorkHoursResponse> getWorkHours(
      @Body() GetWorkHoursBody getWorkHoursBody,
      @Header('Authorization') String token,
  );

  @GET(ApiConstants.dashboardGetAllRoles)
  Future<AllRolesResponse> getPetyRoles(
      @Header('Authorization') String token,
  );

  @POST(ApiConstants.reviewsAddNewOne)
  Future addNewReview(
      @Body() AddReviewBody reviewBody,
      @Header('Authorization') String token,
  );

}