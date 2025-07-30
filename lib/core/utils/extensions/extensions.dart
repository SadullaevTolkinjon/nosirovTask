import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Neumorphism on Widget {
  addNeumorphism(
      {double borderRadius = 10.0,
      Offset offset = const Offset(5, 5),
      double blurRadius = 10,
      Color topShadowColor = Colors.white60,
      Color bottomShadowColor = const Color(0x26234395)}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            offset: offset,
            blurRadius: blurRadius,
            color: bottomShadowColor,
          ),
          BoxShadow(
            offset: Offset(-offset.dx, -offset.dx),
            blurRadius: blurRadius,
            color: topShadowColor,
          ),
        ],
      ),
      child: this,
    );
  }
}

extension EmptySpace on num {
  SizedBox get height => SizedBox(
        height: toDouble().h,
      );
  SizedBox get width => SizedBox(
        width: toDouble().w,
      );
}



extension HexColor on String {
  Color toColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) {
      buffer.write('ff'); // Add alpha if it's missing
    }
    buffer.write(replaceFirst('#', ''));
    try {
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      throw const FormatException("Invalid hex color format");
    }
  }
}

extension RemovePlus on String {
  String removePlus() {
    return replaceAll('+', '');
  }
}

extension DateTimeStringExtension on String {
  String toFormatCurrentDate() {
    DateTime dateTime = DateTime.parse(this);
    DateFormat dateFormat = DateFormat('dd.MM.yyyy');
    return dateFormat.format(dateTime);
  }
}




extension LocaleExtension on Locale {
  Locale getLocale() {
    switch (languageCode) {
      case 'uz':
        return scriptCode == 'Cyrl'
            ? const Locale.fromSubtags(languageCode: 'uz', scriptCode: 'Cyrl')
            : const Locale("uz", "UZ");
      case 'ru':
        return const Locale('ru', 'RU');
      case 'en':
        return const Locale('en', 'US');
      default:
        return const Locale('ru', 'RU');
    }
  }
}

extension LocalizationExtension on Locale {
  String getLanguageName() {
    switch (languageCode) {
      case 'uz':
        return scriptCode == 'Cyrl' ? 'uz_cyrl'.tr() : 'uz_lang'.tr();
      case 'ru':
        return 'ru_lang'.tr();
      case 'en':
        return 'en_lang'.tr();
      default:
        return '';
    }
  }
}

extension PhoneNumberDesiredFormatExtension on String {
  String convertToDesiredFormat() {
    String numericPhoneNumber = replaceAll(RegExp(r'\D+'), '');
    if (numericPhoneNumber.startsWith('998')) {
      numericPhoneNumber = numericPhoneNumber.substring(3);
    }
    return '998$numericPhoneNumber';
  }
}
