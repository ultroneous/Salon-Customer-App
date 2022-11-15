import 'package:flutter/material.dart';
import 'package:salon_customer_app/presentation/widget/btn_back.dart';
import '../../common/utils/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  final String text;

  const AppBarWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackBtnWidget(
          icon: Icon(Icons.arrow_back_rounded,color: AppColors.loginDesc,),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(
          flex: 3,
        ),
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppColors.textBlack),
        ),
        const Spacer(
          flex: 4,
        ),
      ],
    );
  }
}
