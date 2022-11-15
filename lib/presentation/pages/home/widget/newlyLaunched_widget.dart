import 'package:flutter/material.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../widget/custom_title.dart';

Widget newlyLaunchedWidget(List newlyData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTitle(
        onTap: () {},
        title: "Newly Launched Salons",
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                newlyData.length,
                (index) => GestureDetector(
                      onTap: () {},
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.textWhite,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    child: Image.network(
                                      newlyData[index]["images"][0],
                                      height: 111,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(7, 7, 7, 7),
                                    child: Text(
                                      newlyData[index]["salonName"],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                    ))
                              ])),
                    )),
          ),
        ),
      ),
    ],
  );
}
