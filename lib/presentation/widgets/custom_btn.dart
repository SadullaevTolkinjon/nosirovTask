import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color/color_const.dart';
import '../../constants/text_style/app_text_style.dart';

// ignore: must_be_immutable
class CustomBtn extends StatefulWidget {
  CustomBtn({
    super.key,
    required this.onTap,
    this.title = "",
    this.height,
    this.width,
    this.backgroundColor,
    this.titleColor,
    this.borderRadius = 16.0,
  });
  final VoidCallback onTap;
  final String title;
  double? height;
  double? width;
  Color? backgroundColor;
  Color? titleColor;
  final double borderRadius;
  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTap: () {
        _controller.forward(from: 5).then((value) {
          _controller.reverse(from: 5);
        });
        widget.onTap();
      },
      child: Transform.scale(
        scale: _scale,
        child: Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 56.h,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(widget.borderRadius.r),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.title,
            style: AppTextStyle.s16.copyWith(
              fontWeight: FontWeight.w500,
              color: widget.titleColor ?? AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}

// ignore: must_be_immutable
class CustomBtn2 extends StatefulWidget {
  CustomBtn2({
    super.key,
    required this.onTap,
    this.title = "",
    this.isDisable = true,
    this.height,
    this.width,
    this.borderColor,
    this.titleColor,
    this.backgroundColor,
    this.borderRadius = 16.0,
  });
  final VoidCallback onTap;
  final String title;
  final bool isDisable;
  double? height;
  double? width;
  Color? borderColor;
  Color? titleColor;
  Color? backgroundColor;
  final double borderRadius;
  @override
  State<CustomBtn2> createState() => _CustomBtn2State();
}

class _CustomBtn2State extends State<CustomBtn2>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTap: () {
        _controller.forward(from: 5).then((value) {
          _controller.reverse(from: 5);
        });
        widget.onTap();
      },
      child: Transform.scale(
        scale: _scale,
        child: Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 56.h,
          decoration: BoxDecoration(
              color: widget.isDisable
                  ? widget.backgroundColor ?? AppColors.white
                  : AppColors.primaryColor,
              borderRadius: BorderRadius.circular(widget.borderRadius.r),
              border: widget.isDisable
                  ? Border.all(
                      color: widget.borderColor ?? AppColors.primaryColor)
                  : null),
          alignment: Alignment.center,
          child: Text(
            widget.title,
            style: AppTextStyle.s16.copyWith(
              fontWeight: FontWeight.w500,
              color: widget.isDisable
                  ? widget.titleColor ?? AppColors.primaryColor
                  : AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
