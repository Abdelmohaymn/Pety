import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/dashboard/appointments/appointments_screen.dart';
import 'package:pety/features/dashboard/pety_information/pety_information_screen.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/features/dashboard/work_hours/work_hours_screen.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_back_app_bar.dart';


class DashboardLayout extends StatefulWidget {
  final String role;
  const DashboardLayout({super.key,required this.role});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with TickerProviderStateMixin {

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorManager.backgroundBlue,
      appBar: AppBar(
        backgroundColor: ColorManager.backgroundBlue,
        leading: DefaultBackAppBar(
          context: context,
          onBack: (){context.read<DashboardCubit>().onBackPressed(context);},
        ),
        title: Text(
          'Dashboard',
          style: TextStyles.font18LightBlackBold.copyWith(
            fontFamily: "Montserrat"
          )
        ),
        centerTitle: true,
        bottom: TabBar(
          labelPadding: const EdgeInsets.only(bottom: 10),
          labelStyle: TextStyles.font16DefaultMedium.copyWith(
            fontFamily: "Fredoka"
          ),
          unselectedLabelStyle: TextStyles.font16DefaultMedium.copyWith(
              color: ColorManager.grey,
              fontFamily: "Fredoka"
          ),
          controller: _tabController,
          tabs:  const [
            Text('Appointments'),
            Text('Work Hours'),
            Text('Information'),
          ],

        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
            AppointmentsScreen(),
            WorkHoursScreen(),
            PetyInfoScreen()
        ]
     )
    );
  }
}

