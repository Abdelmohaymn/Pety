


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/dashboard/appointments/models/appointment_status_body.dart';
import 'package:pety/features/dashboard/appointments/models/appointments_body.dart';
import 'package:pety/features/dashboard/appointments/models/appointments_response.dart';
import 'package:pety/features/dashboard/history_screen/models/add_history_body.dart';
import 'package:pety/features/dashboard/history_screen/models/appointment_history_response.dart';
import 'package:pety/features/dashboard/history_screen/models/get_user_history_body.dart';
import 'package:pety/features/dashboard/history_screen/models/get_user_history_response.dart';
import 'package:pety/features/dashboard/pety_information/models/pety_information_body.dart';
import 'package:pety/features/dashboard/pety_information/models/update_pety_data_body.dart';
import 'package:pety/features/dashboard/shared/cubit/dashboard_states.dart';
import 'package:pety/features/dashboard/shared/data/repository/dashboard_repository.dart';
import 'package:pety/features/dashboard/work_hours/models/get_work_hours_body.dart';
import 'package:pety/features/dashboard/work_hours/models/work_hour_model.dart';
import 'package:pety/shared/extensions.dart';


class DashboardCubit extends Cubit<DashboardStates>{

  final DashboardRepository _dashboardRepository;
  DashboardCubit(this._dashboardRepository) : super(const DashboardStates.initial());

  List<String>? roles;
  String currentRole='';
  AppointmentsResponse? appointmentsResponse;
  List<WorkHourModel>? workHours;

  //Text edit for pety Info
  final TextEditingController nameController = TextEditingController();
  final TextEditingController serviceController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  void getPetyRoles() async{
    emit(const DashboardStates.loading());
    final response = await _dashboardRepository.getAllRoles();
    response.when(
        success: (data){
          roles = data.data;
          emit(DashboardStates.success(data));
        },
        failure: (error){
          emit(DashboardStates.error(error: error.apiErrorModel.message!));
        }
    );
  }

  void getAllAppointments(String role) async{
    emit(const DashboardStates.loadAppointments());
    currentRole=role;
    final response = await _dashboardRepository.getAllAppointments(appointmentsBody:AppointmentsBody(role: role));
    response.when(
        success: (data){
          appointmentsResponse = data;
          emit(DashboardStates.successAppointments(data));
        },
        failure: (error){
          emit(DashboardStates.errorAppointments(error: error.apiErrorModel.message!));
        }
    );
  }

  void changeAppointmentStatus({required AppointmentStatusBody statusBody}) async{
    emit(const DashboardStates.loadChangeAppointmentsStatus());
    final response = await _dashboardRepository.changeAppointmentStatus(
        appointmentStatusBody: statusBody
    );
    response.when(
        success: (data){
          emit(DashboardStates.successChangeAppointmentsStatus(data));
        },
        failure: (error){
          emit(DashboardStates.errorChangeAppointmentsStatus(error: error.apiErrorModel.message!));
        }
    );
  }

  void getPetyInfo(String role) async{
    emit(const DashboardStates.loadPetyInfo());
    final response = await _dashboardRepository.getPetyInformation(petyInformationBody: PetyInformationBody(role: role));
    response.when(
        success: (data){
          nameController.text = data.data![0].petyName!;
          serviceController.text = data.data![0].clinicalName!;
          phoneController.text = data.data![0].phoneNumber!;
          emailController.text = data.data![0].email!;
          priceController.text = data.data![0].price!.toString();
          locationController.text = data.data![0].address!;
          descriptionController.text = data.data![0].description!;
          emit(DashboardStates.successPetyInfo(data));
        },
        failure: (error){
          emit(DashboardStates.errorPetyInfo(error: error.apiErrorModel.message!));
        }
    );
  }

  void updatePetyInfo() async{
    emit(const DashboardStates.loadUpdatePetyInfo());
    UpdatePetyDataBody petyDataBody = UpdatePetyDataBody(
      role: currentRole,
      petyName: nameController.text,
      clinicalName: serviceController.text,
      phoneNumber: phoneController.text,
      email: emailController.text,
      price: priceController.text,
      address: locationController.text,
      description: descriptionController.text,
    );
    final response = await _dashboardRepository.updatePetyData(petyData: await petyDataBody.toFormData());
    response.when(
        success: (data){
          emit(DashboardStates.successUpdatePetyInfo(data));
        },
        failure: (error){
          emit(DashboardStates.errorUpdatePetyInfo(error: error.apiErrorModel.message!));
        }
    );
  }

  void getWorkHours(String role) async{
    emit(const DashboardStates.loadGetWorkHours());
    final response = await _dashboardRepository.getWorkHours(getWorkHoursBody: GetWorkHoursBody(role: role));
    response.when(
        success: (data){
          workHours = data;
          emit(DashboardStates.successGetWorkHours(data));
        },
        failure: (error){
          emit(DashboardStates.errorGetWorkHours(error: error.apiErrorModel.message!));
        }
    );
  }

  void updateWorkHours() async{
    emit(const DashboardStates.loadUpdateWorkHours());
    final response = await _dashboardRepository.addWorkHours(model: workHours!, role: currentRole);
    response.when(
        success: (data){
          emit(DashboardStates.successUpdateWorkHours(data));
        },
        failure: (error){
          emit(DashboardStates.errorUpdatePetyInfo(error: error.apiErrorModel.message!));
        }
    );
  }

  void changeWorkHourAvailability(int index,bool value){
    emit(const DashboardStates.loadGeneralData());
    workHours![index].isActive = value;
    emit(const DashboardStates.successGeneralData());
  }

  void updateWorkHourTime(TimeOfDay data,int index, bool from){
    emit(const DashboardStates.loadGeneralData());
    String time = '${data.hourOfPeriod.toString().padLeft(2,'0')}:${data.minute.toString().padLeft(2,'0')} ${data.period.name.toUpperCase()}';
    if(from){
      workHours![index].from=time;
    }else{
      workHours![index].to=time;
    }
    emit(const DashboardStates.successGeneralData());
  }



  void setWorkHourSessionDuration(int index, int value){
    emit(const DashboardStates.loadGeneralData());
    workHours![index].sessionDuration = value;
    emit(const DashboardStates.successGeneralData());
  }

  void onBackPressed(BuildContext context){
    appointmentsResponse = null;
    workHours = null;
    nameController.text='';
    serviceController.text='';
    phoneController.text='';
    emailController.text='';
    priceController.text='';
    locationController.text='';
    descriptionController.text='';
    context.pop();
  }

  // user history
  GetUserHistoryResponse? userHistoryResponse;
  AppointmentHistoryResponse? appointmentHistoryResponse;
  late int appointmentIndex;
  TextEditingController petNameController = TextEditingController();
  TextEditingController petTypeController = TextEditingController();
  TextEditingController symptomsController = TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController medicineController = TextEditingController();

  void getUserHistory(String id) async{
    emit(const DashboardStates.loadGetUserHistory());
    final response = await _dashboardRepository.getUserHistory(
      userHistoryBody: GetUserHistoryBody(
        owner: id,
        role: currentRole
      )
    );
    response.when(
        success: (data){
          userHistoryResponse=data;
          emit(const DashboardStates.successGetUserHistory());
        },
        failure: (error){
          emit(DashboardStates.errorGetUserHistory(error: error.apiErrorModel.message!));
        }
    );
  }

  void getAppointmentHistory(String id) async{
    emit(const DashboardStates.loadGetAppointmentHistory());
    final response = await _dashboardRepository.getAppointmentHistory(id: id);
    response.when(
        success: (data){
          appointmentHistoryResponse=data;
          emit(const DashboardStates.successGetAppointmentHistory());
        },
        failure: (error){
          emit(DashboardStates.errorGetAppointmentHistory(error: error.apiErrorModel.message!));
        }
    );
  }

  void addHistory() async{
    emit(const DashboardStates.loadAddHistory());
    final response = await _dashboardRepository.addHistory(
        historyBody: AddHistoryBody(
          appointmentId: userHistoryResponse!.data!.appointments![appointmentIndex].id!,
          history: [
            History(
            animalName: petNameController.text,
            animalType: petTypeController.text,
            symptoms: symptomsController.text,
            diagnosisName: diagnosisController.text,
            medicineName: medicineController.text
          )]
        )
    );
    response.when(
        success: (data){
          appointmentHistoryResponse!.data!.add(
              HistoryData(
                animalName: data.data!.history!.last.animalName!,
                animalType: data.data!.history!.last.animalType!,
                symptoms: data.data!.history!.last.symptoms!,
                diagnosisName: data.data!.history!.last.diagnosisName!,
                medicineName: data.data!.history!.last.medicineName!
              )
          );
          emit(const DashboardStates.successAddHistory());
        },
        failure: (error){
          emit(DashboardStates.errorAddHistory(error: error.apiErrorModel.message!));
        }
    );
  }

  void clearHistory(){
    petNameController.clear();
    petTypeController.clear();
    symptomsController.clear();
    diagnosisController.clear();
    medicineController.clear();
  }

  void onBackFromUserHistoryScreen(){
    userHistoryResponse=null;
  }

}