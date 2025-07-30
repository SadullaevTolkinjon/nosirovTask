import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color/color_const.dart';
import '../../constants/text_style/app_text_style.dart';

class CustomSnackbar extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final Duration duration;

  const CustomSnackbar({
    super.key,
    required this.message,
    this.backgroundColor = AppColors.white,
    this.textColor = Colors.white,
    this.duration = const Duration(seconds: 2),
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(

      backgroundColor: backgroundColor,
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      duration: duration,
    );
  }

  void showSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        
        content: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          constraints: BoxConstraints(minHeight: 58.h),
          width: double.infinity,
          decoration: BoxDecoration(
             
              gradient: LinearGradient(
                  colors: [AppColors.green, AppColors.green])),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 24.h,
                width: 24.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.r),
                    ),
                    color: AppColors.white),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.done,
                  color: AppColors.white,
                  size: 20,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Text(
                  message,
                  style: AppTextStyle.s16.copyWith(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
        duration: duration,
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent, // Make background transparent
        elevation: 0, // Remove default shadow
        content: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: double.infinity,
          // Remove fixed height - let it size based on content
          constraints: BoxConstraints(
            minHeight: 58.h, // Set minimum height if needed
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            color: AppColors.red,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 12.h, // Add vertical padding for better spacing
          ),
          child: IntrinsicHeight(
            // This ensures the container wraps content height
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 24.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.r),
                    ),
                    color: AppColors.white,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.close,
                    color: AppColors.red,
                    size: 20.h,
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Text(
                    message,
                    style: AppTextStyle.s16.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    // Allow text to wrap to multiple lines
                    maxLines: null,
                    overflow: TextOverflow.visible,
                  ),
                )
              ],
            ),
          ),
        ),
        duration: duration,
      ),
    );
  }
}

// Method to show the custom snackbar



class CustomSnackbarTop extends StatelessWidget {
   final String message;
  final Color backgroundColor;
  final Color textColor;
  final Duration duration;

  const CustomSnackbarTop({
    super.key,
    required this.message,
    this.backgroundColor = AppColors.white,
    this.textColor = Colors.white,
    this.duration = const Duration(seconds: 2),
  });


  void showErrorAtTop(BuildContext context) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
    
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16.h, // Below status bar
        left: 16.w,
        right: 16.w,
        child: Material(
          color: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 58.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              color: AppColors.red,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      color: AppColors.white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(Icons.close, color: AppColors.red, size: 20.h),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Text(
                      message,
                      style: AppTextStyle.s16.copyWith(fontWeight: FontWeight.w500,color: textColor),
                      maxLines: null,
                      overflow: TextOverflow.visible,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Auto remove after duration
    Timer(duration, () {
      overlayEntry.remove();
    });
  }

  void showCustomPosition(BuildContext context, {
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
    
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: top,
        bottom: bottom,
        left: left ?? 16.w,
        right: right ?? 16.w,
        child: Material(
          color: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 58.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              color: AppColors.red,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      color: AppColors.white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(Icons.close, color: AppColors.red, size: 20.h),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Text(
                      message,
                      style: AppTextStyle.s16.copyWith(fontWeight: FontWeight.w500,color: textColor),
                      maxLines: null,
                      overflow: TextOverflow.visible,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Timer(duration, () => overlayEntry.remove());
  }
  
  @override
  Widget build(BuildContext context) {
    return SnackBar(

      backgroundColor: backgroundColor,
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      duration: duration,
    );
  }
}