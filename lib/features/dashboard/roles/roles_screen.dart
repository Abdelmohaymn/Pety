import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pety/features/dashboard/shared/cubit/dashboard_states.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/routing/routes.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_app_bar.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class RolesScreen extends StatelessWidget {
  const RolesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Roles',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
        child: BlocBuilder<DashboardCubit, DashboardStates>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if(state is Success && state.data.data.length==0){
              return const Center(
                child: Text('You have no role.')
              );
            } else if (state is Error) {
              return Center(
                child: Text('Error: ${state.error}'),
              );
            } else{
              DashboardCubit cubit = context.read<DashboardCubit>();
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: cubit.roles!.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: (MediaQuery.of(context).size.width) / 2,
                          crossAxisSpacing: 10.w
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        String role = cubit.roles![index];
                        String image = 'pet_sitter.png';
                        if(role=='vet') {
                          image='pet_vet.png';
                        } else if(role=='groomer'){
                          image='pet_groomer.png';
                        }

                        return Container(
                          decoration: BoxDecoration(
                              color: ColorManager.defaultColor,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: InkWell(
                            onTap: (){
                              Map<String,dynamic> mp={};
                              mp['cubitContext']=context;
                              mp['petRole']=role;
                              context.pushNamed(Routes.dashboardLayout,arguments: mp);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/images/$image'),
                                  width: 100,
                                  height: 100,
                                ),
                                const VerticalSpace(height: 20),
                                Text(
                                  role,
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyles.font13WhiteBold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }

          },
        ),
      ),
    );
  }
}
