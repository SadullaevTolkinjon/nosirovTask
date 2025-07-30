import 'dart:math';

import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFormatters {
  static final numberFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static final carNumberFormatter = MaskTextInputFormatter(
    mask: '## #######',
    filter: {"#": RegExp(r'^[a-zA-Z0-9]+$')},
    type: MaskAutoCompletionType.lazy,
  );

  static final MaskTextInputFormatter phoneNumberMask = MaskTextInputFormatter(
    mask: '+998 ## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static final MaskTextInputFormatter phoneNumberMaskV2 = MaskTextInputFormatter(
    mask: '+### ## ### ## ##',
    // filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static final cardNumberFormatter = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static final validityCardFormatter = MaskTextInputFormatter(
    mask: '##/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static final latinCharactersFormatter =
      FilteringTextInputFormatter.allow(RegExp("[0-9A-Z]"));

  static final latinCharactersWithoutNumbersFormatter =
      FilteringTextInputFormatter.allow(RegExp("[A-Z]"));

  static final dateFormatter = DateTextFormatter();
}


class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '.');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String separator) {
    value = value.replaceAll(separator, '');
    var newString = '';

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += separator;
      }
    }

    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
