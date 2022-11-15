import 'package:flutter/material.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../widget/custom_title.dart';

Widget mostpopukerWidget(List mostpopuler) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTitle(
        onTap: () {},
        title: "Most Popular Salons",
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                mostpopuler.length,
                (index) => GestureDetector(
                      onTap: () {},
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          width: 135,
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
                                      mostpopuler[index]['images'][0],
                                      height: 140,
                                      fit: BoxFit.cover,
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(7, 7, 7, 7),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                mostpopuler[index]['salonName'],
                                                style: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.loginDesc,
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  children: [
                                                    const WidgetSpan(
                                                      child: Icon(Icons.star,
                                                          size: 12,
                                                          color: Colors.yellow),
                                                    ),
                                                    TextSpan(
                                                      text: mostpopuler[index]
                                                              ['salonRating']
                                                          .toString(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          RichText(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                style: TextStyle(
                                                    color: AppColors.loginDesc,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: [
                                                  WidgetSpan(
                                                    child: Icon(Icons.call,
                                                        size: 12,
                                                        color: AppColors
                                                            .loginDesc),
                                                  ),
                                                  TextSpan(
                                                    text: mostpopuler[index]
                                                            ['mobileNo']
                                                        .toString(),
                                                  ),
                                                ],
                                              ))
                                        ]))
                              ])),
                    )),
          ),
        ),
      ),
    ],
  );
}
