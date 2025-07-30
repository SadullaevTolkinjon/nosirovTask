import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nosirovtask/constants/color/color_const.dart';
import 'package:nosirovtask/constants/generated/assets.dart';
import 'package:nosirovtask/constants/text_style/app_text_style.dart';
import 'package:nosirovtask/core/utils/extensions/extensions.dart';
import 'package:nosirovtask/core/utils/router/router.dart';
import 'package:nosirovtask/presentation/widgets/custom_btn.dart';

@RoutePage()
class AllowAccessLocationPage extends StatelessWidget {
  const AllowAccessLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Image.asset(Assets.location),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "allow_access_location_text".tr(),
                      style: AppTextStyle.s16.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    24.verticalSpace,
                    Text(
                      "allow_access_location_text_2".tr(),
                      style: AppTextStyle.s16.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    30.verticalSpace,
                    CustomBtn(
                      onTap: () {},
                      title: "allow_access_location_btn".tr(),
                    ),
                    16.verticalSpace,
                    CustomBtn2(
                      onTap: () {
                        context.router.push(const LocationRoute());
                      },
                      title: "allow_access_location_btn_2".tr(),
                    ),
                    40.verticalSpace
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
