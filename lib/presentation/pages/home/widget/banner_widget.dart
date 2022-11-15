import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/app_colors.dart';

Widget bannerWidget(List banner) {
  int current = 0;
  final CarouselController controller = CarouselController();
  return StatefulBuilder(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(left: 21, right: 21, top: 15),
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: banner.length,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  onPageChanged: (i, reason) {
                    state(() {
                      current = i;
                    });
                  }),
              itemBuilder: (context, i, id) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: CachedNetworkImage(
                          imageUrl: banner[i]["image"],
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              color: AppColors.loginDesc,
                              value: downloadProgress.progress,
                            ),
                          ),
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.75),
                                Colors.transparent,
                                Colors.transparent,
                                Colors.black.withOpacity(0.75)
                              ],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              stops: const [0, 0, 0, 0.6],
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        top: 18,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 120,
                                child: Text(
                                  banner[i]["slogo1"],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textWhite),
                                )),
                            const SizedBox(height: 28),
                            SizedBox(
                                width: 190,
                                child: Text(
                                  banner[i]["slogo2"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textWhite),
                                )),
                            const SizedBox(height: 6),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "for \$" '${banner[i]["price"]}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.green),
                                ),
                                const SizedBox(width: 12),
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
                                      "Book Now",
                                      style: TextStyle(
                                          color: AppColors.textWhite,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: banner.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => controller.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList()),
          ],
        ),
      );
    },
  );
}
