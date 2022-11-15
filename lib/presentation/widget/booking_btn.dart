import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon_customer_app/common/utils/app_colors.dart';

class BookingBtn extends StatelessWidget {
  const BookingBtn({Key? key, required this.title, required this.color, required this.textcolor})
      : super(key: key);
  final String title;
  final color;
  final textcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color,
        border: Border.all(color: AppColors.borderColor)
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: textcolor),
        ),
      ),
    );
  }
}
