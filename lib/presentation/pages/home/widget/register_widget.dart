import 'package:flutter/material.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/app_icons.dart';

Widget registerWidget() {
  return Padding(
    padding: const EdgeInsets.all(21.0),
    child: Stack(
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            child: Image.asset(
              AppIcons.registerbackground,
              height: 185,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Positioned.fill(
            child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.8)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0, 0, 0.6],
                  ),
                ))),
        Positioned.fill(
            top: 99,
            child: Column(
              children: [
                SizedBox(
                  width: 180,
                  child: RichText(
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      children: [
                        const TextSpan(
                          text: "Want to ",
                        ),
                        TextSpan(
                          text: "Register",
                          style: TextStyle(
                              color: AppColors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const TextSpan(
                          text: " your",
                        ),
                        TextSpan(
                          text: " Salon",
                          style: TextStyle(
                              color: AppColors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const TextSpan(
                          text: " with us ?",
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 87,
                  height: 23,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.4),
                        blurRadius: 3,
                      ),
                    ],
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Center(
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}
