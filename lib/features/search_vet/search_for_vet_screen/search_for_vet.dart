import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/features/search_vet/cubit/search_vet_cubit.dart';
import 'package:pety/features/search_vet/cubit/search_vet_states.dart';
import 'package:pety/features/search_vet/search_for_vet_screen/widgets/filter_bottom_sheet/animals_options.dart';
import 'package:pety/features/search_vet/search_for_vet_screen/widgets/filter_bottom_sheet/apply_reset_buttons.dart';
import 'package:pety/features/search_vet/search_for_vet_screen/widgets/filter_bottom_sheet/availability_options.dart';
import 'package:pety/features/search_vet/search_for_vet_screen/widgets/filter_bottom_sheet/bottom_header.dart';
import 'package:pety/features/search_vet/search_for_vet_screen/widgets/filter_bottom_sheet/from_upper_to_lower.dart';
import 'package:pety/features/search_vet/search_for_vet_screen/widgets/filter_bottom_sheet/price.dart';
import 'package:pety/features/search_vet/search_for_vet_screen/widgets/filter_bottom_sheet/sort_options.dart';
import 'package:pety/features/search_vet/search_for_vet_screen/widgets/filter_bottom_sheet/vet_name_and_offers.dart';
import 'package:pety/features/search_vet/search_for_vet_screen/widgets/vet_item_widget.dart';
import 'package:pety/shared/styles/colors.dart';
import 'package:pety/shared/widgets/default_search.dart';
import 'package:pety/shared/widgets/vertical_space.dart';

class SearchForVet extends StatefulWidget {

  const SearchForVet({super.key});

  @override
  State<SearchForVet> createState() => _SearchForVetState();

}

class _SearchForVetState extends State<SearchForVet> {

  final ScrollController _scrollController = ScrollController();

  SearchVetCubit getCubit(BuildContext context)=>context.read<SearchVetCubit>();

  @override
  void initState() {
    super.initState();
    int page=1;
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        debugPrint("Last item is visible!");
        if(context.read<SearchVetCubit>().addMore){
          context.read<SearchVetCubit>().getVets(page: ++page);
        }else{
          page=1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchVetCubit,SearchVetStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              children: [
                DefaultSearch(
                  controller: getCubit(context).searchController,
                  text: 'Search',
                  showFilters: (){
                    showFiltersBottomSheet(cubitContext:context);
                  },
                  onSubmit: (value){
                    getCubit(context).getVets();
                  },
                ),
                SizedBox(height: 20.h,),
                Expanded(
                  child: ConditionalBuilder(
                    condition: getCubit(context).vets!=null,
                    builder: (context)=> ListView.separated(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => VetItemWidget(item: getCubit(context).vets![index]),
                        separatorBuilder: (context, index) =>
                        const Divider(
                          thickness: 1, color: ColorManager.dashLineColor,),
                        itemCount: getCubit(context).vets!.length
                    ),
                    fallback: (context)=> const Center(child: CircularProgressIndicator(),)
                  ),
                ),
                const VerticalSpace(height: 5),
                if(state is Loading && getCubit(context).vets!=null)
                   SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: const Center(child: CircularProgressIndicator(strokeWidth: 3,))
                  ),

              ],
            ),
          ),
        );
      },
    );
  }


  void showFiltersBottomSheet({required BuildContext cubitContext}){
    showModalBottomSheet(
      context: cubitContext,
      builder: (context){
        return Container(
          height: double.infinity ,//MediaQuery.of(context).size.height*0.75,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderBottomSheet(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VetNameAndOffers(cubitContext: cubitContext),
                        PriceFilters(cubitContext: cubitContext),
                        AnimalsOptions(cubitContext: cubitContext),
                        AvailabilityOptions(cubitContext: cubitContext),
                        SortOptions(cubitContext: cubitContext),
                        FromUpperToLower(cubitContext: cubitContext),
                      ],
                    ),
                  ),
                ),
                const VerticalSpace(height: 10),
                ApplyAndResetButtons(cubitContext: cubitContext),
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

}