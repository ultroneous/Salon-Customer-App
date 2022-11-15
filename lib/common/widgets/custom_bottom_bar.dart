import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';


class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key,required this.index,required this.onItemTapped}) : super(key: key);
  final onItemTapped;
  final index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: BottomNavigationBar(
          backgroundColor: AppColors.textWhite,
          currentIndex: index,
          selectedItemColor: Colors.black,
          onTap: onItemTapped,
          elevation: 10.0,
          iconSize: 10,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            height: 1.8,
            fontWeight: FontWeight.w400
          ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              tooltip: "",
              icon: SvgPicture.asset(AppImages.homeTabIcon,
                  height: 17,
                  width: 17,
                  color: index == 0
                      ? AppColors.textBlack
                      : AppColors.loginDesc),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              tooltip: "",
              icon: SvgPicture.asset(AppImages.myOrdersTabIcon,
                height: 19,
                width: 19,
              color: index == 1
                  ? AppColors.textBlack
                  : AppColors.loginDesc,),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              tooltip: "",
              icon: SvgPicture.asset(AppImages.myProfileTabIcon,
                height: 17,
                width: 17,
              color: index == 2
                  ? AppColors.textBlack
                  : AppColors.loginDesc,),
              label: 'My Profile',
            ),
          ],
        ),
    );
  }
}
