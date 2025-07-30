import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nosirovtask/constants/color/color_const.dart';
import 'package:nosirovtask/constants/text_style/app_text_style.dart';
import 'package:nosirovtask/presentation/location/bloc/location_bloc.dart';
import 'package:nosirovtask/presentation/location/components/region_box.dart';
import 'package:nosirovtask/presentation/widgets/custom_text_field.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Text(
                      "location_title".tr(),
                      style: AppTextStyle.s16.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.verticalSpace,
                    CustomTextField(
                      controller: _controller,
                      keyboardType: TextInputType.text,
                      color: AppColors.textFieldColor,
                      hintText: "search".tr(),
                      onChanged: (value) {
                        context.read<LocationBloc>().add(
                              LocationEvent.searchRegions(value),
                            );
                      },
                      prefixIcon: Container(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.search,
                          color: AppColors.primaryColor,
                          size: 18.sp,
                        ),
                      ),
                    ),
                    24.verticalSpace,
                    Text(
                      "choose_location".tr(),
                      style: AppTextStyle.s16.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    16.verticalSpace,
                    Expanded(
                      child: BlocBuilder<LocationBloc, LocationState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state.errorMessage != null) {
                            return Center(
                              child: Text(
                                state.errorMessage!,
                                style: AppTextStyle.s16.copyWith(
                                  color: Colors.red,
                                ),
                              ),
                            );
                          }

                          if (state.filteredRegions.isEmpty) {
                            return Center(
                              child: Text(
                                "no_regions_found".tr(),
                                style: AppTextStyle.s16.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            );
                          }

                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final region = state.filteredRegions[index];
                              return RegionBox(
                                region: region,
                                onTap: () {
                                  context.read<LocationBloc>().add(
                                        LocationEvent.selectRegion(region),
                                      );
                                },
                              );
                            },
                            separatorBuilder: (context, index) => Divider(
                              color: AppColors.cEEEEEEEE,
                              height: 1,
                            ),
                            itemCount: state.filteredRegions.length,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
