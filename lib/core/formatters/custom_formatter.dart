import 'package:flutter/services.dart';

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 2) {
      return TextEditingValue(
        text: '${newValue.text.substring(0, 2)}/${newValue.text.substring(2)}',
        selection: TextSelection.collapsed(offset: newValue.selection.end + 1),
      );
    }
    return newValue;
  }
}

class BankCardInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text =
        newValue.text.replaceAll(RegExp(r'\s'), ''); // Remove spaces from input
    if (text.length <= 16) {
      StringBuffer newText = StringBuffer();
      for (int i = 0; i < text.length; i++) {
        if (i > 0 && i % 4 == 0) {
          newText.write(' '); // Insert space every 4 characters
        }
        newText.write(text[i]);
      }
      return TextEditingValue(
        text: newText.toString(),
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }
    return oldValue;
  }
}
