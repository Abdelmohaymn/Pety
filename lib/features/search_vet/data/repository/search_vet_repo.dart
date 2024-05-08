
import 'package:intl/intl.dart';
import 'package:pety/features/search_vet/book_vet_screen/data/models/book_vet_body.dart';
import 'package:pety/features/search_vet/book_vet_screen/data/models/book_vet_response.dart';
import 'package:pety/features/search_vet/data/models/search_vets_response.dart';
import 'package:pety/features/search_vet/vet_details_screen/models/add_review_body.dart';
import 'package:pety/features/search_vet/vet_details_screen/models/pety_details_body.dart';
import 'package:pety/features/search_vet/vet_details_screen/models/pety_details_response.dart';
import 'package:pety/shared/network/local/shared_pred_constants.dart';
import 'package:pety/shared/network/local/shared_pref_helper.dart';
import 'package:pety/shared/network/remote/api_result.dart';
import 'package:pety/shared/network/remote/api_service.dart';
import 'package:pety/shared/network/remote/error_handler.dart';

class SearchVetRepository{
  final ApiService _apiService;
  SearchVetRepository(
     this._apiService,
  );

  Future<ApiResult<SearchVetsResponse>> getVets({
    required String role,
    required String sort,
    required int minPrice,
    required int maxPrice,
    required String availability,
    required int page,
    String? petyName,
    String? offer,
    String? animals,
  }) async{
    try{
        final SearchVetsResponse response = await _apiService.searchVets(
        role: role,
        sort: sort,
        minPrice: minPrice,
        maxPrice: maxPrice,
        availability: availability,
        page: page,
        petyName: petyName,
        offer: offer,
        animals: animals,
        limit: 15,
      );
      for(int i=0;i<response.data!.length;i++){
        for(int j=0;j<response.data![i].availabilityFormatted!.length; j++){
          response.data![i].availabilityFormatted![j].formatedDate = format1Date(response.data![i].availabilityFormatted![j].date!);
          response.data![i].availabilityFormatted![j].formate2Date = format2Date(response.data![i].availabilityFormatted![j].date!);
        }
      }
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<PetyDetailsResponse>> getPetyDetails({required PetyDetailsBody petyDetailsBody}) async{
    try{
      final PetyDetailsResponse response = await _apiService.getPetyDetails(
          petyDetailsBody,
      );
      response.data?.reviews?.forEach((element) {
        element.createdAt = formatDateReview(element.createdAt!);
      });
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<BookVetResponse>> bookVet({required BookVetBody bookVetBody}) async{
    try{
      final BookVetResponse response = await _apiService.bookVet(
        bookVetBody,
        'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  //add new review
  Future<ApiResult> addNewReview({required AddReviewBody reviewBody}) async{
    try{
      final response = await _apiService.addNewReview(
          reviewBody,
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  List<String> format1Date(String s){
     return DateFormat('EEE dd MMM').format(DateFormat('dd-MM-yyyy').parse(s)).split(' ');
  }

  String format2Date(String s){
    return DateFormat('EEEE dd MMMM yyyy').format(DateFormat('dd-MM-yyyy').parse(s));
  }

  String formatDateReview(String date){
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('d MMM, y').format(dateTime);
  }

}