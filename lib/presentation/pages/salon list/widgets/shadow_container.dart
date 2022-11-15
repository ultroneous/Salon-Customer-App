import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/app_colors.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  const ShadowContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 18,right: 18,bottom: 20),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.textWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 3,
            ),
          ],
        ),
        child:child
    );
  }
}
