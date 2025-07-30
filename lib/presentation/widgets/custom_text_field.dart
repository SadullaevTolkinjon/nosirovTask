import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nosirovtask/constants/color/color_const.dart';
import 'package:nosirovtask/constants/text_style/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color color;

  final bool autoFocus;
  final String? title;
  final TextInputType keyboardType;
  final String iconPath;
  final String hintText;
  final bool obsecureText;
  final int maxline;
  Widget? suffixIcon;
  Widget? prefixIcon;
  final bool enable;
  final Function(String)? onChanged;
  CustomTextField( 
      {super.key,
      required this.controller,
      required this.color,
      this.autoFocus = true,
      this.title,
      this.keyboardType = TextInputType.phone,
      this.iconPath = "",
      this.hintText = "",
      this.obsecureText = false,
      this.suffixIcon,
      this.maxline = 1,
      this.enable = true,
      this.prefixIcon,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        maxLines: maxline,
        //inputFormatters: [InputFormatters.phoneNumberMaskV2],
        keyboardType: keyboardType,
        enabled: enable,
        style: AppTextStyle.s16.copyWith(
          color: AppColors.black,
        ),
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyle.s15W400.copyWith(color: AppColors.primaryColor),
          filled: true,
          fillColor: Colors.transparent,
          focusColor: AppMaterialColor.blue[500],
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          suffixIcon: suffixIcon,
          suffixIconConstraints: BoxConstraints(
            minWidth: 48.w,
            minHeight: 48.h,
          ),
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(
            maxWidth: 20.w,
            maxHeight: 20.h,
          ),
        ),
        autofocus: autoFocus,
        obscureText: obsecureText,
        onChanged: (value) {
          onChanged?.call(value);
        },
      ),
    );
  }
}
