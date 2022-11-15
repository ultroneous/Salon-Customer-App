import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_customer_app/common/utils/app_colors.dart';
import 'package:salon_customer_app/common/utils/app_icons.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: (MediaQuery.of(context).size.width * 75) / 100,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Stack(
              children: [
                SizedBox(
                  height: 190,
                  child: Image.asset(
                    AppIcons.registerbackground,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  top: (MediaQuery.of(context).size.height * 10.5) / 100,
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
                      const SizedBox(height: 10),
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
                  ),
                )
              ],
            ),
          ),
          _drawerList(
            AppIcons.myAccount,
            "My Account",
          ),
          _divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/mybooking");
            },
            child: _drawerList(
              AppIcons.myBooking,
              "My Booking",
            ),
          ),
          _divider(),
          _drawerList(
            AppIcons.favourite,
            "Favorite",
          ),
          _divider(),
          _drawerList(
            AppIcons.share,
            "Share Application",
          ),
          _divider(),
          _drawerList(
            AppIcons.calendarIcon,
            "Manage Calender",
          ),
          _divider(),
          _drawerList(
            AppIcons.settings,
            "Settings",
          ),
          _divider(),
          _drawerList(
            AppIcons.help,
            "Help",
          ),
          _divider(),
          _drawerList(
            AppIcons.faq,
            "FAQ",
          ),
          _divider(),
        ],
      ),
    );
  }

  Widget _drawerList(String suffixIcon, String title) {
    return SizedBox(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 15,
            ),
            SvgPicture.asset(
              suffixIcon,
              width: 20,
              height: 20,
              color: AppColors.loginDesc,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlack,
              ),
            ),
          ],
        ));
  }

  Widget _divider() {
    return Divider(
      color: AppColors.loginDesc,
    );
  }
}
