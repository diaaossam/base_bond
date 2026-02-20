import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EgyptianPhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // أرقام بس
    text = text.replaceAll(RegExp(r'[^0-9]'), '');

    // لو فاضي خليه 01
    if (text.isEmpty) {
      text = '01';
    }

    // لو مش بيبدأ بـ 01 رجعه
    if (!text.startsWith('01')) {
      text = '01';
    }

    // أقصى طول 11 رقم
    if (text.length > 11) {
      text = text.substring(0, 11);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
