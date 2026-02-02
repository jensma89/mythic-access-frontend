// text_field.dart

import 'package:flutter/material.dart';

enum ValueType {
  string,
  int,
  double,
  email,
  password,
  usernameOrEmail,
  multilineText,
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String semanticsLabel;
  final String placeholder;
  final ValueType valueType;
  final int maxLines;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.semanticsLabel,
    required this.placeholder,
    required this.valueType,
    this.maxLines = 1,
    this.controller,
  });

  TextInputType _getKeyboardType() {
    switch (valueType) {
      case ValueType.int:
      case ValueType.double:
        return TextInputType.number;

      case ValueType.email:
      case ValueType.usernameOrEmail:
        return TextInputType.emailAddress;

      case ValueType.password:
        return TextInputType.visiblePassword;

      case ValueType.multilineText:
        return TextInputType.multiline;

      case ValueType.string:
        return TextInputType.text;
    }
  }

  // check if input is a password
  bool get _isPassword => valueType == ValueType.password;

  // check input is a multiline text
  bool get _isMultiLine => valueType == ValueType.multilineText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Visual label
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 2),

          // Semantic text field
          Semantics(
            label: semanticsLabel,
            textField: true,
            excludeSemantics: true,
            child: TextField(
              controller: controller,
              keyboardType: _getKeyboardType(),
              maxLines: _isPassword ? 1 : (_isMultiLine ? null : maxLines),
              obscureText: _isPassword,
              decoration: InputDecoration(hintText: placeholder),
            ),
          ),
        ],
      ),
    );
  }
}
