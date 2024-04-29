

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:pety/features/dashboard/appointments/models/appointment_status_body.dart';
import 'package:pety/features/dashboard/appointments/models/appointment_status_response.dart';
import 'package:pety/features/dashboard/appointments/models/appointments_body.dart';
import 'package:pety/features/dashboard/appointments/models/appointments_response.dart';
import 'package:pety/features/dashboard/pety_information/models/pety_information_body.dart';
import 'package:pety/features/dashboard/pety_information/models/pety_information_response.dart';
import 'package:pety/features/dashboard/pety_information/models/update_pety_data_response.dart';
import 'package:pety/features/dashboard/shared/data/models/all_roles_response.dart';
import 'package:pety/features/dashboard/work_hours/mapper/get_work_hour_mapper.dart';
import 'package:pety/features/dashboard/work_hours/models/get_work_hours_body.dart';
import 'package:pety/features/dashboard/work_hours/models/get_work_hours_response.dart';
import 'package:pety/features/dashboard/work_hours/models/work_hour_model.dart';
import 'package:pety/features/dashboard/work_hours/models/work_hours_body.dart';
import 'package:pety/features/dashboard/work_hours/models/work_hours_response.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/network/local/shared_pred_constants.dart';
import 'package:pety/shared/network/local/shared_pref_helper.dart';
import 'package:pety/shared/network/remote/api_result.dart';
import 'package:pety/shared/network/remote/api_service.dart';
import 'package:pety/shared/network/remote/error_handler.dart';

class DashboardRepository {
  final ApiService _apiService ;

  DashboardRepository(
    this._apiService,
  );

  /// appointments
  Future<ApiResult<AppointmentsResponse>> getAllAppointments({required AppointmentsBody appointmentsBody}) async{
    try{
      final AppointmentsResponse response = await _apiService.getAppointmentsDashboard(
          appointmentsBody,
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      response.data?.forEach((element) {
        element.date = formatDate(element.date!);
        element.status = element.status!.capitalizeFirstLetter();
      });
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AppointmentStatusResponse>> changeAppointmentStatus({required AppointmentStatusBody appointmentStatusBody}) async{
    try{
      final AppointmentStatusResponse response = await _apiService.changeAppointmentStatus(
          appointmentStatusBody,
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      response.data!.status = response.data!.status!.capitalizeFirstLetter();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// pety info
  Future<ApiResult<PetyInformationResponse>> getPetyInformation({required PetyInformationBody petyInformationBody}) async{
    try{
      final PetyInformationResponse response = await _apiService.petyInformation(
          petyInformationBody,
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UpdatePetyDataResponse>> updatePetyData({required FormData petyData}) async{
    try{
      final UpdatePetyDataResponse response = await _apiService.updatePetyData(
          petyData,
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// work hours
  Future<ApiResult<WorkHoursResponse>> addWorkHours({required List<WorkHourModel> model,required String role}) async{
    try{
      WorkHoursBody body = GetWorkHourMapper.mapToBody(model);
      body.role=role;
      final WorkHoursResponse response = await _apiService.addWorkHours(
          body,
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<WorkHourModel>>> getWorkHours({required GetWorkHoursBody getWorkHoursBody}) async{
    try{
      final GetWorkHoursResponse response = await _apiService.getWorkHours(
          getWorkHoursBody,
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );

      return ApiResult.success(GetWorkHourMapper.mapFromResponse(response));
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// get pety roles
  Future<ApiResult<AllRolesResponse>> getAllRoles() async{
    try{
      final AllRolesResponse response = await _apiService.getPetyRoles(
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// non api function
  String formatDate(String date){
    DateTime dateTime = DateFormat("dd-MM-yyyy").parse(date);
    return DateFormat("EEE MMMM d, yyyy").format(dateTime);
  }

}