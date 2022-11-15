import 'package:flutter/material.dart';
import 'package:salon_customer_app/common/utils/app_colors.dart';
import 'package:salon_customer_app/common/utils/app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/utils/app_string.dart';
import '../../../widget/booking_btn.dart';

class UpComingInfo extends StatelessWidget {
   UpComingInfo({Key? key, required this.upcomingBookingList, required this.upComingDays}) : super(key: key);
  final List upcomingBookingList;
  final List upComingDays;
  final months = AppStrings.months;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        upcomingBookingList.length,
        (index) {
          final day = upComingDays[index].split("-");
          return Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            height: 105,
            decoration: BoxDecoration(
              color: AppColors.textWhite,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppColors.textWhite,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 3, // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(AppIcons.calendarIcon),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            day[2]+" "+months[day[1]] + ", " + day[0],
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textBlack,
                                fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            upcomingBookingList[index]["service"]
                                + " at " +
                                upcomingBookingList[index]["salonName"]
                                + " at " +
                                upcomingBookingList[index]["dateTime"].toString().substring(11,16)+" PM",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.loginDesc),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BookingBtn(
                      title: 'Edit Date/Time',
                      color: AppColors.borderColor,
                      textcolor: AppColors.textBlack,
                    ),
                    BookingBtn(
                      title: 'Cancel Booking',
                      color: AppColors.textWhite,
                      textcolor: AppColors.loginDesc,
                    ),
                  ],
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
