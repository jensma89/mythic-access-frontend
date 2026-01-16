// text_field.dart

import 'package:flutter/material.dart';

enum ValueType { string, int, double, email }

class LabeledTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final ValueType valueType;
  final int maxLines;
  final TextEditingController? controller;

  const LabeledTextField({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.valueType,
    this.maxLines = 1,
    this.controller,
  }) : super(key: key);

  TextInputType _getKeyboardType() {
    switch (valueType) {
      case ValueType.int:
      case ValueType.double:
        return TextInputType.number;
      case ValueType.email:
        return TextInputType.emailAddress;
      case ValueType.string:
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 15),
        TextField(
          controller: controller,
          keyboardType: _getKeyboardType(),
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: placeholder,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}
