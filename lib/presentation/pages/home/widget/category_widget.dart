import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../widget/custom_title.dart';

Widget categoryWidget(List category) {
  return Column(
    children: [
      CustomTitle(
        onTap: () {},
        title: "Category",
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
          height: 85,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (_, index) {
                return InkWell(
                  splashColor: Colors.grey.withOpacity(0.1),
                  onTap: () {},
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    width: 70,
                    padding: const EdgeInsets.only(right: 8, left: 5, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 51.0,
                          height: 51.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    AppColors.textWhite,
                                    AppColors.borderColor,
                                  ])),
                          child: Center(
                            child: SvgPicture.network(
                              category[index]["image"],
                              height: 31,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          category[index]["name"],
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          //overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF0C1A30).withOpacity(0.8)),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    ],
  );
}
