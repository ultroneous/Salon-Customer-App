import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';

class BtnIconWidget extends StatelessWidget {
  const BtnIconWidget({Key? key, required this.icon, required this.onTap})
      : super(key: key);
  final SvgPicture icon;
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
          child: Center(
            child: icon,
          )),
    );
  }
}
