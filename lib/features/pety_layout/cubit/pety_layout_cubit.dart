
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pety/features/community/community_Screen.dart';
import 'package:pety/features/home/home_Screen.dart';
import 'package:pety/features/profile/profile_screen.dart';
import 'package:pety/features/pety_layout/cubit/pet_layout_states.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';

class PetLayoutCubit extends Cubit<PetLayoutStates>{

  PetLayoutCubit() : super(const PetLayoutStates.initial());

  static PetLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CommunityScreen(),
    ProfileScreen()
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
      backgroundColor: ColorManager.homeBackground,
      title: Row(
        children: [
          SvgPicture.asset('assets/svgs/menu.svg',width: 25.w,height: 25.h),
          SizedBox(width: 20.w,),
          Text('Pety',style: TextStyles.font16BlackRegular,)
        ],
      ),
      actions: [
        IconButton(
          onPressed: (){},
          icon: SvgPicture.asset('assets/svgs/menu.svg')
        )
      ],
    ),
    AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorManager.homeBackground,
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
      backgroundColor: ColorManager.homeBackground,
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
    JobListItem(title: 'Pet taxi', image:'assets/images/pet_taxi.png'),
  ];


  void changeBottomNavIndex(int index){
    currentIndex = index;
    emit(const PetLayoutStates.initial());
    emit(const PetLayoutStates.changeBottomNavIndexState());
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