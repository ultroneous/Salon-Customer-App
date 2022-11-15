import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_customer_app/common/utils/app_icons.dart';
import 'package:salon_customer_app/presentation/pages/salon%20list/widgets/booking_button.dart';

import '../../../../common/utils/app_colors.dart';
import 'shadow_container.dart';

class SalonListWidget extends StatelessWidget {
  SalonListWidget({Key? key, required this.salonList, required this.searchText})
      : super(key: key);
  final salonList;
  String searchText;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: salonList.length,
        itemBuilder: (context, index) {
          if (searchText.isEmpty) {
            return salonListItems(context, index);
          } else if (salonList[index]['salonName']
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase())) {
            return salonListItems(context, index);
          }
          return Container();
        });
  }

  salonListItems(context, index) {
    final dWidth = MediaQuery.of(context).size.width;
    return ShadowContainer(
      child: Container(
        margin: const EdgeInsets.only(left: 8, top: 2, bottom: 2, right: 8),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 90.00,
                width: 90.00,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(salonList[index]["images"][0]),
                      //AssetImage(AppImages.salonDummy)
                    )),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        salonList[index]["salonName"].toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBlack),
                      ),
                      SizedBox(
                        width: dWidth * 0.35,
                      ),
                      Row(
                        children: [
                          Icon(Icons.star,
                              size: 14, color: AppColors.starColor),
                          const SizedBox(width: 3),
                          Text(
                            salonList[index]["salonRating"].toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.loginDesc),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.location, height: 10, width: 8),
                      SizedBox(width: 7),
                      SizedBox(
                        width: dWidth * 0.6,
                        child: FittedBox(
                          child: Text(
                            salonList[index]["address"].toString(),
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.loginDesc),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mon & Tue : Closed",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.loginDesc),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Wed to Sunday : 12:00 – 8:00 PM",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: AppColors.loginDesc),
                          ),
                          SizedBox(
                            width: dWidth / 8.0,
                          ),
                          FittedBox(
                            child: BookingButton(
                                title: "Book Now", onpressed: () {}),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
