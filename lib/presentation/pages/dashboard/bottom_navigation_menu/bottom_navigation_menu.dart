import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salon_customer_app/common/utils/app_colors.dart';
import 'package:salon_customer_app/common/utils/app_icons.dart';

class BottomNavigatipnMenu extends StatelessWidget {
  const BottomNavigatipnMenu(
      {Key? key, required this.index, required this.onItemTapped})
      : super(key: key);
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
            fontSize: 12, height: 1.8, fontWeight: FontWeight.w400),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            tooltip: "",
            icon: SvgPicture.asset(AppIcons.homeIcon,
                height: 17,
                width: 17,
                color: index == 0 ? AppColors.textBlack : AppColors.loginDesc),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            tooltip: "",
            icon: SvgPicture.asset(
              AppIcons.categoryIcon,
              height: 19,
              width: 19,
              color: index == 1 ? AppColors.textBlack : AppColors.loginDesc,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            tooltip: "",
            icon: SvgPicture.asset(
              AppIcons.salonListIcon,
              height: 17,
              width: 17,
              color: index == 2 ? AppColors.textBlack : AppColors.loginDesc,
            ),
            label: 'Salon List',
          ),
        ],
      ),
    );
  }
}
