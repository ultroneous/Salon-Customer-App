import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_customer_app/common/utils/app_icons.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/widgets/custom_checkbox.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({Key? key}) : super(key: key);

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  int selectedIndex = 0;
  List filterTypes = ['Category', 'Distance', 'Rating'];

  @override
  Widget build(BuildContext context) {
    //  var dHeight = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 121,
              // height: dHeight,
              decoration: BoxDecoration(color: AppColors.borderColor),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                    children: List.generate(filterTypes.length, (index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        // width: dHeight,
                        decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? AppColors.textWhite
                                : Colors.transparent),
                        height: 38,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8),
                            selectedIndex == index
                                ? SvgPicture.asset(
                                    AppIcons.faq,
                                    width: 1,
                                  )
                                : Container(),
                            SizedBox(width: 12),
                            Text(
                              filterTypes[index],
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.loginDesc),
                            ),
                          ],
                        ),
                      ));
                })),
              ),
            )
          ],
        ),
        Column(
          children: [
            selectedIndex == 0
                ? categoryMenu()
                : selectedIndex == 1
                    ? distanceMenu()
                    : selectedIndex == 2
                        ? ratingMenu()
                        : Container()
          ],
        )
      ],
    );
  }

  categoryMenu() {
    List categoryList = [
      "Haircut",
      "Styling",
      "Coloring",
      "Mackup",
      "Hair Spa",
      "Shampoo",
      "Nails",
      "Wax",
      "Oil Trearment",
      "Massage",
      "Oil Trearment",
      "Oil Trearment"
    ];
    List isSelected = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];

    return StatefulBuilder(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(left: 28.0, top: 20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(categoryList.length, (index) {
              return SizedBox(
                height: 30,
                child: InkWell(
                  onTap: () {
                    state(() {
                      isSelected[index] = !isSelected[index];
                    });
                  },
                  child: Row(
                    children: [
                      CustomCheckBox(
                          onChanged: () {
                            state(() {
                              isSelected[index] = !isSelected[index];
                            });
                          },
                          value: isSelected[index]),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        categoryList[index],
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.loginDesc),
                      ),
                    ],
                  ),
                ),
              );
            })),
      );
    });
  }

  distanceMenu() {
    double currentSelectedValue = 0.0;
    return StatefulBuilder(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 20),
            child: Row(
              children: [
                Text(
                  "Distance : ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.loginDesc,
                  ),
                ),
                Text(
                  "Any",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlack,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: SizedBox(
                height: 280,
                child: SfSliderTheme(
                  data: SfSliderThemeData(
                    activeDividerStrokeWidth: 7,
                    activeDividerStrokeColor: AppColors.loginDesc,
                    inactiveDividerStrokeWidth: 7,
                    inactiveDividerStrokeColor: AppColors.borderColor,
                    activeDividerRadius: 7,
                    inactiveDividerRadius: 7,
                    thumbRadius: 0,
                    inactiveTrackHeight: 4,
                    activeTrackHeight: 4,
                    activeLabelStyle: TextStyle(
                        color: AppColors.textBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    inactiveLabelStyle: TextStyle(
                        color: AppColors.textBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  child: SfSlider.vertical(
                    min: 0.0,
                    max: 40.0,
                    interval: 10,
                    stepSize: 10,
                    labelPlacement: LabelPlacement.onTicks,
                    enableTooltip: true,
                    showLabels: true,
                    tooltipTextFormatterCallback:
                        (dynamic actualValue, String formattedText) {
                      return '$formattedText km';
                    },
                    labelFormatterCallback:
                        (dynamic actualValue, String formattedText) {
                      return '$formattedText km';
                    },
                    activeColor: AppColors.loginDesc,
                    inactiveColor: AppColors.borderColor,
                    showDividers: true,
                    value: currentSelectedValue.toInt(),
                    onChanged: (newValue) {
                      state(() {
                        currentSelectedValue = newValue;
                      });
                    },
                  ),
                )),
          ),
        ],
      );
    });
  }

  ratingMenu() {
    List ratingList = [
      "4 star and up",
      "3 star and up",
      "2 star and up",
      "1 star and up"
    ];
    List isSelected = [false, false, false, false];
    return StatefulBuilder(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(ratingList.length, (index) {
              return SizedBox(
                height: 30,
                //width: MediaQuery.of(context).size.width * 0.5,
                child: InkWell(
                  onTap: () {
                    state(() {
                      isSelected[index] = !isSelected[index];
                    });
                  },
                  child: Row(
                    children: [
                      CustomCheckBox(
                          onChanged: () {
                            state(() {
                              isSelected[index] = !isSelected[index];
                            });
                          },
                          value: isSelected[index]),
                      const SizedBox(width: 10),
                      Text(
                        ratingList[index],
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.loginDesc),
                      ),
                    ],
                  ),
                ),
              );
            })),
      );
    });
  }
}
