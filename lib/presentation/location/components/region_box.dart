import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nosirovtask/constants/color/color_const.dart';
import 'package:nosirovtask/constants/text_style/app_text_style.dart';
import 'package:nosirovtask/domain/model/region/region_model.dart';

class RegionBox extends StatelessWidget {
  final RegionModel region;
  final VoidCallback onTap;
  const RegionBox({super.key, required this.region,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTap();},
      child: SizedBox(
        height: 72.h,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.locale.languageCode == 'uz'
                        ? region.nameUz
                        : context.locale.languageCode == 'ru'
                            ? region.nameRu
                            : region.nameEn,
                    style: AppTextStyle.s16.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    context.locale.languageCode == 'uz'
                        ? region.capitalUz
                        : context.locale.languageCode == 'ru'
                            ? region.capitalRu
                            : region.capitalEn,
                    style: AppTextStyle.s16.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryColor,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
