import 'package:flutter/material.dart';
import 'package:salon_customer_app/common/utils/app_colors.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key, required this.onTap, required this.title})
      : super(key: key);
  final Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 17, 21, 17),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        InkWell(
            onTap: onTap,
            child: Text(
              "View all",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.loginDesc),
            ))
      ]),
    );
  }
}
