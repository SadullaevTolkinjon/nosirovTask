
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color/color_const.dart';

class CustomModalSheet2 extends StatelessWidget {
  const CustomModalSheet2({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        // borderRadius: BorderRadius.only(
        //   topRight: Radius.circular(16.r),
        //   topLeft: Radius.circular(16.r),
        // ),
      ),
      child: Wrap(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 20.h, minHeight: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Container(
              height: 4.h,
              width: 70.w,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.9),
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w), child: body),
            ),
          ),
        ],
      ),
    );
  }
}

class ShowCustomBottomSheet {
  static Future<T?> show<T>(BuildContext context, Widget content) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => content,
    );
  }
}
