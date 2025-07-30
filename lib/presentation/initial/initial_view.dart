import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nosirovtask/constants/color/color_const.dart';
import 'package:nosirovtask/constants/generated/assets.dart';
import 'package:nosirovtask/constants/text_style/app_text_style.dart';
import 'package:nosirovtask/core/utils/extensions/extensions.dart';
import 'package:nosirovtask/core/utils/router/router.dart';
import 'package:nosirovtask/presentation/initial/bloc/initial_bloc.dart';
import 'package:nosirovtask/presentation/widgets/custom_btn.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialBloc, InitialState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      50.verticalSpace,
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          width: 238.w,
                          alignment: Alignment.center,
                          child: Image.asset(Assets.logo),
                        ),
                      ),
                      26.height,
                      Text(
                        "Panda",
                        style: AppTextStyle.s23.copyWith(
                            fontSize: 72.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "choose_app_language".tr(),
                        style: AppTextStyle.s16.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      36.height,
                      Row(
                        children: [
                          Expanded(
                            child: CustomBtn2(
                              isDisable: state.currentLang == "uz",
                              onTap: () async {
                                context.read<InitialBloc>().add(
                                      const InitialEvent.changeLang("uz"),
                                    );
                                await context
                                    .setLocale(const Locale('uz', 'UZ'));
                              },
                              title: "uz_lang".tr(),
                            ),
                          ),
                          16.width,
                          Expanded(
                            child: CustomBtn2(
                              isDisable: state.currentLang == "ru",
                              onTap: () async {
                                context.read<InitialBloc>().add(
                                      const InitialEvent.changeLang("ru"),
                                    );
                                await context
                                    .setLocale(const Locale('ru', 'RU'));
                              },
                              title: "ru_lang".tr(),
                            ),
                          )
                        ],
                      ),
                      16.height,
                      CustomBtn(
                        onTap: () {
                          context.router.push(const AllowAccessLocationRoute());
                        },
                        title: "continue".tr(),
                        titleColor: AppColors.white,
                        backgroundColor: AppColors.primaryColor,
                      ),
                      40.height,
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
