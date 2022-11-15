import 'package:flutter/material.dart';

import '../../common/utils/app_colors.dart';

class BottomBarWidget extends StatelessWidget {
    BottomBarWidget(
      {Key? key,
      required this.leadingText,
      required this.secondText,
      required this.onTap})
      : super(key: key);
  String leadingText;
  String secondText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            leadingText,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              secondText,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  color: AppColors.forgetPassText),
            ),
          )
        ],
      ),
    );
  }
}
