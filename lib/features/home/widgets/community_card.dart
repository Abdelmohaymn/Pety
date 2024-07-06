
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/styles/font_families.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_button.dart';

class CommunityCard extends StatelessWidget{
  const CommunityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/community_back.jpg'),
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 160.w,
                    child: Text(
                      'Join Our Community for Pets Owners',
                      style: TextStyles.font16DefaultSemiBold.copyWith(
                        fontFamily: FontFamilyHelper.fredoka
                      ),
                    ),
                  ),
                  const Spacer(),
                  DefaultButton(
                      width: 70.w,
                      height: 30.h,
                      textStyle: TextStyles.font7DefaultBold.copyWith(
                        fontSize: 8.sp,
                        fontFamily: FontFamilyHelper.montserrat
                      ),
                      color: Colors.white,
                      radius: 6,
                      text: 'Community',
                      onClick: (){
                        context.pushNamed(Routes.communityScreen);
                      }
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 120.h,
              width: 120.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/person_with_dog.png'),
                )
              ),
            ),
          )
        ],
      ),
    );
  }

}