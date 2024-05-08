import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/dashboard/appointments/appointments_screen.dart';
import 'package:pety/features/dashboard/pety_information/pety_information_screen.dart';
import 'package:pety/features/dashboard/shared/cubit/dashobard_cubit.dart';
import 'package:pety/features/dashboard/work_hours/work_hours_screen.dart';
import 'package:pety/shared/styles/texts.dart';
import 'package:pety/shared/widgets/default_back_app_bar.dart';


class DashboardLayout extends StatefulWidget {
  String role;
  DashboardLayout({super.key,required this.role});

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
      appBar: AppBar(
        leading: DefaultBackAppBar(
          context: context,
          onBack: (){context.read<DashboardCubit>().onBackPressed(context);},
        ),
        title: const Center(child: Text('Dashboard')),
        bottom: TabBar(
          controller: _tabController,
          tabs:  const [
            Text('Appointments'),
            Text('Work Hours'),
            Text('Pety Information'),
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

