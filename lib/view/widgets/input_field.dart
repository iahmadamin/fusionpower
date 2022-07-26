import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusionpower/constant/colors.dart';

class InputField extends StatefulWidget {
  InputField({
    Key? key,
    required this.hint,
    required this.controller,
    this.isPass = false,
    this.textInputType = TextInputType.text,
    required this.validator,
    this.textInputFormatters = const [],
    this.description,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final bool isPass;
  final TextInputType textInputType;
  final String? Function(String?) validator;
  List<TextInputFormatter> textInputFormatters;
  String? description;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _hidePass = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      validator: widget.validator,
      obscureText: widget.isPass ? _hidePass : false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.black,
      inputFormatters: widget.textInputFormatters.isEmpty
          ? [FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))]
          : widget.textInputFormatters,
      style: const TextStyle(
        //color: Clrs.grey900,
        fontSize: 17,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: widget.hint,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: const TextStyle(
            fontSize: 17,
            letterSpacing: 0.4,
            color: Color(0xFFC5C5C7),
            // color: Clrs.grey400,
            fontWeight: FontWeight.w400),
        errorStyle: const TextStyle(
          height: 0.8,
          color: alertRedColor,
          fontSize: 14,
          letterSpacing: 0.5,
        ),
        // fillColor: Clrs.grey25,

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: alertRedColor,
            width: 1,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFB9B9BB),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFB9B9BB), width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        // Password Icon
        suffixIcon: widget.isPass
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _hidePass = !_hidePass;
                  });
                },
                child: Icon(
                  _hidePass
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: const Color(0xFF8E8E93),
                  //  color: _hidePass ? Clrs.grey600 : Clrs.primary,
                ),
              )
            : null,
      ),
    );
  }
}
