import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';

class RInputField extends StatelessWidget {
  /// InputFiled (TextFormField) with underline border

  const RInputField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.label,
    required this.textInputType,
    required this.validator,
    this.fontSize = 12,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint, label;
  final TextInputType textInputType;
  final String? Function(String?) validator;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.w500),
              )),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 46,
            child: TextFormField(
              cursorColor: greyDark,
              controller: controller,
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: TextStyle(
                  fontSize: fontSize,
                  color: greyDark,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                      color: const Color(0xFFC7C7CC),
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500),
                  fillColor: const Color(0xfff4f4f4),
                  filled: true,
                  contentPadding: const EdgeInsets.only(left: 24, bottom: 6),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(color: Color(0xFFE7E7E7)),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
