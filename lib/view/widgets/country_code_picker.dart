import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';

class CountryCodePicker extends StatefulWidget {
  const CountryCodePicker({Key? key, this.border = true}) : super(key: key);
  final bool border;

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  int pickedCountryCode = 62;

  List<int> countryCodes = [1, 3, 5, 62, 91, 92, 77, 53, 98, 13, 53];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: widget.border
            ? Border.all(
                color: const Color(0xFFB9B9BB),
              )
            : Border.all(
                color: Colors.transparent,
              ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(4),
        style: const TextStyle(
          fontSize: 17,
          color: labelColorTertiary,
        ),
        underline: const SizedBox(),
        elevation: 0,
        value: pickedCountryCode,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          size: 24,
          color: Color(0xFF8E8E93),
        ),
        items: countryCodes.map((int item) {
          return DropdownMenuItem(
            value: item,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 4,
                right: 4,
              ),
              child: Text(
                '+$item',
              ),
            ),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (int? newValue) {
          setState(
            () {
              pickedCountryCode = newValue!;
            },
          );
        },
      ),
    );
  }
}
