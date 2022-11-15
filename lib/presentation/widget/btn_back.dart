import 'package:flutter/material.dart';
import '../../common/utils/app_colors.dart';

class BackBtnWidget extends StatelessWidget {
  const BackBtnWidget({Key? key, required this.icon, required this.onTap})
      : super(key: key);
  final Icon icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(
            color: AppColors.borderColor,
            borderRadius: BorderRadius.circular(6)),
        child: icon,
      ),
    );
  }
}