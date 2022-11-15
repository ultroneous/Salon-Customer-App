import 'package:flutter/cupertino.dart';
import 'package:salon_customer_app/common/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({Key? key, required this.categories}) : super(key: key);
  final List categories;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 14.0,
        mainAxisSpacing: 14.0,
        childAspectRatio: 1 / 1.3,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * .10,
              width: MediaQuery.of(context).size.width / 4.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.textWhite,
                    AppColors.borderColor,
                  ],
                ),
              ),
              child: ClipRect(
                child: SvgPicture.network(
                  categories[index]["image"],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              categories[index]["name"],
              style: TextStyle(
                  color: AppColors.textBlack,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        );
      },
    );
  }
}