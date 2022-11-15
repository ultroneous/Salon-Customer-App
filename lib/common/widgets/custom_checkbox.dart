import 'package:flutter/material.dart';

import '../utils/app_colors.dart';


// ignore: must_be_immutable
class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({Key? key, required this.onChanged, required this.value})
      : super(key: key);
  Function() onChanged;
  bool value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: 21,
        height: 21,
        decoration: BoxDecoration(
            color: value == true
                ? AppColors.borderColor
                : Colors.transparent, //Color(0xFFFFFFFF)
            border: Border.all(width: 1, color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(4)),
        child: Icon(Icons.check,
            color: value == true ? AppColors.loginDesc : Colors.transparent,
            size: 14),
      ),
    );
  }
}
