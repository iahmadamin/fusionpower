import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';

class UInputField extends StatelessWidget {
  /// InputFiled (TextFormField) with underline border

  const UInputField(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.textInputType,
      required this.validator})
      : super(key: key);

  final TextEditingController controller;
  final String hint;
  final TextInputType textInputType;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: TextFormField(
        cursorColor: greyDark,
        controller: controller,
        style: const TextStyle(
            fontSize: 12, color: greyDark, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
                color: Color(0xFFC7C7CC),
                fontSize: 12,
                fontWeight: FontWeight.w500),
            isDense: true,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 32, maxHeight: 32),
            contentPadding: const EdgeInsets.only(left: 8, bottom: 6),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE7E7E7)),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE7E7E7)),
            )),
      ),
    );
  }
}
