import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../common/utils/app_colors.dart';


class BookingButton extends StatelessWidget {
  final String title;
  final Function onpressed;
  const BookingButton({Key? key, required this.title, required this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onpressed();
      },
      child: Container(
          height: 20,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.borderColor
          ),
          child:
          Center(
            child: Text(
                title,
                style:
                TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: AppColors.textBlack)),
          )
      ),
    );
  }
}
