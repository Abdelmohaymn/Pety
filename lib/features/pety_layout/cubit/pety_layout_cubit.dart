

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/community/community_Screen.dart';
import 'package:pety/features/home/home_Screen.dart';
import 'package:pety/features/pety_layout/data/models/chat_bot_body.dart';
import 'package:pety/features/pety_layout/data/repository/pety_repository.dart';
import 'package:pety/features/pety_layout/find_my_pet/models/cities_model.dart';
import 'package:pety/features/pety_layout/find_my_pet/models/find_pet_body.dart';
import 'package:pety/features/pety_layout/find_my_pet/models/find_pet_response.dart';
import 'package:pety/features/pety_layout/find_my_pet/models/governments_model.dart';
import 'package:pety/features/profile/cubit/profile_cubit.dart';
import 'package:pety/features/profile/pre_profile/pre_profile_screen.dart';
import 'package:pety/features/pety_layout/cubit/pet_layout_states.dart';
import 'package:pety/shared/constants/pety_constants.dart';
import 'package:pety/shared/di/dependency_injection.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/network/local/shared_pred_constants.dart';
import 'package:pety/shared/network/local/shared_pref_helper.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:url_launcher/url_launcher.dart';

class PetLayoutCubit extends Cubit<PetLayoutStates>{

  final PetyRepository _petyRepository;
  PetLayoutCubit(this._petyRepository) : super(const PetLayoutStates.initial());


  // chatBot beginning
  List<String> chatBotMessages=[ChatBotConstants.initialMessage];
  TextEditingController chatController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool allowAnimatedText = true;

  void predictForChatBot() async{
    emit(const PetLayoutStates.loadChatBotMessages());
    allowAnimatedText = true;
    if(chatBotMessages[0]==ChatBotConstants.initialMessage){
      chatBotMessages.removeAt(0);
    }
    if(chatController.text.isNotBlank()){
      chatBotMessages.insert(0,chatController.text);
    }
    chatController.clear();
    final response = await _petyRepository.predictMessages(
      ChatBotBody(messages: chatBotMessages.reversed.toList())
    );
    response.when(
        success: (data){
          chatBotMessages.insert(0,data.response!);
          emit(const PetLayoutStates.successChatBotMessages());
        },
        failure: (error){
          emit(PetLayoutStates.errorChatBotMessages(error: error.apiErrorModel.message!));
        }
    );
  }

  void clearChat(){
    emit(const PetLayoutStates.loadClearMessages());
    chatBotMessages=[ChatBotConstants.initialMessage];
    allowAnimatedText = true;
    emit(const PetLayoutStates.successClearMessages());
  }

  void stopAnimatedText(){
    emit(const PetLayoutStates.loadAllowAnimatedText());
    allowAnimatedText = false;
    emit(const PetLayoutStates.successAllowAnimatedText());
  }
  // chatBot finishing


  // find my pet beginning
  String? country='Egypt', city, government,animal;
  List<DropdownMenuItem<String>> countries=[
    const DropdownMenuItem(
      value: 'Egypt',
      child: Text('Egypt'),
    ),
  ];
  List<DropdownMenuItem<String>> governments=[];
  List<DropdownMenuItem<String>> cities=[];
  List<DropdownMenuItem<String>> animals=[];

  TextEditingController addressController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  // locations form json
  List<GovernmentsData>?governLocations;
  List<CitiesData>? citiesLocations;

  File? petImage;
  bool uploadPet=false;
  List<Data>? missingPets;

  void getLocationsData()async{
    emit(const PetLayoutStates.loadGetLocations());
    //get governs
    List<GovernmentsModel> list = await _petyRepository.fetchGovernmentsFromJson();
    governLocations = list[2].data!;
    governLocations?.forEach((element) {
      governments.add(
          DropdownMenuItem(
            value: element.governorateNameEn,
            child: Text(element.governorateNameEn!),
          )
      );
    });
    //get cities
    List<CitiesModel> list2 = await _petyRepository.fetchCitiesFromJson();
    citiesLocations = list2[2].data!;
    citiesLocations?.forEach((element) {
      cities.add(
          DropdownMenuItem(
            value: element.cityNameEn,
            child: Text(element.cityNameEn!),
          )
      );
    });
    //get animals
    for (var element in AnimalsConstants.animalsList) {
      animals.add(
          DropdownMenuItem(
            value: element,
            child: Text(element),
          )
      );
    }
    emit(const PetLayoutStates.successGetLocations());
  }

  void changeLocationValue(String value,String type){
    emit(const PetLayoutStates.loadChangeLocation());
    if(type=='city'){
      city=value;
    }else if(type=='government'){
      government=value;
      for(var element in governLocations!){
        if(element.governorateNameEn==value){
          city=null;
          cities=[];
          for(var city in citiesLocations!){
            if(city.governorateId==element.id){
              cities.add(
                DropdownMenuItem(
                  value: city.cityNameEn,
                  child: Text(city.cityNameEn!),
                ),
              );
            }
          }
          break;
        }
      }
      
    }else if(type=='country'){
      country=value;
    }else{
      animal=value;
    }
    emit(const PetLayoutStates.successChangeLocation());
  }

  void onBackFromFindPet(BuildContext context){
    city = government = animal = null;
    addressController.clear();
    notesController.clear();
    petImage=null;
    uploadPet=false;
    context.pop();
  }

  void pickImage() async{
    emit(const PetLayoutStates.loadPetImage());
    petImage = await _petyRepository.pickImage();
    emit(const PetLayoutStates.successPetImage());
  }

  Future<void> uploadMissingPet() async {
    emit(const PetLayoutStates.loadRegisterPet());
    uploadPet=false;
    FindPetBody findPetBody = FindPetBody(
      base64: [petImage!.imageToBase64()],
      missing: 0,
      type: animal,
      gov: "$country-$government-$city",
      location: addressController.text,
      note: notesController.text,
      petID: DateTime.now().millisecondsSinceEpoch.toString()
    );

    final response = await _petyRepository.uploadMissingPet(findPetBody);
    response.when(
        success: (data){
          if(data.data?.success!=null){
            uploadPet=true;
          }
          emit(const PetLayoutStates.successRegisterPet());
        },
        failure: (error){
          emit(PetLayoutStates.errorRegisterPet(error: error.apiErrorModel.message!));
        }
    );

  }

  Future<void> findMissingPet() async {
    emit(const PetLayoutStates.loadFindPet());
    FindPetBody findPetBody = FindPetBody(
        base64: [petImage!.imageToBase64()],
        missing: 1,
        type: animal,
        gov: "$country-$government-$city",
    );

    final response = await _petyRepository.findMissingPet(findPetBody);
    response.when(
        success: (data){
          missingPets = data.data;
          emit(PetLayoutStates.successFindPet(data));
        },
        failure: (error){
          emit(PetLayoutStates.errorFindPet(error: error.apiErrorModel.message!));
        }
    );

  }

  // find my pet finishing


  // pety layout beginning
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CommunityScreen(),
    BlocProvider(
        create: (context) => getIt<ProfileCubit>()..getUserData(),
        child: const PreProfileScreen()
    ),
  ];

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/svgs/home.svg',
        width: 30.w,height: 30.h,
        color: ColorManager.grey,
      ),
      activeIcon: SvgPicture.asset(
        'assets/svgs/home.svg',
        width: 30.w,height: 30.h,
        color: ColorManager.defaultColor,
        ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble_outline,size: 30,),
        //icon: SvgPicture.asset('assets/svgs/pet_profile.svg',width: 30.w,height: 30.h,color: ColorManager.defaultColor,),
        label: 'Community'
    ),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/svgs/ppp.svg',width: 30.w,height: 30.h,color: ColorManager.defaultColor,),
        //icon: Image(image: const AssetImage('assets/images/pet_prof.png'),width: 30.w,height: 30.h),
        label: 'Profile'
    ),
  ];

  List<AppBar> titles = [
    AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorManager.backgroundBlue,
      title: Row(
        children: [
          SvgPicture.asset('assets/svgs/menu.svg',width: 25.w,height: 25.h),
          SizedBox(width: 20.w,),
          Text(
            'Pety',
            style: GoogleFonts.montserrat(
              textStyle: TextStyles.font16BlackBold.copyWith(
                fontSize: 25.sp
              )
            ),
          )
        ],
      ),
     /* actions: [
        IconButton(
          onPressed: (){},
          icon: SvgPicture.asset('assets/svgs/menu.svg')
        )
      ],*/
    ),
    AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorManager.backgroundBlue,
      title: const Row(
        children: [
          Icon(Icons.arrow_back_ios_new),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Community'),
              ],
            ),
          )
        ],
      ),
    ),
    AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorManager.backgroundBlue,
      /*leading: const Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: Icon(Icons.arrow_back_ios_new),
      ),*/
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profile'),
        ],
      ),
    ),
  ];

  List<JobListItem> jobsList = [
    JobListItem(title: 'Veterinarian', image:'assets/images/pet_vet.png'),
    JobListItem(title: 'Pet sitter', image:'assets/images/pet_sitter.png'),
    JobListItem(title: 'Pet groomer', image:'assets/images/pet_groomer.png'),
    //JobListItem(title: 'Pet taxi', image:'assets/images/pet_taxi.png'),
  ];

  void changeBottomNavIndex(int index){
    currentIndex = index;
    emit(const PetLayoutStates.initial());
    emit(const PetLayoutStates.changeBottomNavIndexState());
  }

  // pety layout finishing

  void moveToChatBotScreen(BuildContext context){
    context.pushNamed(Routes.chatBotScreen,arguments: context);
  }

  Future<void> moveToWebPage(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

}


class JobListItem{
  final String title;
  final String image;
  JobListItem({
    required this.title,
    required this.image
  });

}